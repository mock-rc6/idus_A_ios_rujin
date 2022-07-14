//
//  DeliveryDataManager.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/13.
//

import Foundation
import Alamofire

struct DeliveryDataManager {
    
    func getOnlineDetailData(viewController : DeliveryViewController) {
        
        var headerForDelivery: HTTPHeaders = [
                    "Content-Type": "application/json"
                ]
        headerForDelivery.add(name: "X-ACCESS-TOKEN", value: "eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4IjoxLCJpYXQiOjE2NTY1MTY1OTUsImV4cCI6MTY1Nzk4NzgyNH0.Uq5JCHOlyw7MxFq31WAqMeMJqw7lXyHmJoXNLj9DfWQ")
        
        AF.request(Constant.BASE_URL + "/users/1/order-lists", method: .get, parameters: nil, headers: headerForDelivery).validate().responseDecodable(of: DeliveryEntity.self) {
            response in
            
            switch response.result {
            case .success(let result) :
                print("Delivery-요청성공!!!!!!!")
                
                viewController.deliveryData = result.result
                viewController.tableView.reloadData()
            case .failure(let error) :
                print("Delivery-요청실패!!!!!!!")
                print(error.localizedDescription)
            }
        }
    }
}
