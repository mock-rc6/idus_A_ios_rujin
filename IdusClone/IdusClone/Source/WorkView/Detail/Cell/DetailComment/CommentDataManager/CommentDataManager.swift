//
//  CommentDataManager.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/07.
//

import Alamofire

struct CommentDataManager {
    
    func getComments(viewController : DetailViewController, productId : Int) {
        
        AF.request(Constant.BASE_URL+"/products/\(Constant.USER_ID)/\(productId)/comments", method: .get, parameters: nil, headers: Constant.header).validate().responseDecodable(of: CommentEntity.self) { response in
            switch response.result {
            case .success(let result) :
                print("comment-요청성공!!!!!!!")
                print(result)
                if result.message == "요청에 성공하였습니다." {
                    viewController.commentData = result.result
                    viewController.tableView.reloadData()
                }
                
            case .failure(let error):
                print("comment-요청실패!!!!!!!")
                print(error.localizedDescription)
            }
        }
    }
}
