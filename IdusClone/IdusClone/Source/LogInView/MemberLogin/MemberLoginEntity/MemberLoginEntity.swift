//
//  MemberLoginEntity.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/01.
//

import Foundation

struct MemberLoginEntity: Codable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: MemberInfo?
    
    enum CodingKeys: String, CodingKey {
        case isSuccess, code, message
        case result = "result"
    }
}

// MARK: - Result
struct MemberInfo: Codable {
    var jwt: String?
    var userID: Int?

    enum CodingKeys: String, CodingKey {
        case jwt
        case userID = "userId"
    }
}
