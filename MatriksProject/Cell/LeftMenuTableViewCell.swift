//
//  LeftMenuTableViewCell.swift
//  MatriksProject
//
//  Created by akif demirezen on 13/03/2018.
//  Copyright © 2018 demirezenOrganization. All rights reserved.
//

import UIKit

class LeftMenuTableViewCell: UITableViewCell {
    @IBOutlet weak var labelProcessName: CustomLabel!
    
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: nil)   }
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureWithItem(item : String){
        self.labelProcessName.text(name: item)
    }
    
    
    
}
