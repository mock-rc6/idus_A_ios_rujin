//
//  OnlineDetailDataManager.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/13.
//

import Foundation
import Alamofire

struct OnlineDetailDataManager {
    
    func getOnlineDetailData(classId : Int, viewController : OnlineDetailViewController) {
        AF.request(Constant.BASE_URL + "/online-classes/\(Constant.USER_ID)/\(classId)", method: .get, parameters: nil, headers: Constant.header).validate().responseDecodable(of: OnlineDetailEntity.self) {
            response in
            
            switch response.result {
            case .success(let result) :
                print("OnlineDetail-요청성공!!!!!!!")
                
                viewController.onlineDetailData = result.result
                viewController.tableView.reloadData()
            case .failure(let error) :
                print("OnlineDetail-요청실패!!!!!!!")
                print(error.localizedDescription)
            }
        }
    }
}
