//
//  EmailRegisterDataManaer.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/29.
//

import Foundation
import Alamofire

struct EmailRegisterDataManager {
    
    func registerNewUser(_ param : EmailRegisterInput, viewController : EmailRegisterViewController) {
        print(param)
        AF.request(Constant.BASE_URL + "/users", method: .post, parameters: param, headers: Constant.header)
            .validate()
            .responseDecodable(of: EmailRegisterEntity.self) { response in
                print(response)
                switch response.result {
                case .success(let result):
                    print("요청성공")
                    if result.isSuccess {
                        viewController.presentAlert(title: result.message)
                    } else {
                        viewController.presentAlert(title: result.message)
                    }
                case .failure(let error):
                    print("요청실패!!!!!!!")
                    viewController.presentAlert(title: error.localizedDescription)
                }
            }
    }
    
    func test() {
        AF.request(Constant.BASE_URL + "/test/log", method: .get, parameters: nil, headers: Constant.header)
            .validate()
            .responseDecodable(of: EmailTest.self) { response in
                switch response.result {
                case .success(let result):
                    print("요청성공")
                    
                case .failure(let error):
                    print(response)
                    print(error)
                    print("요청실패!!!!!!!")
                    
                }
            }
    }
}
