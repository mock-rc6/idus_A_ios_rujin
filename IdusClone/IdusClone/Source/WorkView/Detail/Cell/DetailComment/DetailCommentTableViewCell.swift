//
//  DetailCommentTableViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/07.
//

import UIKit

class DetailCommentTableViewCell: UITableViewCell {

    var comments : [CommentResult] = []
    
    @IBOutlet weak var commentCV: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setNib() {
        commentCV.delegate = self
        commentCV.dataSource = self
        
        let cellNib = UINib(nibName: "DetailCommentCollectionViewCell", bundle: nil)
        commentCV.register(cellNib, forCellWithReuseIdentifier: "DetailCommentCell")
    }
}

extension DetailCommentTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comments.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = commentCV.dequeueReusableCell(withReuseIdentifier: "DetailCommentCell", for: indexPath) as? DetailCommentCollectionViewCell else { return UICollectionViewCell() }
        
       //cell.customerImg.load(url: comments[indexPath.row].userProfileImg!)
        cell.customerNameLbl.text = comments[indexPath.row].userName
        cell.customCommentLbl.text = comments[indexPath.row].userComment
        
        //cell.writerImg.load(url: comments[indexPath.row].writerProfileImg)
        cell.writerNameLbl.text = comments[indexPath.row].writerName
        cell.writerCommentLbl.text = comments[indexPath.row].writerComment
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: commentCV.frame.size.width  , height: 148 )
    }
    
    func setCell(data : [CommentResult]) {
        self.comments = data
        commentCV.reloadData()
    }
    
}
