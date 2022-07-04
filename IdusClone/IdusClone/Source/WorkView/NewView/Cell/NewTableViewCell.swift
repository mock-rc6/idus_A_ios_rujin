//
//  NewTableViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/05.
//

import UIKit

class NewTableViewCell: UITableViewCell {

    @IBOutlet weak var newCV: UICollectionView!
    
    var newProductData : [NewProductsList] = []
    var cellheight = 1.7
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        setNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - nib 추가
    func setNib() {
        newCV.delegate = self
        newCV.dataSource = self
        
        let cellNib = UINib(nibName: "NewCollectionViewCell", bundle: nil)
        newCV.register(cellNib, forCellWithReuseIdentifier: "NewCell")
    }
    
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension NewTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newProductData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = newCV.dequeueReusableCell(withReuseIdentifier: "NewCell", for: indexPath) as? NewCollectionViewCell else { return UICollectionViewCell() }
        
        cell.productImg.load(url: newProductData[indexPath.row].imgURL)
        cell.writerNameLbl.text = newProductData[indexPath.row].writerName
        cell.productDetailLbl.text = newProductData[indexPath.row].title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        let width = collectionView.bounds.width / 2.17
        return CGSize(width: width, height: width * CGFloat(cellheight))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func setCell(_ data : [NewProductsList]) {
        newProductData = data
        newCV.reloadData()
    }
    
    func setHeight(height : Double) {
        self.cellheight = height
        self.newCV.reloadData()
    }
}
