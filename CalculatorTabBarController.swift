//
//  CalculatorTableViewController.swift
//  ComEd
//
//  Created by Meredith Mottonen on 7/13/16.
//  Copyright © 2016 Mottonen. All rights reserved.
//

import UIKit

class CalculatorTabBarController: UITabBarController {
    override func viewDidLoad() {
        navigationItem.title = String("Amp Calculator")
        
        UITabBar.appearance().barTintColor = UIColor(red: 238/255, green: 18/255, blue: 29/255, alpha: 1.0)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.whiteColor()], forState:.Normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blackColor()], forState:.Selected)
        
        self.navigationController?.setToolbarHidden(true, animated: true)
    }
}
