//
//  CustomTabBarController.swift
//  veriParkAkif
//
//  Created by Akif_PC on 7.03.2018.
//  Copyright © 2018 akif demirezen. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    var user = UserModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.contentMode = UIViewContentMode.scaleToFill
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: (self.navigationController?.navigationBar.frame.width)!/2, height: (self.navigationController?.navigationBar.frame.height)!))
        imageView.frame = titleView.bounds
        titleView.addSubview(imageView)
        self.navigationItem.titleView = titleView
        
        
    }

   
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
