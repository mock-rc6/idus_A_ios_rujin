//
//  EmailRegisterInput.swift
//  IdusClone
//
//  Created by RooZin on 2022/06/29.
//

import Foundation

struct EmailRegisterEntity: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: Result
}

// MARK: - Result
struct Result: Codable {
    var jwt: String
    var userId: Int

}
