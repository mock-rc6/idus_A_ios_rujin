//
//  TodayViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/28.
//

import UIKit

class TodayViewController: UIViewController {
    
    @IBOutlet weak var bannerCV: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var todayData : ProductResult?
    
    var nowPage : Int = 0
    let bannerArray : [UIImage] = [UIImage(named: "banner1")!, UIImage(named: "banner2")!, UIImage(named: "banner3")!, UIImage(named: "banner4")!, UIImage(named: "banner5")!, UIImage(named: "banner6")!, UIImage(named: "banner7")!, UIImage(named: "banner8")!, UIImage(named: "banner9")!, UIImage(named: "banner10")!, UIImage(named: "banner11")!, UIImage(named: "banner12")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerCV.delegate = self
        bannerCV.dataSource = self
        setupTableView()
        bannerTimer()
        TodayDataManager().getTodayViewInfo(viewController: self)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension TodayViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(String(lists.count) + " 줄")
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SmallIconTVC") as? SmallIconTableViewCell else { return UITableViewCell() }
            
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RelatedProductTVC") as? RelatedProductTableViewCell else { return UITableViewCell() }
                
            if let value = todayData {
                cell.setData(value.categoryProductList![0])
            }
                return cell
    
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTVC") as? ProductTableViewCell {
                
                return cell
            }
        default:
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 130
        case 1:
            return 380
        case 2:
            return 380
        default:
            return 100
        }
    }
    
    //tableview cell에 들어갈 cell들의 Nib을 등록
    private func setupTableView() {
        // Register the xib for tableview cell
        tableView.delegate = self
        tableView.dataSource = self
        
        // SmallIconTVC
        let smallIconTableCellNib = UINib(nibName: "SmallIconTableViewCell", bundle: nil)
        self.tableView.register(smallIconTableCellNib, forCellReuseIdentifier: "SmallIconTVC")
        
        // 상품
        let productTableCellNib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        self.tableView.register(productTableCellNib, forCellReuseIdentifier: "ProductTVC")
        
        let relatedProductTableCellNib = UINib(nibName: "RelatedProductTableViewCell", bundle: nil)
        self.tableView.register(relatedProductTableCellNib, forCellReuseIdentifier: "RelatedProductTVC")
    }
}


//MARK: - Banner CollectionView
extension TodayViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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

extension TodayViewController {
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

