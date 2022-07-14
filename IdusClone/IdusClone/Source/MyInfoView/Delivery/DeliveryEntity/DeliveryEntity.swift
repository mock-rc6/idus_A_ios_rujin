//
//  DeliveryEntity.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/13.
//

import Foundation

// MARK: - Welcome
struct DeliveryEntity: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [DeliveryResult]
}

// MARK: - Result
struct DeliveryResult: Codable {
    var productID: Int
    var orderAt: String
    var finalPrice: Int
    var productImg, title, writerName, sendStatus: String

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case orderAt, finalPrice, productImg, title, writerName, sendStatus
    }
}
