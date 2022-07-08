//
//  RelatedProductTableViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/01.
//

import UIKit

protocol TransferDelegate : AnyObject {
    func didSelectProduct(productId : Int)
}

class RelatedProductTableViewCell: UITableViewCell {

    @IBOutlet weak var bottomBtn: UIButton!
    @IBOutlet weak var relatedProductCV: UICollectionView!
    
    var relatedProductData : CategoryProductList?
    var delegate : TransferDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setNib()
    }

    @IBAction func pressUpperBtn(_ sender: UIButton) {
    }
    
    
    @IBAction func pressBottomBtn(_ sender: UIButton) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setNib() {
        relatedProductCV.delegate = self
        relatedProductCV.dataSource = self
        
        let cellNib = UINib(nibName: "RelatedProductCollectionViewCell", bundle: nil)
        self.relatedProductCV.register(cellNib, forCellWithReuseIdentifier: "RelatedProductCell")
    }
}

//MARK: TableViewCell - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension RelatedProductTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return relatedProductData?.productsList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RelatedProductCell", for: indexPath) as? RelatedProductCollectionViewCell {
            
            if let value = relatedProductData?.productsList[indexPath.row].productImg {
                cell.productImg.load(url: URL(string: "https://\(value)")!)
            }
            cell.productLbl.text = relatedProductData?.productsList[indexPath.row].productTitle
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let productId = relatedProductData?.productsList[indexPath.row].productID
        delegate?.didSelectProduct(productId : productId!)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            // 컬렉션 뷰 한 줄에 2개가 딱 맞게 정사각형으로 들어가게!
        let width = collectionView.bounds.width / 2.17
        return CGSize(width: width, height: width * 1.85)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func setData(_ data : CategoryProductList) {
        self.relatedProductData = data
        self.relatedProductCV.reloadData()
    }
}
