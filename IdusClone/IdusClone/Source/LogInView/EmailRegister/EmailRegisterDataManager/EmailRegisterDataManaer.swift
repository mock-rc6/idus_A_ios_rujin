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
    
        let par : Parameters = [
            "email" : param.email!,
            "name" : param.name!,
            "password" : param.password!,
            "phoneNumber" : param.phoneNumber!
        ]

        AF.request(Constant.BASE_URL + "/users", method: .post, parameters: par, encoding: JSONEncoding.default, headers: Constant.header)
            .validate()
            .responseDecodable(of: EmailRegisterEntity.self) { response in
                print(response)
                switch response.result {
                case .success(let result):
                    print("요청성공")
                    if result.isSuccess != nil {
                        viewController.presentAlert(title: result.message!)
                        if result.message == "요청에 성공하였습니다." {
                            Constant.JWT = (result.result?.jwt)!
                            Constant.USER_ID = (result.result?.userID)!
                            viewController.moveToMain()
                        }
                    } else {
                        viewController.presentAlert(title: result.message!)
                    }
                case .failure(let error):
                    print("요청실패!!!!!!!")
                    viewController.presentAlert(title: error.localizedDescription)
                }
            }
    }
}
