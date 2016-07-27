//
//  CalculatorSinglePhaseViewController.swift
//  ComEd
//
//  Created by Meredith Mottonen on 7/13/16.
//  Copyright © 2016 Mottonen. All rights reserved.
//

import UIKit

class CalculatorSinglePhaseViewController: UIViewController {
    
    @IBOutlet var calculationLabel: UILabel!
    @IBOutlet var vTextField: UITextField!
    @IBOutlet var kvaTextField: UITextField!
    
    var vValue: Double? {
        didSet {
            updateCalculationLabel()
        }
    }
    
    var kvaValue: Double? {
        didSet {
            updateCalculationLabel()
        }
    }
    
    
    @IBAction func vFieldEditingChanges(textField: UITextField) {
        if let text = vTextField.text, let number = numberFormatter.numberFromString(text) {
            vValue = number.doubleValue
        }
        else {
            vValue = nil
        }
    }
    
    @IBAction func kvaFieldEditingChanges(textField: UITextField) {
        if let text = vTextField.text, let number = numberFormatter.numberFromString(text) {
            kvaValue = number.doubleValue
        }
        else {
            kvaValue = nil
        }
    }
    
    var calculationValue: Double? {
        
        let vValue : Double = Double(NSString(string: vTextField.text!).doubleValue)
        let kvaValue : Double = Double(NSString(string: kvaTextField.text!).doubleValue)
        
        return ((1000*kvaValue)/vValue)
    }
    
    let numberFormatter: NSNumberFormatter = {
        let nf = NSNumberFormatter()
        nf.numberStyle = .DecimalStyle
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        vTextField.resignFirstResponder()
        kvaTextField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.tabBarItem = UITabBarItem(title: "Single Phase", image: UIImage(named: "ComEd_logo_svg"), selectedImage: UIImage(named: "ComEd_logo_svg.png"))
    }
    
    
    func updateCalculationLabel() {
        if let value = calculationValue {
            calculationLabel.text = numberFormatter.stringFromNumber(value)
        }
        else {
            calculationLabel.text = "???"
        }
    }
}