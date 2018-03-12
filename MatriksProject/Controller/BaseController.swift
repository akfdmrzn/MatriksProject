//
//  BaseController.swift
//  veriParkAkif
//
//  Created by Akif_PC on 8.03.2018.
//  Copyright © 2018 akif demirezen. All rights reserved.
//

import UIKit
import NVActivityIndicatorView
class BaseController: UIViewController {
    
    var blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
    var blurEffectView : UIVisualEffectView?
    var indicator :  NVActivityIndicatorView?
    var user = UserModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if user.nightModeEnabled{
            self.view.backgroundColor = UIColor.black
        }
        else{
            self.view.backgroundColor = UIColor.white
        }
        self.indicatorShow(status: false)     
        NotificationCenter.default.addObserver(self, selector: #selector(setEnableNight), name: NSNotification.Name(rawValue: "enableNightMode"), object: nil)
        
    }
    
    func indicatorShow(status : Bool){
        if !status{
            self.blurEffectView?.removeFromSuperview()
            indicator?.stopAnimating()
        }
        else{
            self.blurEffectView =  UIVisualEffectView(effect: self.blurEffect)
            self.blurEffectView?.frame = view.bounds
            self.blurEffectView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.view.addSubview(blurEffectView!)
            
            let color = UIColor( red: CGFloat(145/255.0), green: CGFloat(188/255.0), blue: CGFloat(163/255.0), alpha: CGFloat(1.0) )
            let frame = CGRect(x: (self.view.frame.width/2)*0.7, y: (self.view.frame.height/2)*0.7, width: self.view.frame.width/3, height: self.view.frame.height/3)
            self.indicator =  NVActivityIndicatorView(frame: frame, type: NVActivityIndicatorType.ballSpinFadeLoader, color: color, padding: NVActivityIndicatorView.DEFAULT_PADDING )
            
            self.view.addSubview(indicator!)
            indicator?.startAnimating()
        }
    }
    @objc func setEnableNight(){
        if user.nightModeEnabled{
            self.view.backgroundColor = UIColor.black
            UITabBar.appearance().barTintColor = UIColor.black
            self.tabBarController?.tabBar.layoutIfNeeded()
            self.view.updateFocusIfNeeded()
            self.view.layoutIfNeeded()
            
        }
        else{
            UITabBar.appearance().barTintColor = UIColor.white
            self.view.backgroundColor = UIColor.white
            self.tabBarController?.tabBar.layoutIfNeeded()
            self.view.updateFocusIfNeeded()
            self.view.layoutIfNeeded()
        }
        }
    /** Shows UIAlertController with specific message */
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Bilgi Mesajı", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    /** Shows UIAlertController with specific message and
     do an action when closed */
    func showAlert(_ message: String,_ handler: ((UIAlertAction) -> Swift.Void)? = nil) {
        let alert = UIAlertController(title: "Bilgi Mesajı", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .cancel, handler: handler))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
}

