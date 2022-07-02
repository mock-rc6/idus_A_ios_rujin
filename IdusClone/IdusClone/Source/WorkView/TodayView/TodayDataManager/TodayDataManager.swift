//
//  ProductDataManager.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/02.
//

import Foundation
import Alamofire

struct TodayDataManager {
    
    func getTodayViewInfo(viewController : TodayViewController) {
        Constant.header.add(name: "X-ACCESS-TOKEN", value: Constant.JWT)
        
        AF.request(Constant.BASE_URL+"/products/\(Constant.USER_ID)", method: .get, parameters: nil, headers: Constant.header).validate().responseDecodable(of: TodayEntity.self) { response in
            switch response.result {
            case .success(let result) :
                print("Today-요청성공!!!!!!!")
                if result.result != nil {
                    viewController.todayData = result.result
                    viewController.tableView.reloadData()
                }
            case .failure(let error):
                print("Today-요청실패!!!!!!!")
                print(error.localizedDescription)
            }
        }
    }
}
