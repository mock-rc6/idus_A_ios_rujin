//
//  RealTimeCollectionViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/04.
//

import UIKit

class RealTimeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var heartBtn: UIButton!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var writerNameLbl: UILabel!
    @IBOutlet weak var productDetailLbl: UILabel!
    
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var reviewCntLbl: UILabel!
    
    @IBOutlet weak var reviewLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func pressHeartBtn(_ sender: UIButton) {
        
    }
    
    
}
