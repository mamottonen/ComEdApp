//
//  LoginInformation.swift
//  ComEd
//
//  Created by Meredith Mottonen on 7/27/16.
//  Copyright © 2016 Mottonen. All rights reserved.
//

import UIKit
import Foundation

class LoginInformation {
    var username: String
    var password: String
    
    init(username: String, password: String) {
        
        self.username = username
        self.password = password
        
    }
    
    convenience init() {
        
        let username = "test"
        let password = "test"
        
        self.init(username: username, password: password)
    }
    
}
