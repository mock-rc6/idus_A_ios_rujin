//
//  PurchaseEntity.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/07.
//

import Foundation

// MARK: - Welcome
struct OptionEntity: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: OptionResult
}

// MARK: - Result
struct OptionResult: Codable {
    var productOptionList: [ProductOptionList]
}

// MARK: - ProductOptionList
struct ProductOptionList: Codable {
    var optionID: Int
    var optionName: String
    var optionDetailList: [OptionDetailList]

    enum CodingKeys: String, CodingKey {
        case optionID = "optionId"
        case optionName, optionDetailList
    }
}

// MARK: - OptionDetailList
struct OptionDetailList: Codable {
    var optionDetailID: Int
    var optionDetailName: String
    var price: Int

    enum CodingKeys: String, CodingKey {
        case optionDetailID = "optionDetailId"
        case optionDetailName, price
    }
}
