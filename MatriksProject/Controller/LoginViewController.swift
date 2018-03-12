//
//  LoginViewController.swift
//  MatriksProject
//
//  Created by Akif_PC on 12.03.2018.
//  Copyright © 2018 demirezenOrganization. All rights reserved.
//

import UIKit

class LoginViewController: BaseController {

    @IBOutlet weak var btnLogIn: CustomButton!
    @IBOutlet weak var textFieldUsername: CustomTextField!
    @IBOutlet weak var textFieldPassword: CustomTextField!
    
    var modelLogin = ModelOfLogin()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.btnLogIn.doDisable()
        self.modelLogin.loginDelegate = self as LoginViewController
        
        
    }
    @IBAction func textfieldUsernameChaned(_ sender: Any) {
        if self.textFieldUsername.text != "" && self.textFieldPassword.text != "" {
            self.btnLogIn.doEnable()
        }
        else{
            self.btnLogIn.doDisable()
        }
        
    }
    @IBAction func textFieldPasswrdChanged(_ sender: Any) {
        if self.textFieldUsername.text != "" && self.textFieldPassword.text != "" {
            self.btnLogIn.doEnable()
        }
        else{
            self.btnLogIn.doDisable()
        }
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        self.modelLogin.username = self.textFieldUsername.text!
        self.modelLogin.password = self.textFieldPassword.text!
        self.modelLogin.sendDataToService()
        self.indicatorShow(status: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
extension LoginViewController : LoginDelegate{
    func getDataSuccesfully(isCorrect: Bool, message: String, accountId: String) {
        self.indicatorShow(status: false)
        if isCorrect{
            user.username = modelLogin.username
            user.password = modelLogin.password
            user.accountID = accountId            
            self.performSegue(withIdentifier: "segueGoToMainPage", sender: nil)
        }
        else{
            showAlert(message)
        }
    }
    
}
//showAlert(message, { _ in
//    let storyboard = UIStoryboard(name: "Main", bundle: nil)
//    let vc = storyboard.instantiateViewController(withIdentifier: "MainPage") as! UITabBarController
//    self.navigationController?.pushViewController(vc, animated: true)
//})

