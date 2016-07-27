//
//  LoadAmpsTableViewController.swift
//  ComEd
//
//  Created by Meredith Mottonen on 7/21/16.
//  Copyright © 2016 Mottonen. All rights reserved.
//

import UIKit

class LoadBusSelectTableViewController: UITableViewController {
    
    var loadData = LoadTables() {
        didSet {
            navigationItem.title = String("\(loadData.tableSelected)")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadData.loadDataArray.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("loadselectcell", forIndexPath: indexPath)
        cell.textLabel?.text = String("\(loadData.loadDataArray[indexPath.item].conductorSize)")
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        //If the triggered segue is the "ShowClearanceData" segue
        if segue.identifier == "ShowLoadDataTableViewController" {
            
            //Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                
                let rowData = loadData.loadDataArray[row]
                let loadDataTableViewController = segue.destinationViewController as! LoadDataTableViewController
                loadDataTableViewController.data = rowData
                
                let backItem = UIBarButtonItem()
                backItem.title = ""
                navigationItem.backBarButtonItem = backItem
            }
        }
    }
}