//
//  ReviewTableViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/02.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bottomBtn: UIButton!
    
    @IBOutlet weak var reviewCV: UICollectionView!
    
    var reviewData : [ProductReviewList]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        setNib()
    }
    
    //MARK: - 상단 더보기 버튼
    @IBAction func pressUpperBtn(_ sender: UIButton) {
        
    }
    
    //MARK: - 하단 더보기 버튼
    @IBAction func pressBottomBtn(_ sender: UIButton) {
        
    }
    
    //MARK: - Nib 추가
    func setNib() {
        reviewCV.delegate = self
        reviewCV.dataSource = self
        
        let cellNib = UINib(nibName: "ReviewCollectionViewCell", bundle: nil)
        reviewCV.register(cellNib, forCellWithReuseIdentifier: "ReviewCell")
    }
    
}

extension ReviewTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviewData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = reviewCV.dequeueReusableCell(withReuseIdentifier: "ReviewCell", for: indexPath) as? ReviewCollectionViewCell else { return UICollectionViewCell() }
        
        //cell.reviewImg.load(url : (reviewData?[indexPath.row].reviewImg)!)
        cell.reviewImg.image = UIImage(named: "productSample")
        
        switch reviewData?[indexPath.row].rating {
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
        
        cell.reviewerLbl.text = reviewData?[indexPath.row].nickName
        cell.reviewLbl.text = reviewData?[indexPath.row].contents
        
        //cell.productImg.load(url : (reviewData?[indexPath.row].productImg)!)
        cell.productImg.image = UIImage(named: "productSample")
        cell.productNameLbl.text = reviewData?[indexPath.row].productTitle
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        let width = collectionView.bounds.width / 2.17
        return CGSize(width: width, height: width * 1.85)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func setCell(_ data : [ProductReviewList])  {
        self.reviewData = data
        self.reviewCV.reloadData()
    }
}
