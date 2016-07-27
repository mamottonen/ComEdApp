//
//  ClearanceByVoltageTableViewController.swift
//  ComEd
//
//  Created by Meredith Mottonen on 6/29/16.
//  Copyright © 2016 Mottonen. All rights reserved.
//

import UIKit

class ClearanceByVoltageTableViewController: UITableViewController {
    
    var clearanceData = [ClearanceData]() {
        didSet {
            navigationItem.title = String("Clearance By Voltage")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
            
        tableView.scrollEnabled = true
        
        //Data reading
        let path = NSBundle.mainBundle().pathForResource("clearances", ofType: "txt")
        
        let filemgr = NSFileManager.defaultManager()
        if filemgr.fileExistsAtPath(path!) {
            var fullText: NSString = "test"
            do {
                fullText = try NSString(contentsOfFile: path!, encoding: NSASCIIStringEncoding)
            } catch {
                print("Error reading file")
            }
                //separate lines into array of substrings
                let arrayOfStringData = fullText.componentsSeparatedByString("\n") as [String]
                print ("\(fullText)")
            
            for i in 0...(arrayOfStringData.count - 1) {
                let arrayOfComponents = arrayOfStringData[i].componentsSeparatedByString("    ")
                let data = ClearanceData()
                
                
                //not sure how to store these - another for loop for feet inches? how to convert from string
                let mdvValue : Float = NSString(string: arrayOfComponents[0]).floatValue
                data.maxDesignVoltage = mdvValue
                print("maxDesignVoltage \(data.maxDesignVoltage)")
                
                let bkvValue : Int = Int(NSString(string: arrayOfComponents[1]).intValue)
                data.bilkV = bkvValue
                print("bilkV \(data.bilkV)")
                
                var feetInchesComponents = arrayOfComponents[2].componentsSeparatedByString(" ")
                let mbpValueFeet : Int = Int(NSString(string: feetInchesComponents[0]).intValue)
                let mbpValueInches : Float = NSString(string: feetInchesComponents[1]).floatValue
                data.minBetweenPhases = FeetInches(feet: mbpValueFeet, inches: mbpValueInches)
                print("minBetweenPhases \(data.minBetweenPhases)")
                
                feetInchesComponents = arrayOfComponents[3].componentsSeparatedByString(" ")
                let ptgrValueFeet : Int = Int(NSString(string: feetInchesComponents[0]).intValue)
                let ptgrValueInches : Float = NSString(string: feetInchesComponents[1]).floatValue
                data.phaseToGroundRec = FeetInches(feet: ptgrValueFeet, inches: ptgrValueInches)
                print("phaseToGroundRec \(data.phaseToGroundRec)")
                
                feetInchesComponents = arrayOfComponents[4].componentsSeparatedByString(" ")
                let ptgmValueFeet : Int = Int(NSString(string: feetInchesComponents[0]).intValue)
                let ptgmValueInches : Float = NSString(string: feetInchesComponents[1]).floatValue
                data.phaseToGroundMin = FeetInches(feet: ptgmValueFeet, inches: ptgmValueInches)
                print("phaseToGroundMin \(data.phaseToGroundMin)")
                
                feetInchesComponents = arrayOfComponents[5].componentsSeparatedByString(" ")
                let vcValueFeet : Int = Int(NSString(string: feetInchesComponents[0]).intValue)
                let vcValueInches : Float = NSString(string: feetInchesComponents[1]).floatValue
                data.verticalClearance = FeetInches(feet: vcValueFeet, inches: vcValueInches)
                print("verticalClearance \(data.verticalClearance)")
                
                feetInchesComponents = arrayOfComponents[6].componentsSeparatedByString(" ")
                let ocValueFeet : Int = Int(NSString(string: feetInchesComponents[0]).intValue)
                let ocValueInches : Float = NSString(string: feetInchesComponents[1]).floatValue
                data.overheadConductor = FeetInches(feet: ocValueFeet, inches: ocValueInches)
                print("overheadConductor \(data.overheadConductor)")
                
                feetInchesComponents = arrayOfComponents[7].componentsSeparatedByString(" ")
                let sshValueFeet : Int = Int(NSString(string: feetInchesComponents[0]).intValue)
                let sshValueInches : Float = NSString(string: feetInchesComponents[1]).floatValue
                data.standardStackHeight = FeetInches(feet: sshValueFeet, inches: sshValueInches)
                print("standardStackHeight \(data.standardStackHeight)")
                
                clearanceData.append(data)
            }
        }
    }
/*
        //create random data
        for i in 1...10 {
            clearanceData.append(ClearanceData())
        }
        
        // Get the height of the status bar
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
*/
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return clearanceData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) 
        cell.textLabel?.text = String("\(clearanceData[indexPath.item].maxDesignVoltage)kV")
        return cell
    }
/*
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //If the triggered segue is the "ShowItem" segue
        if segue.identifier == "Show" {
            
            //Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                
                //Get the item associated with this row and pass it along
                let rowData = clearanceData[row]
                let clearanceDataViewController = segue.destinationViewController as! ClearanceDataViewController
                clearanceDataViewController.data.maxDesignVoltage = rowData.maxDesignVoltage
            }
        }
    }
*/

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        //If the triggered segue is the "ShowClearanceData" segue
        if segue.identifier == "ShowClearanceDataTableViewController" {
            print("SHOWING")
            
            //Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                print("Row \(row) selected")
                print("Max \(clearanceData[row].maxDesignVoltage) selected")
                print("bilkV \(clearanceData[row].bilkV) selected")
                print("Min \(clearanceData[row].minBetweenPhases) selected")
                print("Phase min \(clearanceData[row].phaseToGroundMin) selected")
                print("Phase rec \(clearanceData[row].phaseToGroundRec) selected")
                print("Stack height \(clearanceData[row].standardStackHeight) selected")
                print("Overhead \(clearanceData[row].overheadConductor) selected")
                print("Vertical \(clearanceData[row].verticalClearance) selected \n")
                
                //Get the item associated with this row and pass it along
                let rowData = clearanceData[row]
                let clearanceDataViewController = segue.destinationViewController as! ClearanceDataTableViewController
                //crashes here
                clearanceDataViewController.data = rowData
                
                /*
                clearanceDataViewController.minBetweenPhases.text = String(rowData.minBetweenPhases)
                clearanceDataViewController.phaseToGroundRec.text = String(rowData.phaseToGroundRec)
                clearanceDataViewController.phaseToGroundMin.text = String(rowData.phaseToGroundMin)
                clearanceDataViewController.standardStackHeight.text = String(rowData.standardStackHeight)
                clearanceDataViewController.overheadConductor.text = String(rowData.overheadConductor)
                clearanceDataViewController.verticalClearance.text = String(rowData.verticalClearance)
                */
            }
        }
    }
}

