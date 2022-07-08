//
//  BuyViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/08.
//

import UIKit

class BuyViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buyInfoLabel: UILabel!
    
    var productPrice : Int?
    var shipping : Int?
    var payPrice : Int?
    var productName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buyInfoLabel.text = "\(decimalWon(value: payPrice!)) 간편하게 카트 결제"
        setupTableView()
    }


    
    @IBAction func pressBuyBtn(_ sender: UIButton) {
        moveToMain()
    }
    

}

extension BuyViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(String(lists.count) + " 줄")
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BuyUserTableViewCell") as? BuyUserTableViewCell {
                
                return cell
            }
        case 1,3,5,7,9,11:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "LineTableViewCell") as? LineTableViewCell {
                
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BuyAddressTableViewCell") as? BuyAddressTableViewCell {
               
                return cell
            }
        case 4:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BuyInfoTableViewCell") as? BuyInfoTableViewCell {
                
                cell.labelInfo.text = productName!
                return cell
            }
        case 6:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BuyPaymentTableViewCell") as? BuyPaymentTableViewCell {
               
                return cell
            }
        case 8:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BuyPaymentInfoTableViewCell") as? BuyPaymentInfoTableViewCell {
            
                cell.labelPrice.text = decimalWon(value: productPrice!)
                cell.labelShipping.text = decimalWon(value: shipping!)
                cell.labelTotalPrice.text = decimalWon(value: payPrice!)
                
                return cell
            }
        case 10:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "BuyAgreeTableViewCell") as? BuyAgreeTableViewCell {
               
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
            return 65
        case 1,3,5,7,9,11:
            return 15
        case 2:
            return 365
        case 4:
            return 74
        case 6:
            return 495
        case 8:
            return 275
        case 10:
            return 61
        default:
            return 0
        }
    }
    
   
    private func setupTableView(){
          
        tableView.delegate = self
        tableView.dataSource = self
            
       
        let curatingCellNib = UINib(nibName: "BuyUserTableViewCell", bundle: nil)
        self.tableView.register(curatingCellNib, forCellReuseIdentifier: "BuyUserTableViewCell")
        
        let lineCellNib = UINib(nibName: "LineTableViewCell", bundle: nil)
        self.tableView.register(lineCellNib, forCellReuseIdentifier: "LineTableViewCell")
        
        let addressCellNib = UINib(nibName: "BuyAddressTableViewCell", bundle: nil)
        self.tableView.register(addressCellNib, forCellReuseIdentifier: "BuyAddressTableViewCell")
        
        let infoCellNib = UINib(nibName: "BuyInfoTableViewCell", bundle: nil)
        self.tableView.register(infoCellNib, forCellReuseIdentifier: "BuyInfoTableViewCell")
        
        let paymentCellNib = UINib(nibName: "BuyPaymentTableViewCell", bundle: nil)
        self.tableView.register(paymentCellNib, forCellReuseIdentifier: "BuyPaymentTableViewCell")
        
        let paymentInfoCellNib = UINib(nibName: "BuyPaymentInfoTableViewCell", bundle: nil)
        self.tableView.register(paymentInfoCellNib, forCellReuseIdentifier: "BuyPaymentInfoTableViewCell")
        
        let agreeCellNib = UINib(nibName: "BuyAgreeTableViewCell", bundle: nil)
        self.tableView.register(agreeCellNib, forCellReuseIdentifier: "BuyAgreeTableViewCell")
        
    }
}
