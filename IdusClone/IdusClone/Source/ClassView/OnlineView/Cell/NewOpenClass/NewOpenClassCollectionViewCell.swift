//
//  NewOpenClassCollectionViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/13.
//

import UIKit

class NewOpenClassCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var classImg: UIImageView!
    @IBOutlet weak var categoryWriterLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    
    @IBOutlet weak var hearBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func pressHeartBtn(_ sender: UIButton) {
    }
    

}
