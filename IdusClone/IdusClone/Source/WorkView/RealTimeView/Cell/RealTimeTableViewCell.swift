//
//  RealTimeTableViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/04.
//

import UIKit

class RealTimeTableViewCell: UITableViewCell {

    @IBOutlet weak var realTimeCV: UICollectionView!
    
    var realTimeProductData : [RealTimeProduct] = []
    var cellheight = 1.7
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - nib 세팅
    func setNib() {
        
        realTimeCV.delegate = self
        realTimeCV.dataSource = self
        
        let cellNib = UINib(nibName: "RealTimeCollectionViewCell", bundle: nil)
        realTimeCV.register(cellNib, forCellWithReuseIdentifier: "RealTimeCell")
    }

}

extension RealTimeTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return realTimeProductData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = realTimeCV.dequeueReusableCell(withReuseIdentifier: "RealTimeCell", for: indexPath) as? RealTimeCollectionViewCell else { return UICollectionViewCell() }
        
        cell.productImg.load(url: realTimeProductData[indexPath.row].imgURL)
        cell.writerNameLbl.text = realTimeProductData[indexPath.row].writerName
        cell.productDetailLbl.text = realTimeProductData[indexPath.row].title
        
        switch Int(realTimeProductData[indexPath.row].rating!) {
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
        
        cell.rateLbl.text = String(realTimeProductData[indexPath.row].rating!)
        cell.reviewCntLbl.text = "(\(String(realTimeProductData[indexPath.row].countReview!)))"
        cell.reviewLbl.text = realTimeProductData[indexPath.row].reviewContents
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        let width = collectionView.bounds.width / 2.17
        return CGSize(width: width, height: width * CGFloat(cellheight))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func setCell(_ data : [RealTimeProduct]) {
        realTimeProductData = data
        realTimeCV.reloadData()
    }
    
    func setHeight(height : Double) {
        self.cellheight = height
        self.realTimeCV.reloadData()
    }
    
}


