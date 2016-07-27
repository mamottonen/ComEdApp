//
//  ClearanceData.swift
//  ComEd
//
//  Created by Meredith Mottonen on 7/6/16.
//  Copyright © 2016 Mottonen. All rights reserved.
//

import Foundation

struct FeetInches {
    var feet: Int
    var inches: Float
    
    init(feet: Int, inches: Float) {
        self.feet = feet
        self.inches = inches
        
    }
}

class ClearanceData {
    var maxDesignVoltage: Float
    var bilkV: Int
    var minBetweenPhases: FeetInches
    var phaseToGroundRec: FeetInches
    var phaseToGroundMin: FeetInches
    var standardStackHeight: FeetInches
    var overheadConductor: FeetInches
    var verticalClearance: FeetInches
    
    init(maxDesignVoltage: Float, bilkV: Int, minBetweenPhases: FeetInches, phaseToGroundRec: FeetInches, phaseToGroundMin: FeetInches, standardStackHeight: FeetInches, overheadConductor: FeetInches, verticalClearance: FeetInches) {
        
        self.maxDesignVoltage = maxDesignVoltage
        self.bilkV = bilkV
        self.minBetweenPhases = minBetweenPhases
        self.phaseToGroundRec = phaseToGroundRec
        self.phaseToGroundMin = phaseToGroundMin
        self.standardStackHeight = standardStackHeight
        self.overheadConductor = overheadConductor
        self.verticalClearance = verticalClearance
        
    }

    convenience init() {
    
        let maxDesignVoltage = Float(arc4random_uniform(1000))
        let bilkV = Int(arc4random_uniform(2000))
        let minBetweenPhases = FeetInches(feet: Int(arc4random_uniform(10)), inches: Float(arc4random_uniform(12)))
        let phaseToGroundRec = FeetInches(feet: Int(arc4random_uniform(15)), inches: Float(arc4random_uniform(12)))
        let phaseToGroundMin = FeetInches(feet: Int(arc4random_uniform(15)), inches: Float(arc4random_uniform(12)))
        let standardStackHeight = FeetInches(feet: Int(arc4random_uniform(15)), inches: Float(arc4random_uniform(12)))
        let overheadConductor = FeetInches(feet: Int(arc4random_uniform(18)), inches: Float(arc4random_uniform(12)))
        let verticalClearance = FeetInches(feet: Int(arc4random_uniform(31)), inches: Float(arc4random_uniform(12)))
        
        self.init(maxDesignVoltage: maxDesignVoltage, bilkV: bilkV, minBetweenPhases: minBetweenPhases, phaseToGroundRec: phaseToGroundRec, phaseToGroundMin: phaseToGroundMin, standardStackHeight: standardStackHeight, overheadConductor: overheadConductor, verticalClearance: verticalClearance)
    }

}
