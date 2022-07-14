//
//  OnlineDetailViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/13.
//

import UIKit

class OnlineDetailViewController: UIViewController {

    var onlineDetailData : OnlineDetailResult?
    var classId : Int = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTableView()
        self.tabBarController?.tabBar.isHidden = true
        OnlineDetailDataManager().getOnlineDetailData(classId: classId, viewController: self)
    }


 
}

extension OnlineDetailViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OnlineDetailImageTVC") as? OnlineDetailImageTableViewCell else { return UITableViewCell() }
    
            if let value = onlineDetailData {
                print("AAA")
                cell.setCell(data: value.videoURL)
            }
            
            return cell
//        case 1:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailHeaderTVC") as? DetailHeaderTableViewCell else { return UITableViewCell() }
//            print("BBB")
//            if let value = detailData {
//                cell.writerImg.load(url: URL(string: "https://\(value.profileImg)")!)
//                cell.writeNameLbl.titleLabel?.text = "\(String(describing: value.writerName))>"
//                cell.productTitleLbl.text = value.title
//                cell.ratingLbl.text = "\(String(describing: value.rating))"
//                cell.discountRateLbl.text = "\(String(describing: value.discountRate))%"
//                cell.priceLbl.text = cell.decimalWon(value: value.price)
//                cell.finalPriceLbl.text = cell.decimalWon(value: value.finalPrice)
//                cell.reviewCntLbl.text = "(\(String(describing: value.countReview)))"
//                cell.setCell(data: value.shortReviewList)
//            }
//
//            return cell
//        case 2:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailShippingTVC") as? DetailShippingTableViewCell else { return UITableViewCell() }
//
//            if let value = detailData {
//                cell.shippingPriceLbl.text = "\(String(value.deliveryFee))원"
//                cell.freePriceLbl.text = "(\(String(value.freeAmount))원 이상 무료배송)"
//            }
//
//            return cell
//        case 3:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailProductInfoTVC") as? DetailProductInfoTableViewCell else { return UITableViewCell() }
//
//            if let value = detailData {
//                cell.productContentLbl.text = value.contents
//            }
//
//            return cell
//        case 4:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailMidTVC") as? DetailMidTableViewCell else { return UITableViewCell() }
//
//            return cell
//        case 5:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailReviewTVC") as? DetailReviewTableViewCell else { return UITableViewCell() }
//
//            if let value = detailData {
//                cell.setCell(data: reviewData)
//                cell.reviewCntLbl.text = "구매후기 (\(value.countReview))"
//            }
//
//            return cell
//        case 6:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCommentTVC") as? DetailCommentTableViewCell else { return UITableViewCell() }
//
//            cell.setCell(data: commentData)
//
//            return cell
//        case 7:
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailWriterTVC") as? DetailWriterTableViewCell else { return UITableViewCell() }
//
//            if let value = detailData {
//                cell.writerImg.load(url: URL(string: "https://\(value.profileImg)")!)
//                cell.writerNameLbl.text = value.writerName
//
//                cell.rateLbl.text = String(value.ratingAverage)
//                cell.reviewCntLbl.text = "(\(value.countAllReview))"
//
//                cell.likeCntLbl.text = String(value.countAllLike)
//                cell.followerCntLbl.text = String(value.countFollow)
//                cell.supporterCntLbl.text = String(value.countSupport)
//
//            }
//
//            return cell
        default :
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 218
//        case 1:
//            return 414
//        case 2:
//            return 458
//        case 3:
//            return 161
//        case 4:
//            return 260
//        case 5:
//            return 842
//        case 6:
//            return 842
//        case 7:
//            return 195
        default:
            return 100
        }
    }
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        // 이미지 셀
        let detailImgCell = UINib(nibName: "OnlineDetailImageTableViewCell", bundle: nil)
        tableView.register(detailImgCell, forCellReuseIdentifier: "OnlineDetailImageTVC")
        
//        // 헤더 셀
//        let headerCell = UINib(nibName: "DetailHeaderTableViewCell", bundle: nil)
//        tableView.register(headerCell, forCellReuseIdentifier: "DetailHeaderTVC")
//
//        // 배송 셀
//        let shippingCell = UINib(nibName: "DetailShippingTableViewCell", bundle: nil)
//        tableView.register(shippingCell, forCellReuseIdentifier: "DetailShippingTVC")
//
//        // 작품 정보 셀
//        let productInfoCell = UINib(nibName: "DetailProductInfoTableViewCell", bundle: nil)
//        tableView.register(productInfoCell, forCellReuseIdentifier: "DetailProductInfoTVC")
//
//        // Mid 셀
//        let midCell = UINib(nibName: "DetailMidTableViewCell", bundle: nil)
//        tableView.register(midCell, forCellReuseIdentifier: "DetailMidTVC")
//
//        // Review 셀
//        let reviewCell = UINib(nibName: "DetailReviewTableViewCell", bundle: nil)
//        tableView.register(reviewCell, forCellReuseIdentifier: "DetailReviewTVC")
//
//        // Comment 셀
//        let commentCell = UINib(nibName: "DetailCommentTableViewCell", bundle: nil)
//        tableView.register(commentCell, forCellReuseIdentifier: "DetailCommentTVC")
//
//        // 작가 셀
//        let writerCell = UINib(nibName: "DetailWriterTableViewCell", bundle: nil)
//        tableView.register(writerCell, forCellReuseIdentifier: "DetailWriterTVC")
        
    }
}
