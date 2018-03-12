//
//  ModelExchange.swift
//  MatriksProject
//
//  Created by Akif_PC on 12.03.2018.
//  Copyright © 2018 demirezenOrganization. All rights reserved.
//

import UIKit

protocol  ExchangeDelegate : class{
    func getDataSuccesfully(isCorrect: Bool, message : String,responseData : [ResponseModelExchange])
}
class ModelExchange: ConnectionDelegate {
    
    var postConnection = PostConnection()
    var exchangeDelegate : ExchangeDelegate?
    
    var model = ResponseModelLogin()
    
    init() {
        self.postConnection.delegate = self
    }
    
    func sendDataToService(){
        
        let data = [
            "" : ""
            ] as [String : Any]
        postConnection.makePostConnection(url: "https://www.doviz.com/api/v1/currencies/all/latest", postParams: data, httpMethod: .get)
    }
    
    func getDataFromService(jsonData : AnyObject){
         var responseModel : [ResponseModelExchange] = []
        let json = jsonData as AnyObject
        print(json)
        if let itemList = json as? [AnyObject] {
            for item in itemList {
                let model = ResponseModelExchange()
                if let name = item["name"] as? String {
                    model.name = name
                }
                if let buying = item["buying"] as? Double {
                    model.buying = buying
                }
                if let selling = item["selling"] as? Double {
                    model.selling = selling
                }
                if let changeRate = item["change_rate"] as? Double {
                    if String(changeRate).contains("-") {
                        model.imageOfState = #imageLiteral(resourceName: "arrow-pointing-down")
                    }
                    else{
                        model.imageOfState = #imageLiteral(resourceName: "arrow-up")
                    }
                }
                responseModel.append(model)
            }
            if responseModel.count != 0 {
                self.exchangeDelegate?.getDataSuccesfully(isCorrect: true, message: "", responseData: responseModel)
            }
            else{
                self.exchangeDelegate?.getDataSuccesfully(isCorrect: false, message: "", responseData: [])
            }
        }
    }
    func getError(errMessage: String) {
        // print(errMessage)
    }
}


