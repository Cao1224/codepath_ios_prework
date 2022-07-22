//
//  SettingsViewController.swift
//  Prework
//
//  Created by Yuancheng Cao on 7/11/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var darkModelLabel: UILabel!
    @IBOutlet weak var switchButton: UISwitch!
    let switchKeyConstant = "switchKeyName"
    
    @IBOutlet weak var customizeTip: UILabel!
    @IBOutlet weak var rateOneText: UILabel!
    @IBOutlet weak var rateTwoText: UILabel!
    @IBOutlet weak var rateThreeText: UILabel!
    
    @IBOutlet weak var saveOneText: UILabel!
    @IBOutlet weak var editOneText: UILabel!
    
    @IBOutlet weak var saveTwoText: UILabel!
    @IBOutlet weak var editTwoText: UILabel!
    
    @IBOutlet weak var saveThreeText: UILabel!
    @IBOutlet weak var editThreeText: UILabel!
    
    @IBOutlet weak var numberOfPeople: UILabel!
    
    @IBOutlet weak var rate1Switch: UISwitch!
    @IBOutlet weak var rate2Switch: UISwitch!
    @IBOutlet weak var rate3Switch: UISwitch!
    @IBOutlet weak var rate1TextField: UITextField!
    @IBOutlet weak var rate2TextField: UITextField!
    @IBOutlet weak var rate3TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peopleCountTextField.backgroundColor = UIColor.lightGray;
        if (UserDefaults.standard.bool(forKey: "switchKeyName")) {
            Settings.sharedInstance.backgroundColor = UIColor.black;
            Settings.sharedInstance.textColor = UIColor.white;
        } else {
            Settings.sharedInstance.backgroundColor = UIColor.white;
            Settings.sharedInstance.textColor = UIColor.black;
        }
        self.view.backgroundColor = Settings.sharedInstance.backgroundColor;
        darkModelLabel.textColor = Settings.sharedInstance.textColor;
        customizeTip.textColor = Settings.sharedInstance.textColor;
        rateOneText.textColor = Settings.sharedInstance.textColor;
        rateTwoText.textColor = Settings.sharedInstance.textColor;
        rateThreeText.textColor = Settings.sharedInstance.textColor;
        saveOneText.textColor = Settings.sharedInstance.textColor;
        saveTwoText.textColor = Settings.sharedInstance.textColor;
        saveThreeText.textColor = Settings.sharedInstance.textColor;
        editOneText.textColor = Settings.sharedInstance.textColor;
        editTwoText.textColor = Settings.sharedInstance.textColor;
        editThreeText.textColor = Settings.sharedInstance.textColor;
        numberOfPeople.textColor = Settings.sharedInstance.textColor;
        
        peopleCountTextField.textColor = Settings.sharedInstance.textColor;
        peopleStepper.tintColor = Settings.sharedInstance.textColor;
        // Do any additional setup after loading the view.
        if (UserDefaults.standard.bool(forKey: switchKeyConstant)) {
            switchButton.isOn = true
        } else {
            switchButton.isOn = false
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.view.backgroundColor = Settings.sharedInstance.backgroundColor;
        darkModelLabel.textColor = Settings.sharedInstance.textColor;
        customizeTip.textColor = Settings.sharedInstance.textColor;
        rateOneText.textColor = Settings.sharedInstance.textColor;
        rateTwoText.textColor = Settings.sharedInstance.textColor;
        rateThreeText.textColor = Settings.sharedInstance.textColor;
        saveOneText.textColor = Settings.sharedInstance.textColor;
        saveTwoText.textColor = Settings.sharedInstance.textColor;
        saveThreeText.textColor = Settings.sharedInstance.textColor;
        editOneText.textColor = Settings.sharedInstance.textColor;
        editTwoText.textColor = Settings.sharedInstance.textColor;
        editThreeText.textColor = Settings.sharedInstance.textColor;
        numberOfPeople.textColor = Settings.sharedInstance.textColor;
        
        peopleCountTextField.textColor = Settings.sharedInstance.textColor;
        peopleStepper.tintColor = Settings.sharedInstance.textColor;
    }
    
    @IBAction func darkModeSwitch(_ sender: Any) {
        UserDefaults.standard.set(switchButton.isOn, forKey: switchKeyConstant)
        if (switchButton.isOn) {
            Settings.sharedInstance.backgroundColor = UIColor.black;
            Settings.sharedInstance.textColor = UIColor.white;
        }
        if (!switchButton.isOn){
            Settings.sharedInstance.backgroundColor = UIColor.white;
            Settings.sharedInstance.textColor = UIColor.black;
        }
        self.view.backgroundColor = Settings.sharedInstance.backgroundColor;
        darkModelLabel.textColor = Settings.sharedInstance.textColor;
        customizeTip.textColor = Settings.sharedInstance.textColor;
        rateOneText.textColor = Settings.sharedInstance.textColor;
        rateTwoText.textColor = Settings.sharedInstance.textColor;
        rateThreeText.textColor = Settings.sharedInstance.textColor;
        saveOneText.textColor = Settings.sharedInstance.textColor;
        saveTwoText.textColor = Settings.sharedInstance.textColor;
        saveThreeText.textColor = Settings.sharedInstance.textColor;
        editOneText.textColor = Settings.sharedInstance.textColor;
        editTwoText.textColor = Settings.sharedInstance.textColor;
        editThreeText.textColor = Settings.sharedInstance.textColor;
        numberOfPeople.textColor = Settings.sharedInstance.textColor;
        
        peopleCountTextField.textColor = Settings.sharedInstance.textColor;
        peopleStepper.tintColor = Settings.sharedInstance.textColor;
    }
    
    @IBAction func rate1SwitchChanged(_ sender: Any) {
        if(rate1Switch.isOn) {
            rate1TextField.isUserInteractionEnabled=true
            self.rate1TextField.backgroundColor=UIColor.white
        }
        else {
            let defaults=UserDefaults.standard
            var rate1Text:String=rate1TextField.text!
            rate1Text=rate1Text.replacingOccurrences(of:"%", with: "")
            defaults.set(rate1Text+"%", forKey: "rate1")
            defaults.synchronize()
            rate1TextField.isUserInteractionEnabled=false
        }
    }

    @IBAction func rate2SwitchChanged(_ sender: Any) {
        if(rate2Switch.isOn) {
            self.rate2TextField.isUserInteractionEnabled=true
            self.rate2TextField.backgroundColor=UIColor.white
        }
        else {
            let defaults=UserDefaults.standard
            var rate2Text:String=rate2TextField.text!
            rate2Text=rate2Text.replacingOccurrences(of:"%", with: "")
            defaults.set(rate2Text+"%", forKey: "rate2")
            defaults.synchronize()
            self.rate2TextField.isUserInteractionEnabled=false
            self.rate2TextField.backgroundColor=UIColor.lightGray
        }
    }
    
    @IBAction func rate3SwitchChanged(_ sender: Any) {
        if(rate3Switch.isOn)
        {
            self.rate3TextField.isUserInteractionEnabled=true
            self.rate3TextField.backgroundColor=UIColor.white
        }
        else
        {
            let defaults=UserDefaults.standard
            var rate3Text:String=rate3TextField.text!
            rate3Text=rate3Text.replacingOccurrences(of:"%", with: "")
            defaults.set(rate3Text+"%", forKey: "rate3")
            defaults.synchronize()
            self.rate3TextField.isUserInteractionEnabled=false
            self.rate3TextField.backgroundColor=UIColor.lightGray
        }
    }
    
    @IBOutlet weak var peopleCountTextField: UITextField!
    @IBOutlet weak var peopleStepper: UIStepper!
    
    @IBAction func StepperChanged(_ sender: Any) {
        var num: Double = self.peopleStepper.value
        if (num == 0.0) {
            self.peopleStepper.value = 1.0
            num = 1.0
        }
        
        self.peopleCountTextField.text = String(Int(num))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults=UserDefaults.standard
        let rate1:String = defaults.object(forKey: "rate1") as? String ?? ""
        let rate2:String = defaults.object(forKey: "rate2") as? String ?? ""
        let rate3:String = defaults.object(forKey: "rate3") as? String ?? ""
        let pCount:Double = defaults.object(forKey: "pCount") as? Double ?? 1.0
        if (rate1 != "")
        {
            self.rate1TextField.text=rate1
        }
        if (rate2 != "")
        {
            self.rate2TextField.text=rate2
        }
        self.peopleStepper.value = pCount
        self.peopleCountTextField.text=String(Int(pCount))
        self.peopleCountTextField.text=String(Int(pCount))
        if (rate3 != "")
        {
            self.rate3TextField.text=rate3
        }
        self.rate1TextField.isUserInteractionEnabled=false
        self.rate2TextField.isUserInteractionEnabled=false
        self.rate3TextField.isUserInteractionEnabled=false
        self.rate1TextField.backgroundColor=UIColor.lightGray
        self.rate2TextField.backgroundColor=UIColor.lightGray
        self.rate3TextField.backgroundColor=UIColor.lightGray
        self.rate1Switch.setOn(false,animated:animated)
        self.rate2Switch.setOn(false,animated: animated)
        self.rate3Switch.setOn(false, animated: animated)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let defaults=UserDefaults.standard
        defaults.set((Double(self.peopleCountTextField.text!)), forKey:"pCount")
    }
}
