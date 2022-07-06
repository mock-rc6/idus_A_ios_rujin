//
//  ReviewEntity.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/07.
//

import Foundation

// MARK: - Welcome
struct ReviewEntity: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [ReviewResult]
}

// MARK: - Result
struct ReviewResult: Codable {
    var reviewID: Int
    var nickName: String
    var profileImg: String?
    var rating: Int
    var createAt: String
    var repurchase: Bool
    var reviewImg: String?
    var contents: String

    enum CodingKeys: String, CodingKey {
        case reviewID = "reviewId"
        case nickName, profileImg, rating, createAt, repurchase, reviewImg, contents
    }
}
