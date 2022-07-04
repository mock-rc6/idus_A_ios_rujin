//
//  RealTimeHeaderTableViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/05.
//

import UIKit

protocol CheckDelegate : AnyObject {
    func didSelectOptionBtn(br : Int, img : Int)
}

class RealTimeHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var baseTimeLbl: UILabel!
    
    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var buyBtn: UIButton!
    @IBOutlet weak var reviewBtn: UIButton!
    
    var delegate : CheckDelegate?
    var img : Int = 0
    var br : Int = 1
    
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
            img = 0
            sender.isSelected = false
            sender.setImage(UIImage(systemName: "square"), for : UIControl.State.normal)
            print("이미지 x")
            delegate?.didSelectOptionBtn(br : br, img: img)
            //RealTimeDataManager().getRealTimeProduct(br: br, img: 0, viewController: RealTimeViewController())
        }
        else {
            img = 1
            sender.isSelected = true
            print("이미지 o")
            sender.setImage(UIImage(systemName: "checkmark.square"), for : UIControl.State.normal)
            delegate?.didSelectOptionBtn(br : br, img: img)
            //RealTimeDataManager().getRealTimeProduct(br: br, img: 0, viewController: RealTimeViewController())
        }
    }
    
    @IBAction func pressBuyBtn(_ sender: UIButton) {
        if sender.isSelected == false {
            br = 1
            sender.isSelected = true
            reviewBtn.isSelected = false
            
            sender.setImage(UIImage(named: "실시간 구매_선택"), for : UIControl.State.normal)
            reviewBtn.setImage(UIImage(named: "실시간 후기"), for : UIControl.State.normal)
            delegate?.didSelectOptionBtn(br : br, img: img)
        }
    }
    
    @IBAction func pressReviewBtn(_ sender: UIButton) {
        if sender.isSelected == false {
            br = 0
            sender.isSelected = true
            buyBtn.isSelected = false
            
            sender.setImage(UIImage(named: "실시간 후기_선택"), for : UIControl.State.normal)
            buyBtn.setImage(UIImage(named: "실시간 구매"), for : UIControl.State.normal)
            delegate?.didSelectOptionBtn(br : br, img: img)
        }
    }
    
}
