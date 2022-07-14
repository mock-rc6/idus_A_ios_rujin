//
//  CartViewController.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/08.
//

import UIKit

class CartViewController: UIViewController {

    var cartData : CartResult?
    var price = 0
    var shipping : Int?
    var finalPrice : Int?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var productPriceLbl: UILabel!
    @IBOutlet weak var shippingPriceLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        CartDataManager().getCartData(viewController: self)
        
        setNavigationBar()
        setTableView()
        //setPrice()
    }

    func setNavigationBar() {
        
        let btnBack = makeSFSymbolButton(self, action: #selector(moveBack), symbolName: "arrow.backward")
        let cartTitle = UIBarButtonItem(title: "장바구니", style: .plain, target: self, action: #selector(moveBack))
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.tintColor = UIColor.black
        
        navigationItem.leftBarButtonItems = [btnBack, cartTitle]
        self.tabBarController?.tabBar.isHidden = true
    }

    @objc func moveBack(){
        dismiss(animated: true, completion: nil)
    }

    @IBAction func moveToPayView(_ sender: UIButton) {
        let vc = UIStoryboard(name: "BuyView", bundle: Bundle.main).instantiateViewController(withIdentifier: "BuyVC") as! BuyViewController
        vc.payPrice = cartData?.basketProductDetailList[0].finalPrice
        vc.shipping = shipping
        vc.productPrice = (cartData?.basketProductDetailList[0].finalPrice)! - shipping!
        
        vc.productName = cartData?.basketProductDetailList[0].title
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setPrice() {
        var finalPrice : Int = 0
        self.shippingPriceLbl.text = decimalWon(value: shipping!)
        
        for i in 0 ..< cartData!.countProduct {
            finalPrice += (cartData?.basketProductDetailList[i].finalPrice)!
        }
        self.productPriceLbl.text = decimalWon(value: finalPrice)
    }
}

extension CartViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cartData?.countProduct ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var str : String = ""
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CartTVC") as? CartTableViewCell else { return UITableViewCell() }
        
        cell.writerLbl.text = cartData?.basketProductDetailList[indexPath.row].writerName
        if let value = cartData?.basketProductDetailList[indexPath.row].productImg {
            cell.productImg.load(url: URL(string: "https://\(value)")!)
        }

        cell.productNameLbl.text = cartData?.basketProductDetailList[indexPath.row].title
        cell.priceLbl.text = decimalWon(value: (cartData?.basketProductDetailList[indexPath.row].finalPrice)!)
        cell.totalPriceLbl.text = decimalWon(value: (cartData?.basketProductDetailList[indexPath.row].finalPrice)!)
        cell.shippingPriceLbl.text = decimalWon(value: (cartData?.basketProductDetailList[indexPath.row].deliveryFee)!)
        
        for i in 0 ..< (cartData?.basketProductDetailList[indexPath.row].basketProductOptionList.count)! {
            str += "\(cartData!.basketProductDetailList[indexPath.row].basketProductOptionList[i].option) : \(cartData!.basketProductDetailList[indexPath.row].basketProductOptionList[i].optionDetail) /"
        }
        
        cell.optionLbl.text = str
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 572
    }
    
    
    func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        let cellNib = UINib(nibName: "CartTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "CartTVC")
    }
}
