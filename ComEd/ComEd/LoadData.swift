//
//  LoadData.swift
//  ComEd
//
//  Created by Meredith Mottonen on 7/21/16.
//  Copyright © 2016 Mottonen. All rights reserved.
//

import UIKit
import Foundation

class LoadData {
    var conductorSize: String
    var summerNormal: Int
    var summerEmergency: Int
    var summerShortTermEmergency: Int
    var summerLoadDumpEmergency: Int

    
    init(conductorSize: String, summerNormal: Int, summerEmergency: Int, summerShortTermEmergency: Int, summerLoadDumpEmergency: Int) {
        
        self.conductorSize = conductorSize
        self.summerNormal = summerNormal
        self.summerEmergency = summerEmergency
        self.summerShortTermEmergency = summerShortTermEmergency
        self.summerLoadDumpEmergency = summerLoadDumpEmergency

    }
   
    convenience init() {
        
        let conductorSize = "test"
        let summerNormal = Int(arc4random_uniform(10000))
        let summerEmergency = Int(arc4random_uniform(10000))
        let summerShortTermEmergency = Int(arc4random_uniform(10000))
        let summerLoadDumpEmergency = Int(arc4random_uniform(10000))
        
        self.init(conductorSize: conductorSize, summerNormal: summerNormal, summerEmergency: summerEmergency, summerShortTermEmergency: summerShortTermEmergency, summerLoadDumpEmergency: summerLoadDumpEmergency)
    }
    
}
