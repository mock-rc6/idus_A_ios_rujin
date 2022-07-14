//
//  NewViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/28.
//

import UIKit

class NewViewController: UIViewController, ImgCheckDelegate, TransferDelegate {
    func didSelectProduct(productId: Int) {
        let vc = UIStoryboard(name: "DetailView", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailVC") as! DetailViewController
        vc.productId = productId
        
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func didSelectCheckBtn(isChecked : Bool) {
        if isChecked {
            height = 1.0
        }
        else {
            height = 1.7
        }
        NewDataManager().getNewData(viewController: self)
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var newData : NewResult?
    
    var height = 1.7
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.tabBar.isHidden = false
        setNib()
        NewDataManager().getNewData(viewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
    

}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension NewViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewHeaderTVC") as? NewHeaderTableViewCell else { return UITableViewCell() }
            
            cell.baseTimeLbl.text = newData?.lookUpTime
            cell.delegate = self
            
            return cell
        case 1 :
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewTVC") as? NewTableViewCell else { return UITableViewCell() }
            
            cell.delegate = self
            
            if let value = newData {
                cell.setCell(value.newProductsList)
                cell.setHeight(height: height)
            }
            
            return cell
        default :
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 76
        case 1:
            return 3000
        default:
            return 100
        }
    }
    
    //MARK: - nib 추가 및 TableView 세팅
    func setNib() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let headerCellNib = UINib(nibName: "NewHeaderTableViewCell", bundle: nil)
        tableView.register(headerCellNib, forCellReuseIdentifier: "NewHeaderTVC")
        let newCellNib = UINib(nibName: "NewTableViewCell", bundle: nil)
        tableView.register(newCellNib, forCellReuseIdentifier: "NewTVC")
    }
}
