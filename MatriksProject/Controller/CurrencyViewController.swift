//
//  CurrencyViewController.swift
//  MatriksProject
//
//  Created by akif demirezen on 11/03/2018.
//  Copyright © 2018 demirezenOrganization. All rights reserved.
//

import UIKit

class CurrencyViewController: BaseController,NavigationBarSetUpProtocol,TabbarSetupControl {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableviewOfCurrency: UITableView!
 
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBOutlet weak var labelTotalDeepPrice: CustomLabel!
    @IBOutlet weak var nightModeState: UIImageView!
    
    var modelCurrency = ModelOfCurrency()
    var choosenIndex = ResponseModelCurrency()
    var arrayOfSearch = [ResponseModelCurrency]()
    var isSearching = false
    let refreshControl = UIRefreshControl()
    fileprivate var currencyList : [ResponseModelCurrency] = []{
        didSet{
            refreshControl.endRefreshing()
            self.tableviewOfCurrency.reloadData()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if user.nightModeEnabled{
            self.mySwitch.isOn = true
            self.searchBar.barStyle = .black
            self.nightModeState.image = #imageLiteral(resourceName: "night-mode")
            setupNavigationBar(color: UIColor(red: 27/255, green: 40/255, blue: 40/255, alpha: 1.0),textColor: .white)
            setupTabBar(color: UIColor(red: 47/255, green: 48/255, blue: 50/255, alpha: 1.0))
            
        }
        else{
            self.mySwitch.isOn = false
            self.searchBar.barStyle = .default
            self.nightModeState.image = #imageLiteral(resourceName: "morning")
            setupNavigationBar(color: .white,textColor: .black)
            setupTabBar(color: .white)
        }
        self.mySwitch.isUserInteractionEnabled = true
        mySwitch.addTarget(self, action: #selector(self.switchChanged(_:)), for: UIControlEvents.valueChanged)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "enableNightMode"), object: nil)
        refreshControl.addTarget(self, action: #selector(makeRefresh), for: .valueChanged)
        tableviewOfCurrency.refreshControl = refreshControl
        
        
        searchBar.returnKeyType = UIReturnKeyType.done
        searchBar.delegate = self
        tableviewOfCurrency?.register(CurrencyTableViewCell.nib, forCellReuseIdentifier: CurrencyTableViewCell.identifier)
        tableviewOfCurrency?.delegate = self
        tableviewOfCurrency?.dataSource = self
        
        self.modelCurrency.currencyDelegate = self
        self.modelCurrency.sendDataToService()
        self.indicatorShow(status: true)
        
        
    }
    @objc func makeRefresh(refreshControl: UIRefreshControl) {
        
        self.modelCurrency.sendDataToService()
        
    }
    @objc func switchChanged(_ mySwitch: UISwitch) {
        self.tableviewOfCurrency.reloadData()
        if mySwitch.isOn {
            self.searchBar.barStyle = .black
            setupNavigationBar(color: UIColor(red: 27/255, green: 40/255, blue: 40/255, alpha: 1.0),textColor: .white)
            setupTabBar(color: UIColor(red: 47/255, green: 48/255, blue: 50/255, alpha: 1.0))
            UITabBar.appearance().barTintColor = UIColor.black
            self.tabBarController?.setNeedsStatusBarAppearanceUpdate()
            user.nightModeEnabled = true
            self.nightModeState.image = #imageLiteral(resourceName: "night-mode")
        } else {
            self.searchBar.barStyle = .default
            setupNavigationBar(color: .white, textColor: .black)
            setupTabBar(color: .white)
            UITabBar.appearance().barTintColor = UIColor.white
            self.tabBarController?.setNeedsStatusBarAppearanceUpdate()
            
            user.nightModeEnabled = false
            self.nightModeState.image = #imageLiteral(resourceName: "morning")
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "enableNightMode"), object: nil)
        
    }

}
extension CurrencyViewController : CurrencyDelegate{
    func getDataSuccesfully(isCorrect: Bool, message: String, responseData: [ResponseModelCurrency], deepTotalPrice: Double) {
        self.indicatorShow(status: false)
        if isCorrect{
            self.currencyList = responseData
            self.labelTotalDeepPrice.text = String(deepTotalPrice)
        }
        else{
            showAlert("Servis Tarafında Bir Sorun Oluştu Lütfen Daha Sonra Tekrar Deneyiniz")
        }
        
    }
}
extension CurrencyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.view.frame.height * 0.002
        
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableviewOfCurrency.frame.height * 0.1
    }
}
extension CurrencyViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyTableViewCell.identifier, for: indexPath) as? CurrencyTableViewCell {
            
            if isSearching{
                cell.configureWithItem(item: self.arrayOfSearch[indexPath.section])
                return cell
            }
            else{
                cell.configureWithItem(item: self.currencyList[indexPath.section])
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
            return self.currencyList.count
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
    }
}
extension CurrencyViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""{
            isSearching = false
            view.endEditing(true)
            tableviewOfCurrency.reloadData()
        }
        else {
            isSearching = true
            arrayOfSearch = currencyList.filter { $0.menkul.localizedCaseInsensitiveContains(searchBar.text!) }
            tableviewOfCurrency.reloadData()
        }
    }
}
