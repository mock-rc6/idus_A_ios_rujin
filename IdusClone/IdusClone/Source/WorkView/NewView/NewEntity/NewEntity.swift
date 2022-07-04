//
//  NewEntity.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/05.
//

import Foundation

struct NewEntity: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: NewResult
}

// MARK: - Result
struct NewResult: Codable {
    var lookUpTime: String
    var newProductsList: [NewProductsList]
}

// MARK: - NewProductsList
struct NewProductsList: Codable {
    var productID: Int
    var imgURL: String
    var writerName, title: String?
    var price, discountRate, finalPrice: Int?
    var like, freeDelivery: Bool?

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case imgURL = "imgUrl"
        case writerName, title, price, discountRate, finalPrice, like, freeDelivery
    }
}

