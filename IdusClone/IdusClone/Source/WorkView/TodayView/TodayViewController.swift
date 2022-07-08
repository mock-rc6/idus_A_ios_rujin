//
//  TodayViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/28.
//

import UIKit

class TodayViewController: UIViewController, TransferDelegate {
    func didSelectProduct(productId : Int) {
        let vc = UIStoryboard(name: "DetailView", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        vc.productId = productId
        
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    var todayData : ProductResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        TodayDataManager().getTodayViewInfo(viewController: self)
    
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension TodayViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (todayData?.categoryProductList.count ?? 0) + 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let line = indexPath.row
        
        switch line {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "BannerTVC") as? BannerTableViewCell else { return UITableViewCell() }
            
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SmallIconTVC") as? SmallIconTableViewCell else { return UITableViewCell() }
            
            return cell
            
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RelatedProductTVC") as? RelatedProductTableViewCell else { return UITableViewCell() }
                
            cell.delegate = self
            if let value = todayData {
                cell.setData(value.categoryProductList[0])
            }
                return cell
    
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTVC") as? ProductTableViewCell else { return UITableViewCell() }
                
            cell.delegate = self
            if let value = todayData {
                cell.setCell(value.categoryProductList[line-3])
                cell.titleLbl.text = "#\(String(describing: todayData!.categoryProductList[line-3].categoryName))"
            }
                return cell
            
        case 4:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTVC") as? ProductTableViewCell else { return UITableViewCell() }
                
            cell.delegate = self
            if let value = todayData {
                cell.setCell(value.categoryProductList[line-3])
                cell.titleLbl.text = "#\(String(describing: todayData!.categoryProductList[line-3].categoryName))"
            }
                return cell
        case 5:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTVC") as? ProductTableViewCell else { return UITableViewCell() }
                
            cell.delegate = self
            if let value = todayData {
                cell.setCell(value.categoryProductList[line-3])
                cell.titleLbl.text = "#\(String(describing: todayData!.categoryProductList[line-3].categoryName))"
            }
                return cell
        case 6:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTVC") as? ReviewTableViewCell else { return UITableViewCell() }

            if let value = todayData {
                cell.setCell(value.productReviewList)
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
        case 2, 3, 4, 5:
            return 380
        case 6:
            return 500
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
        let bannerTableCellNib = UINib(nibName: "BannerTableViewCell", bundle: nil)
        self.tableView.register(bannerTableCellNib, forCellReuseIdentifier: "BannerTVC")
        
        // SmallIconTVC
        let smallIconTableCellNib = UINib(nibName: "SmallIconTableViewCell", bundle: nil)
        self.tableView.register(smallIconTableCellNib, forCellReuseIdentifier: "SmallIconTVC")
        
        // 상품
        let productTableCellNib = UINib(nibName: "ProductTableViewCell", bundle: nil)
        self.tableView.register(productTableCellNib, forCellReuseIdentifier: "ProductTVC")
        
        let relatedProductTableCellNib = UINib(nibName: "RelatedProductTableViewCell", bundle: nil)
        self.tableView.register(relatedProductTableCellNib, forCellReuseIdentifier: "RelatedProductTVC")
        
        let reviewTableCellNib = UINib(nibName: "ReviewTableViewCell", bundle: nil)
        self.tableView.register(reviewTableCellNib, forCellReuseIdentifier: "ReviewTVC")
    }
}




