//
//  OnlineReviewCollectionViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/08.
//

import UIKit

class OnlineReviewCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var reviewImg: UIImageView!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    @IBOutlet weak var reviewerLbl: UILabel!
    @IBOutlet weak var reviewLbl: UILabel!
    
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
