//
//  ModelOfCurrency.swift
//  MatriksProject
//
//  Created by akif demirezen on 11/03/2018.
//  Copyright © 2018 demirezenOrganization. All rights reserved.
//

import UIKit

protocol  CurrencyDelegate : class{
    func getDataSuccesfully(isCorrect: Bool, message : String, responseData : [ResponseModelCurrency], deepTotalPrice : Double)
}
class ModelOfCurrency: ConnectionDelegate {
   
    var user = UserModel()
    var postConnection = PostConnection()
    var currencyDelegate : CurrencyDelegate?
    var accountId : String = ""
    var deepTotalPrice : Double = 0.0
    var model = ResponseModelLogin()
    
    init() {
 
        self.postConnection.delegate = self
        self.accountId = user.accountID        
        
    }
    
    func sendDataToService(){        
        let data = [
            "" : ""
            ] as [String : Any]
        postConnection.makePostConnection(url: HttpLink.mainURL + "MsgType=AN&CustomerNo=0&Username=\(user.username)&Password=\(user.password)&AccountID=\(user.accountID)&ExchangeID=4&OutputType=2", postParams: data, httpMethod: .get)
    }
    
    func getDataFromService(jsonData : AnyObject){
        var serviceMsg : String = ""
        self.deepTotalPrice = 0.0
        var responseModel : [ResponseModelCurrency] = []
        let json = jsonData as AnyObject
        print(json)
        let result = (json["Result"] as AnyObject)
        if let description = result["Description"] as? String {
            serviceMsg  = description
        }
        if let state = result["State"] as? Bool {
            if let itemList = json["Item"] as? [AnyObject] {
                for item in itemList {
                    let model = ResponseModelCurrency()
                    if let symbol = item["Symbol"] as? String {
                        model.menkul = symbol
                    }
                    if let qty_T2 = item["Qty_T2"] as? Double {
                        model.menkul_T2 = qty_T2
                    }
                    if let lastPx = item["LastPx"] as? Double {
                        model.price = lastPx
                        model.total = model.price * model.menkul_T2
                        self.deepTotalPrice += model.total
                    }
                    responseModel.append(model)
                }
            }
                self.currencyDelegate?.getDataSuccesfully(isCorrect: true, message: serviceMsg, responseData: responseModel,deepTotalPrice: self.deepTotalPrice)
        }
        else{
            //false
              self.currencyDelegate?.getDataSuccesfully(isCorrect: false, message: serviceMsg, responseData: [],deepTotalPrice: self.deepTotalPrice)
        }
    }
    func getError(errMessage: String) {
        // print(errMessage)
    }
}



