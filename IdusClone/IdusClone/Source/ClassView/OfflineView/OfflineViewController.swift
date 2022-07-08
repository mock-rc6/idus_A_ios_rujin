//
//  OfflineViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/29.
//

import UIKit

class OfflineViewController: UIViewController {
    
    var offLineData : OnlineResult?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //ClassDataManager().getOnlineClassData(viewController: self)
        setupTableView()
    }
    
}


extension OfflineViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let line = indexPath.row
        
        switch line {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ClassOfflineBannerTVC") as? ClassOfflineBannerTableViewCell else { return UITableViewCell() }
                
                return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ClassCategoryTableViewCell") as? ClassCategoryTableViewCell else { return UITableViewCell() }
                
                return cell
        default:
            return UITableViewCell()
        }
    
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 350
        case 1:
            return 290
                
        default:
            return 100
        }
    }
    
    
    private func setupTableView() {
       
        tableView.delegate = self
        tableView.dataSource = self
        
        //배너
            let curatingCellNib = UINib(nibName: "ClassOfflineBannerTableViewCell", bundle: nil)
            self.tableView.register(curatingCellNib, forCellReuseIdentifier: "ClassOfflineBannerTVC")
        
       // 카테고리
        let categoryCellNib = UINib(nibName: "ClassCategoryTableViewCell", bundle: nil)
        self.tableView.register(categoryCellNib, forCellReuseIdentifier: "ClassCategoryTableViewCell")
        
    }
}

