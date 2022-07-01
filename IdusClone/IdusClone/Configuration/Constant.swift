//
//  Constant.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/26.
//

import Foundation
import Alamofire

struct Constant {
    static var MY_TOKEN : String = ""
    static var JWT : String = ""
    static var USER_ID : Int = 0
    
    static let BASE_URL = "http://prod.sogogi.shop:9000"
    
    static var header: HTTPHeaders = [
                "Content-Type": "application/json",
            ]
    
    
}
