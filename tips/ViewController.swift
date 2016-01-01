//
//  ViewController.swift
//  tips
//
//  Created by rajesh on 12/14/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    var lowestTip: Float!
    var middleTip: Float!
    var highestTip: Float!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        
        let defaults = NSUserDefaults.standardUserDefaults()
        billField.text = defaults.stringForKey("savedAmt")
        tipLabel.text = defaults.stringForKey("savedTip")
        totalLabel.text = defaults.stringForKey("savedTotal")
        tipControl.selectedSegmentIndex = defaults.integerForKey("myPer")
        billField.becomeFirstResponder()
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        updateOurCalculation()
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        //this will apply 3 tip percent value from defaults
        
        let lowestTip = userDefaults.floatForKey("lowest_tip")
        let middleTip = userDefaults.floatForKey("middle_tip")
        let highestTip = userDefaults.floatForKey("highest_tip")
        
        print("\(lowestTip)")
        print("\(middleTip)")
        print("\(highestTip)")
        
       // let lowestValue = roundf(lowestTip * 100)
       // let middleValue = roundf(middleTip * 100)
       // let highestValue = roundf(highestTip * 100)
        
        
        
        tipControl.setTitle("\(lowestTip)%", forSegmentAtIndex: 0)
        tipControl.setTitle("\(middleTip)%", forSegmentAtIndex: 1)
        tipControl.setTitle("\(highestTip)%", forSegmentAtIndex: 2)
        
        print("view_will_appear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        let ourText = billField.text
        let ourTip = tipLabel.text
        let ourTotal = totalLabel.text
        let selectedPercentage = tipControl.selectedSegmentIndex
        
        NSUserDefaults.standardUserDefaults().setObject(ourText, forKey: "amountSaved")
        NSUserDefaults.standardUserDefaults().setObject(ourTip, forKey: "tipSaved")
        NSUserDefaults.standardUserDefaults().setObject(ourTotal, forKey: "totalSaved")
        NSUserDefaults.standardUserDefaults().setObject(selectedPercentage, forKey: "ourPercentage")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        print("View_will_disappear")
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
     updateOurCalculation()
    }
    func updateOurCalculation() {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        var tipPercentage = [0.15, 0.20, 0.24]
        
        let lowestTipSaved = defaults.doubleForKey("lowest_tip")
        let middleTipSaved = defaults.doubleForKey("meddle_tip")
        let highestTipSaved = defaults.doubleForKey("highest_tip")
        
        if lowestTipSaved > 0.0 && middleTipSaved > 0.0 && highestTipSaved > 0.0 {
            
            tipPercentage = [ lowestTipSaved, middleTipSaved, highestTipSaved ]
        }
        
        
        let tipPercentage1 = tipPercentage[tipControl.selectedSegmentIndex]
        let billAmount = (billField.text! as NSString).doubleValue
        
        let tip = billAmount * tipPercentage1
        
        let total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
    }
       @IBAction func onSegmentedControlChanged(sender: AnyObject) {
        
        if sender.selectedSegmentIndex == 0 {
            
            print("lowest_tip")
            
        }else if sender.selectedSegmentIndex == 1{
            print("middle_tip")
            
        } else{
            print("highest_tip")
        }
        
    }


    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

    
}

