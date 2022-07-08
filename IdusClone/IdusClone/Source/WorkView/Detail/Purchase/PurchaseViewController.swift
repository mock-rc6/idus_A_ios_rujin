//
//  PurchaseViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/07.
//

import UIKit
import ExpyTableView
import Alamofire

class PurchaseViewController: UIViewController {
    
    @IBOutlet weak var tableView: ExpyTableView!
    @IBOutlet weak var labelShipping: UILabel!
    @IBOutlet weak var labelTotalMoney: UILabel!
    
    var optionData: [ProductOptionList] = []
    
    var price: Int?
    var shipping: Int?
    var detailData: DetailResult?
    var productId: Int?
    
    var optionCnt : Int = 0
    var finalProduct : String = ""
    
    var totalPrice : Int = 0
    
    var productOptionIdList : [Int] = []
    var optionDetailId : [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        // Do any additional setup after loading the view.
        labelShipping.text = decimalWon(value: shipping!)
        labelTotalMoney.text = decimalWon(value: price!)
        
        PurchaseDataManager().getPurchaseOptions(viewController: self, productId: productId!)
    }
    
    
    @IBAction func moveToPurchase(_ sender: UIButton) {
        print(optionData.count)
        tableView.reloadData()
    }
    
    @IBAction func dimissOptionView(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    
    
    
}

// 테이블뷰 extension
extension PurchaseViewController: ExpyTableViewDelegate, ExpyTableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return optionData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OptionTVC") as? OptionTableViewCell else { return UITableViewCell() }
        
        switch indexPath.section {
        case 0 :
            cell.optionLbl.text = optionData[0].optionDetailList[indexPath.row - 1].optionDetailName
            return cell
        case 1 :
            cell.optionLbl.text = optionData[1].optionDetailList[indexPath.row - 1].optionDetailName
            return cell
        case 2 :
            cell.optionLbl.text = optionData[2].optionDetailList[indexPath.row - 1].optionDetailName
            return cell
        default :
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 40
        }else {
            return 60
        }
    }
    
    func tableView(_ tableView: ExpyTableView, expyState state: ExpyState, changeForSection section: Int) {
        print("\(section)섹션")
                
                switch state {
                case .willExpand:
                 print("WILL EXPAND")

                case .willCollapse:
                 print("WILL COLLAPSE")

                case .didExpand:
                 print("DID EXPAND")

                case .didCollapse:
                 print("DID COLLAPSE")
                }
    }
    
    func tableView(_ tableView: ExpyTableView, canExpandSection section: Int) -> Bool {
        return true
    }
    
    func tableView(_ tableView: ExpyTableView, expandableCellForSection section: Int) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "OptionTVC") as? OptionTableViewCell else { return UITableViewCell() }

        cell.backgroundColor = .systemGray6 //백그라운드 컬러
        cell.selectionStyle = .none //선택했을 때 회색되는거 없애기
        
        switch section {
        case 0 :
            cell.optionLbl.text = optionData[0].optionName
            return cell
        case 1 :
            cell.optionLbl.text = optionData[1].optionName
            return cell
        case 2 :
            cell.optionLbl.text = optionData[2].optionName
            return cell
        default :
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0 :
            return optionData[0].optionDetailList.count
        case 1 :
            return optionData[1].optionDetailList.count
        case 2 :
            return optionData[2].optionDetailList.count
        default :
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if (indexPath.section >= 0 && indexPath.row >= 1)  {
            optionCnt += 1
            let sectionStr = optionData[indexPath.section].optionName
            let rowStr = optionData[indexPath.section].optionDetailList[indexPath.row - 1].optionDetailName
            totalPrice += optionData[indexPath.section].optionDetailList[indexPath.row - 1].price
            finalProduct += "\(sectionStr) : \(rowStr) /"
            
            productOptionIdList.append(optionData[indexPath.section].optionID)
            optionDetailId.append(optionData[indexPath.section].optionDetailList[indexPath.row - 1].optionDetailID)
            
            print("cnt : \(optionCnt)")
        }
        
        if optionCnt == optionData.count {
            let vc = PurchaseSecondViewController()
            vc.totalPrice = totalPrice + shipping! + price!
            vc.finalProduct = finalProduct
            vc.shipping = shipping!
            vc.productOptionIdList = productOptionIdList
            vc.optionDetailId = optionDetailId
            vc.productId = productId
            vc.modalPresentationStyle = .custom
          
            self.present(vc, animated: true)
        }
    }
    
    
    //tableview cell에 들어갈 cell들의 Nib을 등록
    private func setupTableView(){
        // Register the xib for tableview cell
        tableView.delegate = self
        tableView.dataSource = self
        
        //옵션 section
        let optionCellNib = UINib(nibName: "OptionTableViewCell", bundle: nil)
        self.tableView.register(optionCellNib, forCellReuseIdentifier: "OptionTVC")
    }
    
    
}

