//
//  RealTimeEntity.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/05.
//

import Foundation

struct RealTimeEntity: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: RealTimeResult
}

// MARK: - Result
struct RealTimeResult: Codable {
    var lookUpTime: String
    var realTimeProducts: [RealTimeProduct]
}

// MARK: - RealTimeProduct
struct RealTimeProduct: Codable {
    var productID: Int
    var imgURL: String
    var writerName, title: String?
    var rating: Double?
    var countReview: Int?
    var reviewContents: String?
    var like: Bool

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case imgURL = "imgUrl"
        case writerName, title, rating, countReview, reviewContents, like
    }
}

