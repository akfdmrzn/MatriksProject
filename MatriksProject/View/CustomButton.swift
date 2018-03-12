//
//  CustomButton.swift
//  KonusarakOgren
//
//  Created by akif demirezen on 19/07/2017.
//  Copyright © 2017 KonusarakOgren. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {
    
    
    
    var fontName = "Helvetica-Bold"
    
    func doEnable() {
        self.isEnabled = true
        self.backgroundColor = UIColor(red:0.19, green:0.62, blue:1.00, alpha:1.0)
    }
    func doDisable() {
        self.isEnabled = false
        self.backgroundColor = UIColor(red:0.40, green:0.51, blue:0.61, alpha:1.0)
        
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var buttonTextFontSize: CGFloat = 0 {
        didSet {
            titleLabel?.font = UIFont(name: fontName, size: buttonTextFontSize * UIScreen.main.bounds.size.height/667)
        }
    }
    
    
    @IBInspectable var isBold: Bool = true {
        didSet {
            if isBold {
                fontName = "Helvetica-Bold"
            } else {
                fontName = "Helvetica"
            }
            
            titleLabel?.font = UIFont(name: fontName, size: buttonTextFontSize * UIScreen.main.bounds.size.height/667)
        }
    }
    
   
    
    func returnTextFont()-> String {
        if isBold == true {
            return "Helvetica-Bold"
        } else {
            return "Helvetica-Bold"
        }
    }
    
}
