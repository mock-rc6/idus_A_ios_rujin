//
//  SmallIconTableViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/01.
//

import UIKit

class SmallIconTableViewCell: UITableViewCell {
    
    @IBOutlet weak var smallIconCV: UICollectionView!
    
    let smallIconArray: [UIImage] = [UIImage(named: "Best선물")!,UIImage(named: "핫이슈")!,UIImage(named: "상반기결산")!,UIImage(named: "취미클래스")!,UIImage(named: "지금할인중2")!,UIImage(named: "첫구매가이드")!,UIImage(named: "남성")!,UIImage(named: "친구초대")!,UIImage(named: "오프라인숍")!,UIImage(named: "식품")!,UIImage(named: "패션잡화")!,UIImage(named: "제로웨이스트")!,UIImage(named: "디자인문구")!,UIImage(named: "크라우드펀딩")!,UIImage(named: "주얼리")!,UIImage(named: "주방용품")!,UIImage(named: "뷰티")!,UIImage(named: "반려동물")!]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setNib()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK: - nib 파일 추가
    func setNib()  {
        self.smallIconCV.dataSource = self
        self.smallIconCV.delegate = self
        
        let cellNib = UINib(nibName: "SmallIconCollectionViewCell", bundle: nil)
        self.smallIconCV.register(cellNib, forCellWithReuseIdentifier: "SmallIconCell")
        
    }
    
}

//MARK: TableViewCell - UICollectionViewDelegate, UICollectionViewDataSource
extension SmallIconTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return smallIconArray.count
        //return movieVO.popular.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SmallIconCell", for: indexPath) as? SmallIconCollectionViewCell {
            
            cell.iconImage.image = smallIconArray[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    
    // MARK: Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        return CGSize(width: 70, height: 70)
    }
}
