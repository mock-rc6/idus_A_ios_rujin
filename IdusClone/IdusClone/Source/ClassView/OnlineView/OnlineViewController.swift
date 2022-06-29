//
//  OnlineViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/29.
//

import UIKit

class OnlineViewController: UIViewController {
    
    @IBOutlet weak var bannerCV: UICollectionView!
    
    var nowPage : Int = 0
    let bannerArray : [UIImage] = [UIImage(named: "banner1")!, UIImage(named: "banner2")!, UIImage(named: "banner3")!, UIImage(named: "banner4")!, UIImage(named: "banner5")!, UIImage(named: "banner6")!, UIImage(named: "banner7")!, UIImage(named: "banner8")!, UIImage(named: "banner9")!, UIImage(named: "banner10")!, UIImage(named: "banner11")!, UIImage(named: "banner12")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bannerCV.delegate = self
        bannerCV.dataSource = self
        bannerTimer()
    }
    


}

//MARK: - CollectionView
extension OnlineViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = bannerCV.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
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

extension OnlineViewController {
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