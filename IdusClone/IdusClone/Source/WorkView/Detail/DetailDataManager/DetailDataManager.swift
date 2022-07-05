//
//  DetailDataManager.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/05.
//

import Alamofire

struct DetailDataManager {
    
    func getDetailViewInfo(viewController : DetailViewController) {
        
        AF.request(Constant.BASE_URL+"/products/\(Constant.USER_ID)/", method: .get, parameters: nil, headers: Constant.header).validate().responseDecodable(of: DetailEntity.self) { response in
            switch response.result {
            case .success(let result) :
                print("Today-요청성공!!!!!!!")
                
                    viewController.detailData! = result.result
                    viewController.tableView.reloadData()
                
            case .failure(let error):
                print("Today-요청실패!!!!!!!")
                print(error.localizedDescription)
            }
        }
    }
}
