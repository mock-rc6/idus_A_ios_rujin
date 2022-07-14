//
//  RealTimeViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/28.
//

import UIKit

class RealTimeViewController: UIViewController, CheckDelegate, TransferDelegate {
    func didSelectProduct(productId: Int) {
        let vc = UIStoryboard(name: "DetailView", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        vc.productId = productId
        
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func didSelectOptionBtn(br : Int, img : Int) {
        print("@@##")
        if img == 0 {
            height = 1.7
        }
        else {
            height = 1.0
        }
        RealTimeDataManager().getRealTimeProduct(br: br, img: 0, viewController: self)
        print("br : \(br)")
        print("img : \(img)")
    }
    
    
    var height = 1.7
    var realTimeData : RealTimeResult?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = false
        setupTableView()
        RealTimeDataManager().getRealTimeProduct(br: 1, img: 0, viewController: self)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

 
}

extension RealTimeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let line = indexPath.row
        
        switch line {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RealTimeHeaderTVC") as? RealTimeHeaderTableViewCell else { return UITableViewCell() }
            
            cell.baseTimeLbl.text = realTimeData?.lookUpTime
            cell.delegate = self
            return cell
            
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RealTimeTVC") as? RealTimeTableViewCell else { return UITableViewCell() }
            if let value = realTimeData {
                cell.setCell(value.realTimeProducts)
                cell.setHeight(height: height)
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
            return 76
        case 1:
            return 1500
        default:
            return 100
        }
    }
    
    //tableview cell에 들어갈 cell들의 Nib을 등록
    private func setupTableView() {
        // Register the xib for tableview cell
        tableView.delegate = self
        tableView.dataSource = self
        
        let tableHeaderCellNib = UINib(nibName: "RealTimeHeaderTableViewCell", bundle: nil)
        self.tableView.register(tableHeaderCellNib, forCellReuseIdentifier: "RealTimeHeaderTVC")
        
        let tableCellNib = UINib(nibName: "RealTimeTableViewCell", bundle: nil)
        self.tableView.register(tableCellNib, forCellReuseIdentifier: "RealTimeTVC")
    }
}
