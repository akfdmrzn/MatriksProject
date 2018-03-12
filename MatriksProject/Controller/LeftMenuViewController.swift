//
//  LeftMenuViewController.swift
//  veriParkAkif
//
//  Created by Akif_PC on 7.03.2018.
//  Copyright © 2018 akif demirezen. All rights reserved.
//

import UIKit

class LeftMenuViewController: BaseController {

    @IBOutlet weak var tableView: UITableView!
    var menuArray : [String] = ["Anasayfaya Dön","Çıkış Yap"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if user.nightModeEnabled{
            self.view.backgroundColor = UIColor.black
        }
        else{
            self.view.backgroundColor = UIColor.white
        }
        tableView?.register(LeftMenuTableViewCell.nib, forCellReuseIdentifier: LeftMenuTableViewCell.identifier)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView.reloadData()
        
    }
    
}
extension LeftMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.view.frame.height * 0.002
        
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView.frame.height * 0.1
    }
}
extension LeftMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: LeftMenuTableViewCell.identifier, for: indexPath) as? LeftMenuTableViewCell {
                cell.configureWithItem(item: self.menuArray[indexPath.section])
                return cell
            
            
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
     
            return self.menuArray.count
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            self.dismiss(animated: true, completion: nil)
        case 1:
            if let appDomain = Bundle.main.bundleIdentifier {
                UserDefaults.standard.removePersistentDomain(forName: appDomain)
            }
            self.performSegue(withIdentifier: "segueGoToLogout", sender: nil)
        default:
        break;
        }
    }
}
