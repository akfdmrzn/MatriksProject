//
//  TabBarSetup.swift
//  MatriksProject
//
//  Created by Akif_PC on 12.03.2018.
//  Copyright © 2018 demirezenOrganization. All rights reserved.
//

import UIKit

protocol TabbarSetupControl: class {
    // Add more param if needed
    func setupTabBar(color: UIColor)
}
extension TabbarSetupControl where Self: CurrencyViewController {
    // Default implementation
    func setupTabBar(color: UIColor) {
        self.tabBarController?.tabBar.barTintColor = color
    }
    
}
