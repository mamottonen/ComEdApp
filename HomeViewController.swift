//
//  HomeViewController.swift
//  ComEd
//
//  Created by Meredith Mottonen on 7/7/16.
//  Copyright © 2016 Mottonen. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    /*
    let myarray = ["Clearances", "Calculators"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myarray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("customcell", forIndexPath: indexPath)
        cell.textLabel?.text = String(myarray[indexPath.item])
        return cell
    }
    */
    
    override func viewDidLoad() {
        
        var titleView : UIImageView
        // set the dimensions you want here
        titleView = UIImageView(frame:CGRectMake(0, 0, 15, 35))
        // Set how do you want to maintain the aspect
        titleView.contentMode = .ScaleAspectFit
        titleView.image = UIImage(named: "ComEd-logo.png")
        self.navigationItem.titleView = titleView
        
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationController!.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        self.navigationController!.view.backgroundColor = UIColor.whiteColor()
        self.navigationController!.navigationBar.translucent = false
        
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 238/255, green: 18/255, blue: 29/255, alpha: 1)
        self.navigationController!.toolbar.barTintColor = UIColor(red: 238/255, green: 18/255, blue: 29/255, alpha: 1)

        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        //If the triggered segue is the "ShowClearanceData" segue
        if segue.identifier == "ShowClearanceByVoltageTableViewController" {
            print("Table View")
            segue.destinationViewController as! ClearanceByVoltageTableViewController
        }
        
        if segue.identifier == "ShowCalculatorTabBarController" {
            print("Tab Bar")
            segue.destinationViewController as! CalculatorTabBarController
        }
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
    }
    
}