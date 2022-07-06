//
//  DetailReviewCollectionViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/06.
//

import UIKit

class DetailReviewCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var reviewerLbl: UILabel!
    
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    @IBOutlet weak var reviewDateLbl: UILabel!
    @IBOutlet weak var reviewImg: UIImageView!
    @IBOutlet weak var reviewLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
