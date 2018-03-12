//
//  CurrencyTableViewCell.swift
//  MatriksProject
//
//  Created by Akif_PC on 12.03.2018.
//  Copyright © 2018 demirezenOrganization. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewOfCurrency: UIImageView!
    
    @IBOutlet weak var labelMenkul: CustomLabel!
    
    @IBOutlet weak var labelMenkul_T2: CustomLabel!
    @IBOutlet weak var labelPrice: CustomLabel!
    @IBOutlet weak var labelTotal: CustomLabel!
    
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
    
    func configureWithItem (item : ResponseModelCurrency) {
        self.labelMenkul.text(name: item.menkul)
        self.labelMenkul_T2.text(name: String(item.menkul_T2))
        self.labelPrice.text(name: String(item.price))
        self.labelTotal.text(name:  String(item.total))
    }
        
    
    
    
}
