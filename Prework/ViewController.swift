//
//  ViewController.swift
//  Prework
//
//  Created by Yuancheng Cao on 6/18/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var perPersonAmount: UILabel!
    
    @IBOutlet weak var billAmountText: UILabel!
    @IBOutlet weak var tipText: UILabel!
    @IBOutlet weak var totalText: UILabel!
    @IBOutlet weak var perPersonText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.backgroundColor = UIColor.lightGray;
        // Do any additional setup after loading the view.
        if (UserDefaults.standard.bool(forKey: "switchKeyName")) {
            Settings.sharedInstance.backgroundColor = UIColor.black;
            Settings.sharedInstance.textColor = UIColor.white;
        }
        else {
            Settings.sharedInstance.backgroundColor = UIColor.white;
            Settings.sharedInstance.textColor = UIColor.black;
        }
        switchColor();
        self.title = "Tip Calculator"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        switchColor();
        billAmountTextField.becomeFirstResponder();
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let rate1:String = defaults.object(forKey: "rate1") as? String ?? ""
        let rate2:String = defaults.object(forKey: "rate2") as? String ?? ""
        let rate3:String = defaults.object(forKey: "rate3") as? String ?? ""
        
        if (rate1 != "") {
            self.tipControl.setTitle(rate1, forSegmentAt: 0)
        }
        if (rate2 != "") {
            self.tipControl.setTitle(rate2, forSegmentAt: 1)
        }
        if (rate3 != "") {
            self.tipControl.setTitle(rate3, forSegmentAt: 2)
        }
        calculateTip(animated as AnyObject)
    }
    
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        let billAmountString = self.billAmountTextField.text?.replacingOccurrences(of: "$", with: "")
        // Get bill amount from text field input
        let billAmount = Double(billAmountString!) ?? 0
        
        // Making tip control with 3 different rate
        var tipPercentageString = String(self.tipControl.titleForSegment(at: self.tipControl.selectedSegmentIndex)!)
        tipPercentageString = tipPercentageString.replacingOccurrences(of: "%", with: "")
        
        // Get tip percent
        let tipPercent=Double(tipPercentageString) ?? 0
        
        // Calculate tip amount
        let tipAmount:Double=Double(billAmount * tipPercent / 100)
        self.tipAmountLabel.text = String(format:"$%.2f", tipAmount)
        
        // Calculate total amount with tip amount and bill amount
        self.totalLabel.text = String(format:"$%.2f",tipAmount + billAmount)
        
        // Get number of people
        let pCount: Double =  defaults.object(forKey:"pCount") as? Double ?? 0
        self.perPersonAmount.text = String(format:"$%.2f",(tipAmount+billAmount) / pCount)
    }

    func switchColor() {
        self.view.backgroundColor = Settings.sharedInstance.backgroundColor;
        //billAmountTextField.textColor = Settings.sharedInstance.textColor;
        tipAmountLabel.textColor = Settings.sharedInstance.textColor;
        tipControl.tintColor = Settings.sharedInstance.textColor;
        totalLabel.textColor = Settings.sharedInstance.textColor;
        perPersonAmount.textColor = Settings.sharedInstance.textColor;
        billAmountText.textColor = Settings.sharedInstance.textColor;
        tipText.textColor = Settings.sharedInstance.textColor;
        totalText.textColor = Settings.sharedInstance.textColor;
        perPersonText.textColor = Settings.sharedInstance.textColor;
    }
}

