//
//  DetailImageTableViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/05.
//

import UIKit

class DetailImageTableViewCell: UITableViewCell {

    
    @IBOutlet weak var detailImgCV: UICollectionView!
    
    var imageList : [String] = []
    var imaage = [UIImage(named: "banner1"), UIImage(named: "banner2"), UIImage(named: "banner3")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setNib() {
        detailImgCV.delegate = self
        detailImgCV.dataSource = self
        
        let cellNib = UINib(nibName: "DetailImageCollectionViewCell", bundle: nil)
        detailImgCV.register(cellNib, forCellWithReuseIdentifier: "DetailImageCell")
    }
    
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension DetailImageTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return imaage.count
        //return movieVO.popular.count
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailImageCell", for: indexPath) as? DetailImageCollectionViewCell {
            
            //cell.productImg.load(url: imageList[indexPath.row])
            cell.productImg.image = imaage[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: detailImgCV.frame.size.width  , height: detailImgCV.frame.height)
    }
    
    
    //데이터 가져올 함수
    func setCell(data: [String])  {
        self.imageList = data
        self.detailImgCV.reloadData()
    }
}
