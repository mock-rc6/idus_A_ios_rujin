//
//  RealTimeDataManager.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/05.
//

import Foundation
import Alamofire

struct RealTimeDataManager {
    
    func getRealTimeProduct(br : Int, img : Int, viewController : RealTimeViewController) {
        
        AF.request(Constant.BASE_URL + "/products/\(Constant.USER_ID)/real-time?br=\(br)&img=\(img)", method: .get, parameters: nil, headers: Constant.header).validate().responseDecodable(of: RealTimeEntity.self ) {
            response in
            
            switch response.result {
            case .success(let result) :
                print("Today-요청성공!!!!!!!")
                
                viewController.realTimeData = result.result
                
                viewController.tableView.reloadData()
                
            case .failure(let error):
                print("Today-요청실패!!!!!!!")
                print(error.localizedDescription)
                
            }
        }
    }
}
