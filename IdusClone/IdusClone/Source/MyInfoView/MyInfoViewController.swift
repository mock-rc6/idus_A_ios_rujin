//
//  MyInfoViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/27.
//

import UIKit

class MyInfoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        setTableView()
        self.tabBarController?.tabBar.isHidden = false
    }
    

    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    func setNavigationBar() {
        // #imageLiteral(resourceName: "상단_종")
        let chattingBtn = makeSFSymbolButton(self, action: #selector(moveToChat), symbolName: "ellipsis.bubble")
        let alarmBtn = makeSFSymbolButton(self, action: #selector(moveToAlarm), symbolName: "bell")
        let cartBtn = makeSFSymbolButton(self, action: #selector(moveToCart), symbolName: "cart")
        
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.rightBarButtonItems = [cartBtn, alarmBtn, chattingBtn]
        
        let info = UIBarButtonItem(title: "내 정보", style: .plain, target: self, action: #selector(moveToInfo))
        navigationItem.leftBarButtonItem = info
    }
    
    @objc func moveToChat() {
        
    }
    @objc func moveToAlarm() {
        
    }
    
    @objc func moveToCart() {
        print("CART")
        let vc = UIStoryboard(name: "CartView", bundle: Bundle.main).instantiateViewController(withIdentifier: "CartVC") as! CartViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func moveToInfo() {
    }
    
}

// 테이블뷰 extension
extension MyInfoViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoProfileTVC") as? MyInfoProfileTableViewCell {
                
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoMidTVC") as? MyInfoMidTableViewCell {
              
                return cell
            }
        case 1,3,5,7,9:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "LineTableViewCell") as? LineTableViewCell {
                
                return cell
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoBannerTVC") as? MyInfoBannerTableViewCell {
                
                return cell
            }
        case 6:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoRecentTVC") as? MyInfoRecentTableViewCell {
            
                return cell
            }
        case 8:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoFooterTVC") as? MyInfoFooterTableViewCell {
                
                return cell
            }
        case 10:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "MyInfoAboutIdusTVC") as? MyInfoAboutIdusTableViewCell {
               
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
            return 374
        case 1,3,5,7,9:
            return 15
        case 2:
            return 310
        case 4:
            return 92
        case 6:
            return 316
        case 8:
            return 235
        case 10:
            return 328
        default:
            return 0
        }
    }
    
    
    private func setTableView(){
            
        tableView.delegate = self
        tableView.dataSource = self
            
        
        let myInfoProfileCellNib = UINib(nibName: "MyInfoProfileTableViewCell", bundle: nil)
        self.tableView.register(myInfoProfileCellNib, forCellReuseIdentifier: "MyInfoProfileTVC")
        
        let myInfoExtraCellNib = UINib(nibName: "MyInfoMidTableViewCell", bundle: nil)
        self.tableView.register(myInfoExtraCellNib, forCellReuseIdentifier: "MyInfoMidTVC")
        let lineCellNib = UINib(nibName: "LineTableViewCell", bundle: nil)
        self.tableView.register(lineCellNib, forCellReuseIdentifier: "LineTableViewCell")
        
        let myInfoBannerCellNib = UINib(nibName: "MyInfoBannerTableViewCell", bundle: nil)
        self.tableView.register(myInfoBannerCellNib, forCellReuseIdentifier: "MyInfoBannerTVC")
        
        let myInfoRecentIdusCellNib = UINib(nibName: "MyInfoRecentTableViewCell", bundle: nil)
        self.tableView.register(myInfoRecentIdusCellNib, forCellReuseIdentifier: "MyInfoRecentTVC")
        
        let myInfoNoticeCellNib = UINib(nibName: "MyInfoFooterTableViewCell", bundle: nil)
        self.tableView.register(myInfoNoticeCellNib, forCellReuseIdentifier: "MyInfoFooterTVC")
        
        let myInfoAboutIdusCellNib = UINib(nibName: "MyInfoAboutIdusTableViewCell", bundle: nil)
        self.tableView.register(myInfoAboutIdusCellNib, forCellReuseIdentifier: "MyInfoAboutIdusTVC")
        
     
    }
}
