//
//  DetailCommentCollectionViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/07.
//

import UIKit

class DetailCommentCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var customerImg: UIImageView!
    @IBOutlet weak var customerNameLbl: UILabel!
    @IBOutlet weak var customCommentLbl: UILabel!
    
    @IBOutlet weak var writerImg: UIImageView!
    @IBOutlet weak var writerNameLbl: UILabel!
    @IBOutlet weak var writerCommentLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
