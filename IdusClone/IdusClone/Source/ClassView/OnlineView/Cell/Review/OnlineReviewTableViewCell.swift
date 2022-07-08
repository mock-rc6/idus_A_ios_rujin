//
//  OnlineReviewTableViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/08.
//

import UIKit

class OnlineReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewCV: UICollectionView!
    
    var onlineReviewData : [BestReviewList]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Nib 추가
    func setNib() {
        reviewCV.delegate = self
        reviewCV.dataSource = self
        
        let cellNib = UINib(nibName: "OnlineReviewCollectionViewCell", bundle: nil)
        reviewCV.register(cellNib, forCellWithReuseIdentifier: "OnlineReviewCell")
    }
}

extension OnlineReviewTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onlineReviewData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = reviewCV.dequeueReusableCell(withReuseIdentifier: "OnlineReviewCell", for: indexPath) as? OnlineReviewCollectionViewCell else { return UICollectionViewCell() }
        
        if let value = onlineReviewData?[indexPath.row].reviewImg {
            cell.reviewImg.load(url : URL(string: "https://\(value)")!)
        }
        
        switch onlineReviewData?[indexPath.row].rating {
        case 1:
            cell.star2.image = UIImage(systemName: "star")
            cell.star3.image = UIImage(systemName: "star")
            cell.star4.image = UIImage(systemName: "star")
            cell.star5.image = UIImage(systemName: "star")
        case 2:
            cell.star3.image = UIImage(systemName: "star")
            cell.star4.image = UIImage(systemName: "star")
            cell.star5.image = UIImage(systemName: "star")
        case 3:
            cell.star4.image = UIImage(systemName: "star")
            cell.star5.image = UIImage(systemName: "star")
        case 4:
            cell.star5.image = UIImage(systemName: "star")
        default :
            print("별점 5점")
        }
        
        cell.reviewerLbl.text = onlineReviewData?[indexPath.row].nickName
        cell.reviewLbl.text = onlineReviewData?[indexPath.row].contents
        
        if let value = onlineReviewData?[indexPath.row].classImg {
            cell.productImg.load(url : URL(string: "https://\(value)")!)
        }
        cell.productNameLbl.text = onlineReviewData?[indexPath.row].classTitle
    
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        let width = collectionView.bounds.width / 2.17
        return CGSize(width: width, height: width * 1.85)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func setCell(_ data : [BestReviewList])  {
        self.onlineReviewData = data
        self.reviewCV.reloadData()
    }
}
