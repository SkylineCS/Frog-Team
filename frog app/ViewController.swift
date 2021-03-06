//
//  ViewController.swift
//  frog app
//
//  Created by Mac User on 7/7/16.
//  Copyright © 2016 the juan and only. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    
    var pageViewController: UIPageViewController!
    var pageTextArr: NSArray!
    var pageImages: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.pageTextArr = NSArray(objects:
            "This is the lake Titicaca Frog, the endangered animal who lives on the fringes of the 1000mi2 lake.",
            "This is the Denver zoo, the afiliate and proxy to scientists in peru who are looking at bringing the frog back.")
        self.pageImages = NSArray(objects: "Frog2", "DZoo")
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        
        self.pageViewController.dataSource = self
        
        let startVC = self.viewControllerAtIndex(0) as ContentViewController
        let viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers((viewControllers as! [UIViewController]), direction: .Forward, animated: true, completion: nil)
        self.pageViewController.view.frame = CGRectMake(0, 49, self.view.frame.width, self.view.frame.size.height - 60)
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewControllerAtIndex(index: Int) -> ContentViewController {
        if ((self.pageTextArr.count == 0) || (index >= self.pageTextArr.count)) {
            return ContentViewController()
        }
        
        let vc: ContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as! ContentViewController
        vc.imageFile = self.pageImages[index] as! String
        vc.pageText = self.pageTextArr[index] as! String
        vc.pageIndex = index
        return vc
        
    }
    
    
    
    // MARK: - Page View Controller Data Source
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        
        if (index == 0) || index == NSNotFound {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        
        if (index == NSNotFound)
        {
            return nil
        }
        index += 1
        
        if (index == self.pageTextArr.count) {
            return nil
        }
        return self.viewControllerAtIndex(index)
        
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pageTextArr.count
    }
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }


}

