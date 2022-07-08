//
//  BannerTableViewCell.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/06.
//

import UIKit

class OnlineBannerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bannerCV: UICollectionView!
    
    var nowPage : Int = 0
    let bannerArray : [UIImage] = [UIImage(named: "배너1")!, UIImage(named: "배너2")!, UIImage(named: "배너3")!, UIImage(named: "배너4")!, UIImage(named: "배너5")!]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setNib() {
        bannerCV.delegate = self
        bannerCV.dataSource = self
        
        let cellNib = UINib(nibName: "OnlineBannerCollectionViewCell", bundle: nil)
        bannerCV.register(cellNib, forCellWithReuseIdentifier: "OnlineBannerCell")
        
        bannerTimer()
    }
}

//MARK: - Banner CollectionView
extension OnlineBannerTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = bannerCV.dequeueReusableCell(withReuseIdentifier: "OnlineBannerCell", for: indexPath) as? OnlineBannerCollectionViewCell else { return UICollectionViewCell() }
        cell.bannerImg.image = bannerArray[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bannerCV.frame.size.width  , height:  bannerCV.frame.height)
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
}

//MARK: - banner Timer 세팅

extension OnlineBannerTableViewCell {
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    // 배너 움직이는 매서드
    func bannerMove() {
        // 현재페이지가 마지막 페이지일 경우
        if nowPage == bannerArray.count-1 {
            // 맨 처음 페이지로 돌아감
            bannerCV.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowPage = 0
            return
        }
        // 다음 페이지로 전환
        nowPage += 1
        bannerCV.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
    }
}
