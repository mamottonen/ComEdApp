//
//  LoadTypeTableViewController.swift
//  ComEd
//
//  Created by Meredith Mottonen on 7/26/16.
//  Copyright © 2016 Mottonen. All rights reserved.
//

import Foundation

import UIKit

class LoadTypeTableViewController: UITableViewController {
    
    let myarray = ["Conductor", "Tubular Bus"]
    
    override func viewDidLoad() {
        navigationItem.title = "Load Capabilities"
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myarray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = String("\(myarray[indexPath.item])")
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        //If the triggered segue is the "ShowLoadBusSelectTableController" segue
        if segue.identifier == "ShowLoadTableSelectViewController" {
            
            //Figure out which row was just tapped
            let row = tableView.indexPathForSelectedRow?.row
            print(row)
            
            if (row == 0) {
    
                print("Row zero")
                //Get the item associated with this row and pass it along
                let loadTableSelectTableViewController = segue.destinationViewController as! LoadTableSelectTableViewController
                loadTableSelectTableViewController.fileTitle.append("LoadCapabilityConductor")
                
                let backItem = UIBarButtonItem()
                backItem.title = ""
                navigationItem.backBarButtonItem = backItem
            }
            
            else if (row == 1) {
                
                print("Row one")
                //Get the item associated with this row and pass it along
                let loadTableSelectTableViewController = segue.destinationViewController as! LoadTableSelectTableViewController
                loadTableSelectTableViewController.fileTitle.append("LoadCapabilityBus")
                
                let backItem = UIBarButtonItem()
                backItem.title = ""
                navigationItem.backBarButtonItem = backItem
            }
        }
    }
    
}