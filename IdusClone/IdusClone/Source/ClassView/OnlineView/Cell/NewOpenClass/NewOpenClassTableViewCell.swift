//
//  NewOpenClassTableViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/13.
//

import UIKit

protocol TransferClassDelegate : AnyObject {
    func didSelectClass(classId : Int)
}

class NewOpenClassTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newClassCV: UICollectionView!
    
    var newClassData : [NewOpenClassesList]?
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
        newClassCV.delegate = self
        newClassCV.dataSource = self
        
        let cellNib = UINib(nibName: "NewOpenClassCollectionViewCell", bundle: nil)
        newClassCV.register(cellNib, forCellWithReuseIdentifier: "NewOpenClassCell")
    }
    
}

extension NewOpenClassTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newClassData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = newClassCV.dequeueReusableCell(withReuseIdentifier: "NewOpenClassCell", for: indexPath) as? NewOpenClassCollectionViewCell else { return UICollectionViewCell() }
        
        if let value = newClassData?[indexPath.row].profileImg{
            cell.classImg.load(url : URL(string: "https://\(value)")!)
        }
        
        cell.categoryWriterLbl.text = "\(newClassData![indexPath.row].categoryName) . \(newClassData![indexPath.row].writerName) "
        cell.titleLbl.text = newClassData![indexPath.row].title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        let classId = newClassData![indexPath.row].classID
        delegate?.didSelectClass(classId: classId)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 300, height: 130)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func setCell(_ data : [NewOpenClassesList])  {
        self.newClassData = data
        self.newClassCV.reloadData()
    }
}
