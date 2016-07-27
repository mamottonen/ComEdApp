//
//  CalculatorThreePhaseViewController.swift
//  ComEd
//
//  Created by Meredith Mottonen on 7/13/16.
//  Copyright © 2016 Mottonen. All rights reserved.
//

import Foundation
import UIKit

class CalculatorThreePhaseViewController: UIViewController {
 
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
            kvaValue = number.doubleValue
        }
        else {
            kvaValue = nil
        }
    }
    
    @IBAction func kvaFieldEditingChanges(textField: UITextField) {
        if let text = vTextField.text, let number = numberFormatter.numberFromString(text) {
            vValue = number.doubleValue
        }
        else {
            vValue = nil
        }
    }
    
    var calculationValue: Double? {
        
        let vValue : Double = Double(NSString(string: vTextField.text!).doubleValue)
        let kvaValue : Double = Double(NSString(string: kvaTextField.text!).doubleValue)
        
        return ((1000*kvaValue)/(sqrt(3)*vValue))
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
        
        navigationItem.title = String("Three Phase")
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