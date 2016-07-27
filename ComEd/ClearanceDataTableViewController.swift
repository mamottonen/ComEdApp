//
//  ClearanceDataTableViewController.swift
//  ComEd
//
//  Created by Meredith Mottonen on 7/6/16.
//  Copyright © 2016 Mottonen. All rights reserved.
//

import UIKit

class ClearanceDataTableViewController: UITableViewController, UINavigationControllerDelegate {

    @IBOutlet var bilkV: UILabel!
    @IBOutlet var minBetweenPhasesFeet: UILabel!
    @IBOutlet var minBetweenPhasesInches: UILabel!
    @IBOutlet var phaseToGroundRecFeet: UILabel!
    @IBOutlet var phaseToGroundRecInches: UILabel!
    @IBOutlet var phaseToGroundMinFeet: UILabel!
    @IBOutlet var phaseToGroundMinInches: UILabel!
    @IBOutlet var standardStackHeightFeet: UILabel!
    @IBOutlet var standardStackHeightInches: UILabel!
    @IBOutlet var overheadConductorFeet: UILabel!
    @IBOutlet var overheadConductorInches: UILabel!
    @IBOutlet var verticalClearanceFeet: UILabel!
    @IBOutlet var verticalClearanceInches: UILabel!
    
    //breakpoint shows nil for all data components...passing data isn't working
    
    var data: ClearanceData!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print("\(data.maxDesignVoltage)")
        navigationItem.title = String("\(data.maxDesignVoltage)kV")
        
        bilkV.text = String("\(data.bilkV)kV")
        minBetweenPhasesFeet.text = String("\(data.minBetweenPhases.feet)'")
        minBetweenPhasesInches.text = String("\(data.minBetweenPhases.inches)''")
        phaseToGroundMinFeet.text = String("\(data.phaseToGroundMin.feet)'")
        phaseToGroundMinInches.text = String("\(data.phaseToGroundMin.inches)''")
        phaseToGroundRecFeet.text = String("\(data.phaseToGroundRec.feet)'")
        phaseToGroundRecInches.text = String("\(data.phaseToGroundRec.inches)''")
        standardStackHeightFeet.text = String("\(data.standardStackHeight.feet)'")
        standardStackHeightInches.text = String("\(data.standardStackHeight.inches)''")
        overheadConductorFeet.text = String("\(data.overheadConductor.feet)'")
        overheadConductorInches.text = String("\(data.overheadConductor.inches)''")
        verticalClearanceFeet.text = String("\(data.verticalClearance.feet)'")
        verticalClearanceInches.text = String("\(data.verticalClearance.inches)''")
    }

}

    


