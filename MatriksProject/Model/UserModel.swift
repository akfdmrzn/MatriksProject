//
//  UserModel.swift
//  veriParkAkif
//
//  Created by Akif_PC on 9.03.2018.
//  Copyright © 2018 akif demirezen. All rights reserved.
//

import UIKit

class UserModel: NSObject {
 
    
    private var _nightModeEnabled : Bool = false
    private var _username : String = ""
    private var _password : String = ""
    private var _accountID : String = ""
    
    var nightModeEnabled : Bool {
        get {
            if let nightModeEnabled = UserDefaults.standard.value(forKey: "nightModeEnabled") as? Bool {
                return nightModeEnabled
            }
            else {
                return false
            }
        }
        set {
            self._nightModeEnabled = newValue
            UserDefaults.standard.set(self._nightModeEnabled, forKey: "nightModeEnabled")
        }
    }
    var username : String {
        get {
            if let username = UserDefaults.standard.value(forKey: "username") as? String {
                return username
            }
            else {
                return ""
            }
        }
        set {
            self._username = newValue
            UserDefaults.standard.set(self._username, forKey: "username")
        }
    }
    var password : String {
        get {
            if let password = UserDefaults.standard.value(forKey: "password") as? String {
                return password
            }
            else {
                return ""
            }
        }
        set {
            self._password = newValue
            UserDefaults.standard.set(self._password, forKey: "password")
        }
    }
    var accountID : String {
        get {
            if let accountID = UserDefaults.standard.value(forKey: "accountID") as? String {
                return accountID
            }
            else {
                return ""
            }
        }
        set {
            self._accountID = newValue
            UserDefaults.standard.set(self._accountID, forKey: "accountID")
        }
    }
    
}
