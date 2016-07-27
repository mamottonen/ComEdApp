//
//  LoadTableSelectTableViewController.swift
//  ComEd
//
//  Created by Meredith Mottonen on 7/21/16.
//  Copyright © 2016 Mottonen. All rights reserved.
//

import Foundation
import UIKit

class LoadTableSelectTableViewController: UITableViewController {
    
    var fileTitle = [String]()
    
    var loadTables = [LoadTables]() {
        didSet {
            if (fileTitle[0] == "LoadCapabilityBus") {
                navigationItem.title = String("Bus Load Capabilities")
            }
            if (fileTitle[0] == "LoadCapabilityConductor") {
                navigationItem.title = String("Conductor Load Capabilities")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(fileTitle)
        
        let path = NSBundle.mainBundle().pathForResource(fileTitle[0], ofType: "txt")
        
        let filemgr = NSFileManager.defaultManager()
        if filemgr.fileExistsAtPath(path!) {
            var fullText: NSString = "test"
            do {
                fullText = try NSString(contentsOfFile: path!, encoding: NSASCIIStringEncoding)
            } catch {
                print("Error reading file")
            }
            //separate lines into array of substrings
            let arrayOfEveryTable = fullText.componentsSeparatedByString("nexttable") as [String]
            //print("\(arrayOfEveryTable.count)")
            
            for i in 0...(arrayOfEveryTable.count - 1) {
                //print("\(arrayOfEveryTable[i])")
                let arrayOfTableData = arrayOfEveryTable[i].componentsSeparatedByString("\r")
                let table = LoadTables()
                table.tableSelected = arrayOfTableData[0]
                //print("printing array of table data\n\(arrayOfTableData[i])")
                
                for i in 1...(arrayOfTableData.count-2) {
                    
                    let arrayOfComponents = arrayOfTableData[i].componentsSeparatedByString("\t")
                    //print("\(arrayOfComponents)")
                    let data = LoadData()
                    
                    data.conductorSize = arrayOfComponents[0]
                    //print("conductor size \(data.conductorSize)")
                    
                    let normalValue : Int = Int(NSString(string: arrayOfComponents[1]).intValue)
                    data.summerNormal = normalValue
                    //print("summer normal \(data.summerNormal)")
                    
                    let emergencyValue : Int = Int(NSString(string: arrayOfComponents[2]).intValue)
                    data.summerEmergency = emergencyValue
                    //print("summer emergency \(data.summerEmergency)")
                    
                    let shortTermValue : Int = Int(NSString(string: arrayOfComponents[3]).intValue)
                    data.summerShortTermEmergency = shortTermValue
                    //print("summer short term emergency \(data.summerShortTermEmergency)")
                    
                    let loadDumpValue : Int = Int(NSString(string: arrayOfComponents[4]).intValue)
                    data.summerLoadDumpEmergency = loadDumpValue
                    //print("summer load dump emergency \(data.summerLoadDumpEmergency)\n")
                    
                    table.loadDataArray.append(data)
                }
                
                loadTables.append(table)
            }
        }
        //print("Finished the for loops")
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
        return loadTables.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("loadtablecell", forIndexPath: indexPath)
        cell.textLabel?.text = String("\(loadTables[indexPath.item].tableSelected)")
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        //If the triggered segue is the "ShowLoadBusSelectTableController" segue
        if segue.identifier == "ShowLoadBusSelectTableViewController" {
            
            //Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                
                //Get the item associated with this row and pass it along
                let rowData = loadTables[row]
                let loadBusSelectTableViewController = segue.destinationViewController as! LoadBusSelectTableViewController
                loadBusSelectTableViewController.loadData = rowData
                
                let backItem = UIBarButtonItem()
                backItem.title = ""
                navigationItem.backBarButtonItem = backItem
            }
        }
    }
}