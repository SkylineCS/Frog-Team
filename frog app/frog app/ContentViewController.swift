//
//  ContentViewController.swift
//  frog app
//
//  Created by Mac User on 7/21/16.
//  Copyright © 2016 the juan and only. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    @IBOutlet weak var TextField: UITextView!
    @IBOutlet weak var ImageView: UIImageView!
    
    var pageIndex: Int!
    var pageText: String!
    var imageFile: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ImageView.image = UIImage(named: self.imageFile)
        self.TextField.text = self.pageText

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
