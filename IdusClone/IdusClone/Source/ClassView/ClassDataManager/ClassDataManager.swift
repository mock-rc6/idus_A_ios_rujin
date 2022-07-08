//
//  ClassDataManager.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/08.
//

import Foundation
import Alamofire

struct ClassDataManager {
    
    func getOnlineClassData(viewController : OnlineViewController) {
        AF.request(Constant.BASE_URL + "/online-classes/\(Constant.USER_ID)", method: .get, parameters: nil, headers: Constant.header).validate().responseDecodable(of: OnlineClassEntity.self) {
            response in
            
            switch response.result {
            case .success(let result) :
                print("Online-요청성공!!!!!!!")
                
                viewController.onlineData = result.result
                viewController.tableView.reloadData()
            case .failure(let error) :
                print("Online-요청실패!!!!!!!")
                print(error.localizedDescription)
            }
        }
    }
}
