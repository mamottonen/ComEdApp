//
//  LoadTable.swift
//  ComEd
//
//  Created by Meredith Mottonen on 7/21/16.
//  Copyright © 2016 Mottonen. All rights reserved.
//

import UIKit
import Foundation

class LoadTables {
    var pathFile: String
    var tableSelected: String
    var loadDataArray: [LoadData]
    
    
    init(pathFile: String, tableSelected: String, loadDataArray: [LoadData]) {
        
        self.pathFile = pathFile
        self.tableSelected = tableSelected
        self.loadDataArray = loadDataArray
        
    }
    convenience init() {
        
        let pathFile = "Test"
        let tableSelected = "Test"
        let loadDataArray = [LoadData]()
        
        self.init(pathFile: pathFile, tableSelected: tableSelected, loadDataArray: loadDataArray)
    }
}
