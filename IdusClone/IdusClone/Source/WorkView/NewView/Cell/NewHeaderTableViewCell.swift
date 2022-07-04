//
//  NewHeaderTableViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/05.
//

import UIKit

protocol ImgCheckDelegate : AnyObject {
    func didSelectCheckBtn(isChecked : Bool)
}
class NewHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var baseTimeLbl: UILabel!
    @IBOutlet weak var checkBtn: UIButton!
    
    var delegate : ImgCheckDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func pressCheckBtn(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            sender.setImage(UIImage(systemName: "square"), for : UIControl.State.normal)
            print("이미지 x")
            delegate?.didSelectCheckBtn(isChecked: false)
        }
        else {
            sender.isSelected = true
            print("이미지 o")
            sender.setImage(UIImage(systemName: "checkmark.square"), for : UIControl.State.normal)
            delegate?.didSelectCheckBtn(isChecked: true)
        }
    }
}
