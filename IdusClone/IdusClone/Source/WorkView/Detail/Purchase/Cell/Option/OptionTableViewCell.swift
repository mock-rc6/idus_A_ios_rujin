//
//  OptionTableViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/07.
//

import UIKit

class OptionTableViewCell: UITableViewCell {

    @IBOutlet weak var optionLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
