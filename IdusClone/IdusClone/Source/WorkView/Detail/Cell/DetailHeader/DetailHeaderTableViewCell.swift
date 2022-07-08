//
//  DetailHeaderTableViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/06.
//

import UIKit

class DetailHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var writerImg: UIImageView!
    @IBOutlet weak var writeNameLbl: UIButton!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var reviewCntLbl: UILabel!
    
    @IBOutlet weak var productTitleLbl: UILabel!
    @IBOutlet weak var discountRateLbl: UILabel!
    
    @IBOutlet weak var finalPriceLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    
    @IBOutlet weak var reviewCV: UICollectionView!
    
    var reviewData : [ShortReviewList] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        
        priceLbl.attributedText = priceLbl.text?.strikeThrough()
        setNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setNib() {
        reviewCV.delegate = self
        reviewCV.dataSource = self
        
        let cellNib = UINib(nibName: "DetailHeaderCollectionViewCell", bundle: nil)
        reviewCV.register(cellNib, forCellWithReuseIdentifier: "DetailHeaderCell")
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension DetailHeaderTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = reviewCV.dequeueReusableCell(withReuseIdentifier: "DetailHeaderCell", for: indexPath) as? DetailHeaderCollectionViewCell else { return UICollectionViewCell() }
        
        if let value = reviewData[indexPath.row].imgURL {
            cell.reviewImg.load(url: URL(string: "https://\(value)")!)
        }
        
        cell.reviewLbl.text = reviewData[indexPath.row].contents
        
        return cell
    }
    
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: reviewCV.frame.size.width  , height: reviewCV.frame.height)
    }
    
    
    //데이터 가져올 함수
    func setCell(data: [ShortReviewList])  {
        self.reviewData = data
        print("숏리뷰")
        self.reviewCV.reloadData()
    }
    
    // 변환
    func decimalWon(value: Int) -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let result = numberFormatter.string(from: NSNumber(value: value))! + "원"
            
            return result
        }
}
