//
//  PurchaseSecondViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/07.
//

import UIKit
import Alamofire

class PurchaseSecondViewController: UIViewController {
    
    //가격, 배송비 정보 받기
    var totalPrice : Int?
    var shipping : Int?
    var finalProduct : String?
    var productId : Int?
    
    var productOptionIdList : [Int] = []
    var optionDetailId : [Int] = []
    var selectedOptionList : [OptionList] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var shippingPriceLbl: UILabel!
    @IBOutlet weak var totalPriceLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.shippingPriceLbl.text = decimalWon(value: shipping!)
        self.totalPriceLbl.text = decimalWon(value: totalPrice!)
        setTableView()
    }
    
    @IBAction func pressDismissBtn(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    @IBAction func moveToCart(_ sender: UIButton) {
        
        for i in 0 ..< productOptionIdList.count {
            selectedOptionList.append(OptionList(productOptionId: productOptionIdList[i], optionDetailId: optionDetailId[i]))
        }
        
        let optionInput = OptionInput(orderOptionList: selectedOptionList, amount: 1)
        PurchaseDataManager().moveToBasket(optionInput, productId: productId!, viewController: self)

    }
    
    
    
}

extension PurchaseSecondViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SelectedOptionTVC") as? SelectedOptionTableViewCell else { return UITableViewCell() }
        cell.selectedProductLbl.text = self.finalProduct!
        cell.productPriceLbl.text = decimalWon(value: totalPrice!)
        
        return cell
    }
    
    func setTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        //모두 선택 완료
        let allSelectedCellNib = UINib(nibName: "SelectedOptionTableViewCell", bundle: nil)
        self.tableView.register(allSelectedCellNib, forCellReuseIdentifier: "SelectedOptionTVC")
    }
}

    

