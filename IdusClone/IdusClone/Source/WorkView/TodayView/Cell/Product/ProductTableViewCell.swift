//
//  ProductTableViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/01.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var moreProductBtn: UIButton!
    
    @IBOutlet weak var productCV: UICollectionView!
    
    var productData : CategoryProductList?
    var delegate : TransferDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setNib()
        moreProductBtn.layer.borderWidth = 1
        moreProductBtn.layer.borderColor = UIColor.lightGray.cgColor
        moreProductBtn.layer.cornerRadius = 10
    }

    //MARK: - 상단 더보기 버튼
    @IBAction func pressUpperBtn(_ sender: UIButton) {
    }
    
    //MARK: - 하단 더보기 버튼
    @IBAction func pressBottomBtn(_ sender: UIButton) {
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - nib 파일 추가
    func setNib()  {
        self.productCV.dataSource = self
        self.productCV.delegate = self
        
        let cellNib = UINib(nibName: "ProductCollectionViewCell", bundle: nil)
                self.productCV.register(cellNib, forCellWithReuseIdentifier: "ProductCell")
    }
}

//MARK: TableViewCell - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension ProductTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return productData?.productsList.count ?? 0
        //return movieVO.popular.count
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCollectionViewCell {
            
            if let value = productData?.productsList[indexPath.row].productImg {
                cell.productImage.load(url: URL(string: "https://\(value)")!)
            }
            cell.productLbl.text = productData?.productsList[indexPath.row].productTitle
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let productId = productData?.productsList[indexPath.row].productID
        delegate?.didSelectProduct(productId : productId!)
        print("상품")
        print(productId)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        return CGSize(width: 135, height: 192)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        print("콜렉션 뷰 " + String(indexPath.row))
//
//        let cell = collectionView.cellForItem(at: indexPath) as? TodayGoodsCollectionViewCell
//            self.todayGoodsCellDelegate?.collectionView(collectionviewcell: cell, index: indexPath.item, didTappedInTableViewCell: self)
//
//    }
    
    func setCell(_ data : CategoryProductList)  {
        self.productData = data
        self.productCV.reloadData()
    }
}

