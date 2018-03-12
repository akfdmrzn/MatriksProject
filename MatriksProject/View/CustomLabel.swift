//
//  CustomLabel.swift
//  KonusarakOgren
//
//  Created by akif demirezen on 14/08/2017.
//  Copyright © 2017 KonusarakOgren. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
    
    
    
    var user = UserModel()
    var fontName = "Helvetica"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if user.nightModeEnabled{
           textColor = UIColor.white
        }
        else{
            textColor = UIColor.black
        }
    }
    
    public func text(name : String){
        self.text = name
        if user.nightModeEnabled{
            self.textColor = UIColor.white
        }
        else{
            self.textColor = UIColor.black
        }
    }
    
    
    
//    @IBInspectable var myTextColor: UIColor!{
//        didSet {
//            print("------")
//            print(user.nightModeEnabled)
//            if user.nightModeEnabled{
//            textColor = UIColor.white
//            }
//            else{
//            textColor = UIColor.green
//            }
//        }
//    }
    @IBInspectable var iPhoneFontSize:CGFloat = 0 {
        didSet {
            font = UIFont(name: fontName, size: iPhoneFontSize * UIScreen.main.bounds.size.height/667)
        }
    }
    @IBInspectable var isBold: Bool = false {
        didSet {
            if isBold {
                fontName = "Helvetica-Bold"
            } else {
                fontName = "Helvetica"
            }
            font = UIFont(name: fontName, size: iPhoneFontSize * UIScreen.main.bounds.size.height/667)
        }
    }
    
}

//extension CustomLabel {
//    func returnTextFont() -> String {
//        if isBold == true {
//            fontName = "'GothamNarrow-Bold'"
//            return "GothamNarrow-Bold"
//        } else {
//            fontName = "'GothamNarrow-Book'"
//            return "GothamNarrow-Book"
//        }
//    }v
    
//    override var attributedText: NSAttributedString? {
//        didSet {
//            font = font.withSize(iPhoneFontSize * UIScreen.main.bounds.size.height/667)
//        }
//    }
    
//    func overrideFontSize(fontSize:CGFloat){
//        let currentFontName =  returnTextFont()
//        var calculatedFont: UIFont?
//        let bounds = UIScreen.main.bounds
//        let height = bounds.size.height
//        switch height {
//        case 480.0: //Iphone 3,4,SE => 3.5 inch
//            calculatedFont = UIFont(name: currentFontName, size: fontSize * 0.6)
//            self.font = calculatedFont
//            break
//        case 568.0: //iphone 5, 5s => 4 inch
//            calculatedFont = UIFont(name: currentFontName, size: fontSize * 0.7)
//            self.font = calculatedFont
//            break
//        case 667.0: //iphone 6, 6s => 4.7 inch
//            calculatedFont = UIFont(name: currentFontName, size: fontSize * 0.8)
//            self.font = calculatedFont
//            break
//        case 667.0: //iphone 7 =>
//            calculatedFont = UIFont(name: currentFontName, size: fontSize*0.9)
//            self.font = calculatedFont
//            break
//        case 736.0: //iphone 7+plus => 5.5 inch
//            calculatedFont = UIFont(name: currentFontName, size: fontSize*1.0)
//            self.font = calculatedFont
//            break
//        case 812.0: //iphone X
//            calculatedFont = UIFont(name: currentFontName, size: fontSize*1.0)
//            self.font = calculatedFont
//            break
//        case 1024.0: //ipad for 9.7 inch
//            calculatedFont = UIFont(name: currentFontName, size: fontSize*1.5)
//            self.font = calculatedFont
//            break
//        case 1112.0: //ipad for 10.5 inch
//            calculatedFont = UIFont(name: currentFontName, size: fontSize*1.75)
//            self.font = calculatedFont
//            break
//        case 1366.0: //ipad for 12.9 inch
//            calculatedFont = UIFont(name: currentFontName, size: fontSize*1.85)
//            self.font = calculatedFont
//            break
//        default:
//            print("this is not an iPhone")
//            break
//        }
//    }

//    func setHTMLFromString(_ htmlText: String) {
//        let modifiedFont = String(format:"<span style=\"font-family: \(fontName); font-size: \(iPhoneFontSize * UIScreen.main.bounds.size.height/667)\">%@</span>", htmlText)
//
//        let attrStr = try! NSAttributedString(
//            data: modifiedFont.data(using: .unicode, allowLossyConversion: true)!,
//            options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue],
//            documentAttributes: nil)
//        attributedText = attrStr
//    }
//
//    func setHTML(html: String) {
//        do {
//            let at : NSAttributedString = try NSAttributedString(data: html.data(using: .utf8)!, options: [.documentType : NSAttributedString.DocumentType.html], documentAttributes: nil)
//            self.attributedText = at
//        } catch {
//            self.text = html
//        }
//    }
//}

