//
//  SelectedOptionTableViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/07.
//

import UIKit

class SelectedOptionTableViewCell: UITableViewCell {

    
    @IBOutlet weak var selectedProductLbl: UILabel!
    @IBOutlet weak var productPriceLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func pressCloseBtn(_ sender: UIButton) {
        
    }
    
    
}
