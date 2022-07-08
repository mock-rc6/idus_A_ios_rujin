//
//  CartDataManager.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/08.
//

import Foundation
import Alamofire

struct CartDataManager {
    
    func getCartData(viewController : CartViewController) {
        
        AF.request(Constant.BASE_URL+"/users/\(Constant.USER_ID)/baskets", method: .get, parameters: nil, headers: Constant.header).validate().responseDecodable(of: CartEntity.self) { response in
            switch response.result {
            case .success(let result) :
                print("Cart-요청성공!!!!!!!")
                print(result)
                if result.message == "요청에 성공하였습니다." {
                    viewController.cartData = result.result
                    var finalPrice : Int = 0
                    viewController.shippingPriceLbl.text = viewController.decimalWon(value: result.result.basketProductDetailList[0].deliveryFee)
                    
                    for i in 0 ..< result.result.countProduct {
                        finalPrice += (result.result.basketProductDetailList[i].finalPrice)
                    }
                    viewController.productPriceLbl.text = viewController.decimalWon(value: finalPrice)
                    viewController.tableView.reloadData()
                }
                
            case .failure(let error):
                print("Cart-요청실패!!!!!!!")
                print(error.localizedDescription)
            }
        }
    }
}
