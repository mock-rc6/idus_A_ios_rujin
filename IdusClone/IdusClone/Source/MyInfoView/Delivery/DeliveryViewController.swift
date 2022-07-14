//
//  DeliveryViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/13.
//

import UIKit

class DeliveryViewController: UIViewController {
    
    var deliveryData : [DeliveryResult]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        setupTableView()
        DeliveryDataManager().getOnlineDetailData(viewController: self)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func configureUI() {
        
        let btnBack = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(moveBack))
        let buyTitle = UIBarButtonItem(title: "주문 배송", style: .plain, target: self, action: #selector(moveBack))
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1960550249, green: 0.1960947514, blue: 0.1960498393, alpha: 1)
        navigationItem.leftBarButtonItems = [btnBack, buyTitle]
    }
    @objc func moveBack(){
        self.navigationController?.popViewController(animated: true)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension DeliveryViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let value = deliveryData {
            return value.count
        } else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DeliveryTVC") as? DeliveryTableViewCell {
            if let value = deliveryData{
                cell.imageProd.load(url : URL(string: "https://\(value[indexPath.row].productImg)")!)
                cell.labelDate.text = value[indexPath.row].orderAt
                cell.labelPrice.text = decimalWon(value: value[indexPath.row].finalPrice)
                cell.btnState.setTitle(value[indexPath.row].sendStatus, for: .normal)
                cell.labelTitle.text = value[indexPath.row].title
                cell.labelInfo.text = value[indexPath.row].writerName
            }
            return cell
        }
        
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 161
    }
    
    
    private func setupTableView(){
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let deliveryCellNib = UINib(nibName: "DeliveryTableViewCell", bundle: nil)
        self.tableView.register(deliveryCellNib, forCellReuseIdentifier: "DeliveryTVC")
        
    }
}
