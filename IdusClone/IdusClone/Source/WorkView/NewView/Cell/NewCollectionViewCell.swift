//
//  NewCollectionViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/05.
//

import UIKit

class NewCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var heartBtn: UIButton!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var writerNameLbl: UILabel!
    @IBOutlet weak var productDetailLbl: UILabel!
    
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func pressHeartBtn(_ sender: UIButton) {
        
    }
    
}
