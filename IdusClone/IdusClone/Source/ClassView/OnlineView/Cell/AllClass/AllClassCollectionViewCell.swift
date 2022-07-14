//
//  AllClassCollectionViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/13.
//

import UIKit

class AllClassCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var classImg: UIImageView!
    @IBOutlet weak var categoryNameLbl: UILabel!
    @IBOutlet weak var classTitle: UILabel!
    
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    @IBOutlet weak var reviewrLbl: UILabel!
    @IBOutlet weak var reviewLbl: UILabel!
    
    @IBOutlet weak var heartBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func pressHeartBtn(_ sender: UIButton) {
        
    }
    

}
