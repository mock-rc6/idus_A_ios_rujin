//
//  DetailWriterTableViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/07.
//

import UIKit

class DetailWriterTableViewCell: UITableViewCell {

    @IBOutlet weak var writerImg: UIImageView!
    @IBOutlet weak var writerNameLbl: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var reviewCntLbl: UILabel!
    
    @IBOutlet weak var likeCntLbl: UILabel!
    @IBOutlet weak var followerCntLbl: UILabel!
    @IBOutlet weak var supporterCntLbl: UILabel!
    
    @IBOutlet weak var followBtn: UIButton!
    @IBOutlet weak var feedBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        followBtn.layer.borderColor = UIColor.red.cgColor
        followBtn.layer.borderWidth = 1.0
        feedBtn.layer.borderColor = UIColor.gray.cgColor
        feedBtn.layer.borderWidth = 1.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
