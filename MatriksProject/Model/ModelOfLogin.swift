//
//  ModelOfLogin.swift
//  MatriksProject
//
//  Created by akif demirezen on 11/03/2018.
//  Copyright © 2018 demirezenOrganization. All rights reserved.
//

import UIKit

protocol  LoginDelegate : class{
    func getDataSuccesfully(isCorrect: Bool, message : String, accountId : String)
}


class ModelOfLogin: ConnectionDelegate {
    
    
    var postConnection = PostConnection()
    var loginDelegate : LoginDelegate?
    
    
    var username : String = ""
    var password : String = ""    
    var model = ResponseModelLogin()
  
    init() {
        
        self.username = ""
        self.password = ""
        self.postConnection.delegate = self
        
    }
    
    func sendDataToService(){
        
        let data = [
            "" : ""
            ] as [String : Any]
        postConnection.makePostConnection(url:HttpLink.mainURL+"MsgType=A&CustomerNo=0&Username=\(self.username)&Password=\(self.password)&AccountID=0&ExchangeID=4&OutputType=2", postParams: data, httpMethod: .get)
    }
    
    func getDataFromService(jsonData : AnyObject){
        var serviceMsg : String = ""
        let json = jsonData as AnyObject
        print(json)
         let result = (json["Result"] as AnyObject)
            if let state = result["State"] as? Bool {
                let model = ResponseModelLogin()
                if let description = result["Description"] as? String {
                    serviceMsg  = description
                }
                if state{
                    if let description = result["Description"] as? String {
                        serviceMsg  = description
                    }
                    if let defaultAccount = json["DefaultAccount"] as? String {
                        model.defaultAccount  = defaultAccount
                    }
                    self.loginDelegate?.getDataSuccesfully(isCorrect: true, message: serviceMsg, accountId: model.defaultAccount)
                }
                else{
                    self.loginDelegate?.getDataSuccesfully(isCorrect: false, message: serviceMsg, accountId: "")
                }
            }
    }
    func getError(errMessage: String) {
        // print(errMessage)
    }
}


