//
//  CustomTextField.swift
//  KonusarakOgren
//
//  Created by akif demirezen on 19/07/2017.
//  Copyright © 2017 KonusarakOgren. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {
    
    var fontName = "GothamNarrow-Book"
    
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
    
    @IBInspectable var TextFieldFontSize: CGFloat = 0 {
        didSet {
            font = UIFont(name: fontName, size: TextFieldFontSize * UIScreen.main.bounds.size.height/667)
        }
    }
    
    @IBInspectable var isBold:Bool = false {
        didSet {
            if isBold {
                fontName = "Helvetica-Bold"
            } else {
                fontName = "Helvetica"
            }
            font = UIFont(name: fontName, size: TextFieldFontSize * UIScreen.main.bounds.size.height/667)
        }
    }
    
    //TextField Padding.
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 5);
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    
}
