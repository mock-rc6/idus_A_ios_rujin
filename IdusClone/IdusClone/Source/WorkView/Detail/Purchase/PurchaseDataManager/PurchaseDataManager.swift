//
//  PurchaseDataManager.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/07.
//

import Alamofire

struct PurchaseDataManager {
    
    func getPurchaseOptions(viewController : PurchaseViewController, productId : Int) {
        
        AF.request(Constant.BASE_URL+"/products/\(Constant.USER_ID)/\(productId)/options", method: .get, parameters: nil, headers: Constant.header).validate().responseDecodable(of: OptionEntity.self) { response in
            switch response.result {
            case .success(let result) :
                print("Option-요청성공!!!!!!!")
                print(result)
                if result.message == "요청에 성공하였습니다." {
                    viewController.optionData = result.result.productOptionList
                    viewController.tableView.reloadData()
                }
                
            case .failure(let error):
                print("Option-요청실패!!!!!!!")
                print(error.localizedDescription)
            }
        }
    }
    
    func moveToBasket(_ parameters : OptionInput, productId : Int, viewController : PurchaseSecondViewController) {
        
        AF.request(Constant.BASE_URL+"/products/\(Constant.USER_ID)/\(productId)/options", method: .post, parameters: parameters, encoder: JSONParameterEncoder(), headers: Constant.header).validate().responseDecodable(of: OptionToBasketEntity.self) { response in
            switch response.result {
            case .success(let result) :
                print("Option-요청성공!!!!!!!")
                print(result)
                if result.message == "요청에 성공하였습니다." {
                    viewController.presentAlert(title: result.message)
                    viewController.dismiss(animated: true)
                }

            case .failure(let error):
                print("Option-요청실패!!!!!!!")
                print(error.localizedDescription)
            }
        }
    }
}
