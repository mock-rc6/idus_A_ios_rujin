//
//  OnlineViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/29.
//

import UIKit

class OnlineViewController: UIViewController {
    
    var onlineData : OnlineResult?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ClassDataManager().getOnlineClassData(viewController: self)
        setupTableView()
    }
    
}


extension OnlineViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let line = indexPath.row
        
        switch line {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OnlineBannerTVC") as? OnlineBannerTableViewCell else { return UITableViewCell() }
            
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OnlineSmallIconTVC") as? OnlineSmallIconTableViewCell else { return UITableViewCell() }
            
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OnlineReviewTVC") as? OnlineReviewTableViewCell else { return UITableViewCell() }
            
            if let value = onlineData {
                print("AAAReVIEW")
                cell.setCell(value.bestReviewList)
            }
            
            return cell
    
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 200
        case 1:
            return 130
        case 2:
            return 441
        default:
            return 100
        }
    }
    
    //tableview cell에 들어갈 cell들의 Nib을 등록
    private func setupTableView() {
        // Register the xib for tableview cell
        tableView.delegate = self
        tableView.dataSource = self
        
        // 배너
        let bannerTableCellNib = UINib(nibName: "OnlineBannerTableViewCell", bundle: nil)
        self.tableView.register(bannerTableCellNib, forCellReuseIdentifier: "OnlineBannerTVC")
        
        let smallIconCellNib = UINib(nibName: "OnlineSmallIconTableViewCell", bundle: nil)
        self.tableView.register(smallIconCellNib, forCellReuseIdentifier: "OnlineSmallIconTVC")
        
        let reviewTableCellNib = UINib(nibName: "OnlineReviewTableViewCell", bundle: nil)
        self.tableView.register(reviewTableCellNib, forCellReuseIdentifier: "OnlineReviewTVC")
        
    }
}
