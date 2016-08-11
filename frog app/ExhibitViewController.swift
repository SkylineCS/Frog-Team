//
//  ExhibitViewController.swift
//  frog app
//
//  Created by Mac User on 8/11/16.
//  Copyright © 2016 the juan and only. All rights reserved.
//

import UIKit

class ExhibitViewController: UIViewController {
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Slider: UISlider!
    @IBAction func SliderChanged(sender: AnyObject) {
        self.view.backgroundColor = UIColor(
            red: CGFloat(Slider.value) / 2,
            green: CGFloat(Slider.value) + 0.5,
            blue: CGFloat(Slider.value), alpha: 1)
        Label.text = String(Slider.value)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
