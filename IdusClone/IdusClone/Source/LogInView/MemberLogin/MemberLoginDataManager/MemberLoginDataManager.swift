//
//  MemberLoginDataManager.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/01.
//

import Foundation
import Alamofire

struct MemberLoginDataManager {
    func loginWithEmail(_ param : MemberLoginInput, viewController : MemberLoginViewController) {

        let par : Parameters = [
            "email" : param.email!,
            "password" : param.password!,
        ]

        
        AF.request(Constant.BASE_URL + "/users/login", method: .post, parameters: par, encoding: JSONEncoding.default, headers: Constant.header)
            .validate()
            .responseDecodable(of: MemberLoginEntity.self) { response in
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

