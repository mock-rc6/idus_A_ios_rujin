//
//  DetailDataManager.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/05.
//

import Alamofire

struct DetailDataManager {
    
    func getDetailViewInfo(viewController : DetailViewController, productId : Int) {
        
        AF.request(Constant.BASE_URL+"/products/\(Constant.USER_ID)/\(productId)", method: .get, parameters: nil, headers: Constant.header).validate().responseDecodable(of: DetailEntity.self) { response in
            switch response.result {
            case .success(let result) :
                print("Detail-요청성공!!!!!!!")
                print(result)
                if result.message == "요청에 성공하였습니다." {
                    viewController.detailData = result.result
                    viewController.tableView.reloadData()
                }
                
            case .failure(let error):
                print("Detail-요청실패!!!!!!!")
                print(error.localizedDescription)
            }
        }
    }
}
