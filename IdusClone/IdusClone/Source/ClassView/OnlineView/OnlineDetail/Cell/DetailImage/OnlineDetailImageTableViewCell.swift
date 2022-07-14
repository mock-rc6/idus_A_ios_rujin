//
//  OnlineDetailImageTableViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/13.
//

import UIKit

class OnlineDetailImageTableViewCell: UITableViewCell {

    var imageData : String = ""
    
    @IBOutlet weak var classImgCV: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setNib() {
        classImgCV.delegate = self
        classImgCV.dataSource = self
        
        let cellNib = UINib(nibName: "OnlineDetailImageCollectionViewCell", bundle: nil)
        classImgCV.register(cellNib, forCellWithReuseIdentifier: "OnlineDetailImageCell")
    }
}

extension OnlineDetailImageTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 1
        //return movieVO.popular.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnlineDetailImageCell", for: indexPath) as? OnlineDetailImageCollectionViewCell {
            
            print(imageData)
            cell.classImg.load(url: URL(string :"https://\(imageData)")!)
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            return CGSize(width: classImgCV.frame.size.width  , height:  classImgCV.frame.height)
    }
    
    
    //데이터 가져올 함수
    func setCell(data : String)  {
        self.imageData = data
        self.classImgCV.reloadData()
    }
}

