//
//  ReviewDataManager.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/07.
//

import Alamofire

struct ReviewDataManager {
    
    func getReviews(viewController : DetailViewController, productId : Int) {
        
        AF.request(Constant.BASE_URL+"/products/\(Constant.USER_ID)/\(productId)/reviews", method: .get, parameters: nil, headers: Constant.header).validate().responseDecodable(of: ReviewEntity.self) { response in
            switch response.result {
            case .success(let result) :
                print("review-요청성공!!!!!!!")
                print(result)
                if result.message == "요청에 성공하였습니다." {
                    viewController.reviewData = result.result
                    viewController.tableView.reloadData()
                }
                
            case .failure(let error):
                print("review-요청실패!!!!!!!")
                print(error.localizedDescription)
            }
        }
    }
}
