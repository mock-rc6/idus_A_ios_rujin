//
//  DetailReviewTableViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/06.
//

import UIKit

class DetailReviewTableViewCell: UITableViewCell {

    var reviews : [ReviewResult] = []

    @IBOutlet weak var moreReviewBtn: UIButton!
    @IBOutlet weak var reviewCV: UICollectionView!
    
    @IBOutlet weak var reviewCntLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setNib()
        moreReviewBtn.layer.borderColor = UIColor.gray.cgColor
        moreReviewBtn.layer.borderWidth = 1.0
    }

    @IBAction func pressMoreReviewBtn(_ sender: UIButton) {
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setNib() {
        reviewCV.delegate = self
        reviewCV.dataSource = self
        
        let cellNib = UINib(nibName: "DetailReviewCollectionViewCell", bundle: nil)
        reviewCV.register(cellNib, forCellWithReuseIdentifier: "DetailReviewCell")
    }
    
}

extension DetailReviewTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = reviewCV.dequeueReusableCell(withReuseIdentifier: "DetailReviewCell", for: indexPath) as? DetailReviewCollectionViewCell else { return UICollectionViewCell() }
        
        
        cell.reviewerLbl.text = reviews[indexPath.row].nickName
        cell.reviewDateLbl.text = reviews[indexPath.row].createAt
        if let value = reviews[indexPath.row].reviewImg {
            cell.reviewImg.load(url: URL(string: "https://\(value)")!)
        }
        if let value = reviews[indexPath.row].profileImg {
            cell.profileImg.load(url: URL(string: "https://\(value)")!)
        }
        cell.reviewLbl.text = reviews[indexPath.row].contents
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: reviewCV.frame.size.width  , height: 148 )
    }
    
    func setCell(data : [ReviewResult]) {
        self.reviews = data
        reviewCV.reloadData()
    }
    
}
