//
//  ExchangeViewController.swift
//  MatriksProject
//
//  Created by Akif_PC on 12.03.2018.
//  Copyright © 2018 demirezenOrganization. All rights reserved.
//

import UIKit
import EFAutoScrollLabel

class ExchangeViewController: BaseController {
    @IBOutlet weak var scrolView: EFAutoScrollLabel!
    @IBOutlet weak var tableViewOfExchange: UITableView!
    
    var modelExchange = ModelExchange()
    var choosenIndex = ResponseModelExchange()
    var arrayOfSearch = [ResponseModelExchange]()
    var output : String = ""
    var isSearching = false
    
    fileprivate var exchangeList : [ResponseModelExchange] = []{
        didSet{
            self.tableViewOfExchange.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableViewOfExchange?.register(ExchangeTableViewCell.nib, forCellReuseIdentifier: ExchangeTableViewCell.identifier)
        tableViewOfExchange?.delegate = self
        tableViewOfExchange?.dataSource = self
        
        self.modelExchange.exchangeDelegate = self
        self.modelExchange.sendDataToService()
        self.indicatorShow(status: true)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        if self.output != ""{
            self.setExchangeValueToScrolText()
            self.tableViewOfExchange.reloadData()
        }
        
        
    }
    func setExchangeValueToScrolText(){
      
        var index : Int = 0
        for item in self.exchangeList { //just add first 5 item
            output += " - Döviz Adı : \(item.name)  Alış : \(item.buying)"
            index += 1
            if index == 5{
                break
            }
        }
        if user.nightModeEnabled{
            scrolView.backgroundColor = UIColor.black
        }
        else{
            scrolView.backgroundColor = UIColor(red: 253.0 / 255.0, green: 255.0 / 255.0, blue: 234.0 / 255.0, alpha: 1)
            
        }
        scrolView.textColor = UIColor.red
        scrolView.font = UIFont.systemFont(ofSize: 13)
        scrolView.labelSpacing = 30
        scrolView.pauseInterval = 1
        scrolView.scrollSpeed = 30
        scrolView.textAlignment = NSTextAlignment.left
        scrolView.fadeLength = 12
        scrolView.text = output
        scrolView.scrollDirection = EFAutoScrollDirection.Left
        scrolView.observeApplicationNotifications()
        
    }
    
    
}
extension ExchangeViewController : ExchangeDelegate{
    func getDataSuccesfully(isCorrect: Bool, message: String, responseData: [ResponseModelExchange]) {
        self.indicatorShow(status: false)
        if isCorrect{
            self.exchangeList = responseData
            self.setExchangeValueToScrolText()
            
        }
        else{
            
        }
    }
}
extension ExchangeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.view.frame.height * 0.002
        
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableViewOfExchange.frame.height * 0.1
    }
}
extension ExchangeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ExchangeTableViewCell.identifier, for: indexPath) as? ExchangeTableViewCell {
            if isSearching{
                cell.configureWithItem(item: self.arrayOfSearch[indexPath.section])
                return cell
            }
            else{
                cell.configureWithItem(item: self.exchangeList[indexPath.section])
                return cell
            }
            
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if isSearching{
            return self.arrayOfSearch.count
        }
        else{
            return self.exchangeList.count
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   
    }
}
