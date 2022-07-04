//
//  NewDataManager.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/05.
//

import Foundation
import Alamofire

struct NewDataManager {
    
    func getNewData(viewController : NewViewController) {
        AF.request(Constant.BASE_URL + "/products/\(Constant.USER_ID)/new?img=0", method: .get, parameters: nil, headers: Constant.header).validate().responseDecodable(of: NewEntity.self) {
            response in
            
            switch response.result {
            case .success(let result) :
                print("New-요청성공!!!!!!!")
                
                viewController.newData = result.result
                viewController.tableView.reloadData()
            case .failure(let error) :
                print("New-요청실패!!!!!!!")
                print(error.localizedDescription)
            }
        }
    }
}
