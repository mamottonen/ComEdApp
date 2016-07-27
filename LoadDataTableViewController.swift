//
//  LoadDataTableViewController.swift
//  ComEd
//
//  Created by Meredith Mottonen on 7/21/16.
//  Copyright © 2016 Mottonen. All rights reserved.
//

import UIKit

class LoadDataTableViewController: UITableViewController, UINavigationControllerDelegate {
    
    var data: LoadData!
    
    @IBOutlet var summerNormal: UILabel!
    @IBOutlet var summerEmergency: UILabel!
    @IBOutlet var summerShortTermEmergency: UILabel!
    @IBOutlet var summerLoadDumpEmergency: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.title = String("\(data.conductorSize)")
        
        summerNormal.text = String("\(data.summerNormal) A")
        summerEmergency.text = String("\(data.summerEmergency) A")
        summerShortTermEmergency.text = String("\(data.summerShortTermEmergency) A")
        summerLoadDumpEmergency.text = String("\(data.summerLoadDumpEmergency) A")
    }
}