//
//  SmallIconTableViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/01.
//

import UIKit
import MSPeekCollectionViewDelegateImplementation

class SmallIconTableViewCell: UITableViewCell, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var smallIconCV: UICollectionView!
    
    let smallIconArray: [UIImage] = [UIImage(named: "이벤트아이콘1")!,UIImage(named: "이벤트아이콘1")!,UIImage(named: "이벤트아이콘1")!,UIImage(named: "이벤트아이콘1")!,UIImage(named: "이벤트아이콘1")!,UIImage(named: "이벤트아이콘1")!,UIImage(named: "이벤트아이콘1")!,UIImage(named: "이벤트아이콘1")!,UIImage(named: "이벤트아이콘1")!,UIImage(named: "이벤트아이콘1")!,UIImage(named: "이벤트아이콘1")!,UIImage(named: "이벤트아이콘1")!,UIImage(named: "이벤트아이콘1")!,UIImage(named: "이벤트아이콘1")!,UIImage(named: "이벤트아이콘1")!,UIImage(named: "이벤트아이콘1")!,UIImage(named: "이벤트아이콘1")!,UIImage(named: "이벤트아이콘1")!,UIImage(named: "이벤트아이콘1")!,UIImage(named: "이벤트아이콘1")!,]
    
    let behavior = MSCollectionViewPeekingBehavior()
    
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
        behavior.cellSpacing = 2
        behavior.cellPeekWidth = 17
        behavior.numberOfItemsToShow = 5
        smallIconCV.configureForPeekingBehavior(behavior: behavior)
    }
    
}

//MARK: TableViewCell - UICollectionViewDelegate, UICollectionViewDataSource
extension SmallIconTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return smallIconArray.count
        //return movieVO.popular.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SmallIconCell", for: indexPath) as? SmallIconCollectionViewCell {
            
            cell.iconImage.image = smallIconArray[indexPath.row]
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        behavior.scrollViewWillEndDragging(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
    

    // MARK: Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.smallIconCV.bounds.width / 10, height: 70 )
    }
}
