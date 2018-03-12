//
//  NavigationBarSetup.swift
//  MatriksProject
//
//  Created by Akif_PC on 12.03.2018.
//  Copyright © 2018 demirezenOrganization. All rights reserved.
//

import UIKit
protocol NavigationBarSetUpProtocol: class {
    // Add more param if needed
    func setupNavigationBar(color: UIColor,textColor : UIColor)
}
extension NavigationBarSetUpProtocol where Self: CurrencyViewController {
    // Default implementation
    func setupNavigationBar(color: UIColor,textColor : UIColor) {
        self.navigationController?.navigationBar.barTintColor = color
        self.navigationController?.navigationBar.tintColor = textColor
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: textColor]
        
    }
    
}


