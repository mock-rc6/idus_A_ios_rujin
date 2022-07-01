//
//  EmailRegisterInput.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/29.
//

import Foundation

struct EmailRegisterEntity: Codable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: Info?
    
    enum CodingKeys: String, CodingKey {
        case isSuccess, code, message
        case result = "result"
    }
}

// MARK: - Result
struct Info: Codable {
    var jwt: String?
    var userID: Int?

    enum CodingKeys: String, CodingKey {
        case jwt
        case userID = "userId"
    }
}
