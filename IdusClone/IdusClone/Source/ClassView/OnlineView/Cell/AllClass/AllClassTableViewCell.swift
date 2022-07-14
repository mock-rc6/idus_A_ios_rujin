//
//  AllClassTableViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/13.
//

import UIKit

class AllClassTableViewCell: UITableViewCell {

    @IBOutlet weak var allClassCV: UICollectionView!
    
    var allClassData : [AllOnlineClassesList]?
    var delegate : TransferClassDelegate?
    
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
        allClassCV.delegate = self
        allClassCV.dataSource = self
        
        let cellNib = UINib(nibName: "AllClassCollectionViewCell", bundle: nil)
        allClassCV.register(cellNib, forCellWithReuseIdentifier: "AllClassCell")
    }
}

extension AllClassTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allClassData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = allClassCV.dequeueReusableCell(withReuseIdentifier: "AllClassCell", for: indexPath) as? AllClassCollectionViewCell else { return UICollectionViewCell() }
        
        if let value = allClassData?[indexPath.row].profileImg{
            cell.classImg.load(url : URL(string: "https://\(value)")!)
        }
        
        cell.categoryNameLbl.text = "\(allClassData![indexPath.row].categoryName) . \(allClassData![indexPath.row].writerName) "
        cell.classTitle.text = allClassData![indexPath.row].classTitle
        
        switch allClassData?[indexPath.row].reviewRating {
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
        
        cell.reviewrLbl.text = allClassData![indexPath.row].userName
        cell.reviewLbl.text = allClassData![indexPath.row].contents
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        print("선택 완료")
        let classId = allClassData![indexPath.row].classID
        delegate?.didSelectClass(classId: classId)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 190, height: 299)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func setCell(_ data : [AllOnlineClassesList])  {
        self.allClassData = data
        self.allClassCV.reloadData()
    }
}
