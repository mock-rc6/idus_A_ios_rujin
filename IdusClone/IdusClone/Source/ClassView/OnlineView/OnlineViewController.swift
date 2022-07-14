//
//  OnlineViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/29.
//

import UIKit

class OnlineViewController: UIViewController, TransferClassDelegate {
    func didSelectClass(classId: Int) {
        let vc = UIStoryboard(name: "OnlineDetailView", bundle: Bundle.main).instantiateViewController(withIdentifier: "OnlineDetailVC") as! OnlineDetailViewController
        vc.classId = classId
        print("check")
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    var onlineData : OnlineResult?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ClassDataManager().getOnlineClassData(viewController: self)
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
}


extension OnlineViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
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
                
                cell.setCell(value.bestReviewList)
            }
            
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewOpenClassTVC") as? NewOpenClassTableViewCell else { return UITableViewCell() }
            
            if let value = onlineData {
                
                cell.setCell(value.newOpenClassesList)
            }
            
            cell.delegate = self
            
            return cell
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "AllClassTVC") as? AllClassTableViewCell else { return UITableViewCell() }
            
            if let value = onlineData {
                
                cell.setCell(value.allOnlineClassesList)
            }
            
            cell.delegate = self
            
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
        case 3:
            return 524
        case 4:
            return 2400
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
        
        let newOpenClassTableCellNib = UINib(nibName: "NewOpenClassTableViewCell", bundle: nil)
        self.tableView.register(newOpenClassTableCellNib, forCellReuseIdentifier: "NewOpenClassTVC")
        
        let allClassTableCellNib = UINib(nibName: "AllClassTableViewCell", bundle: nil)
        self.tableView.register(allClassTableCellNib, forCellReuseIdentifier: "AllClassTVC")
        
    }
}
