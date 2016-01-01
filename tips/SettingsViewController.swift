//
//  SettingsViewController.swift
//  tips
//
//  Created by rajesh on 12/14/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipSelectingControl: UISegmentedControl!
    
    @IBOutlet weak var editorSelectingControl: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //make 3 tip percentage to read as default
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        let lowestTip = userDefaults.floatForKey("Lowest_tip")
        let middleTip = userDefaults.floatForKey("middle_tip")
        let highestTip = userDefaults.floatForKey("highest_tip")
        
        print("\(lowestTip)")
        print("\(middleTip)")
        print("\(highestTip)")
        
        let lowestValue = roundf(lowestTip * 100)
        let middleValue = roundf(middleTip * 100)
        let highestValue = roundf(highestTip * 100)
        
        // this will update a tip selecting control to tip segment value
        
        tipSelectingControl.setTitle("\(lowestValue)%", forSegmentAtIndex: 0)
        tipSelectingControl.setTitle("\(middleValue)%", forSegmentAtIndex: 1)
        tipSelectingControl.setTitle("\(highestValue)%", forSegmentAtIndex: 2)
        
        NSUserDefaults.standardUserDefaults().synchronize()
        print("your_view_will_be_appear")
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("your_view_did_appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("your_view_will_be_disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("view_did_disappear")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tipSelectingControl(sender: AnyObject) {
    }
    
    @IBAction func editorSelectingControl(sender: AnyObject) {
        
        let newValue = "\(roundf(editorSelectingControl.value))%"
        tipSelectingControl.setTitle(newValue, forSegmentAtIndex: tipSelectingControl.selectedSegmentIndex)
        print(newValue)
      
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let newFloatValue : Float = roundf(editorSelectingControl.value) / 100.0
        
        if (tipSelectingControl.selectedSegmentIndex == 0) {
            userDefaults.setFloat(newFloatValue, forKey: "lowest_tip")
        }
    
        else if (tipSelectingControl.selectedSegmentIndex == 1) {
            userDefaults.setFloat(newFloatValue, forKey: "middle_tip")
        }
        
        else if (tipSelectingControl.selectedSegmentIndex == 2) {
            userDefaults.setFloat(newFloatValue, forKey: "highest_tip")
            
        }
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
