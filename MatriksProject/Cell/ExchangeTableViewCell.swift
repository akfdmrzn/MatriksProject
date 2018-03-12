//
//  ExchangeTableViewCell.swift
//  MatriksProject
//
//  Created by Akif_PC on 12.03.2018.
//  Copyright © 2018 demirezenOrganization. All rights reserved.
//

import UIKit

class ExchangeTableViewCell: UITableViewCell {

    @IBOutlet weak var imageViewOfState: UIImageView!
    @IBOutlet weak var labelName: CustomLabel!
    @IBOutlet weak var labelSelling: CustomLabel!
    @IBOutlet weak var labelBuying: CustomLabel!
    
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
    func configureWithItem (item : ResponseModelExchange){
        self.imageViewOfState.image = item.imageOfState
        self.labelName.text(name: item.name)
        self.labelBuying.text(name: String(item.buying))
        self.labelSelling.text(name : String(item.selling))
    }
    
    
}
