//
//  CartEntity.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/08.
//

import Foundation

// MARK: - Welcome
struct CartEntity: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: CartResult
}

// MARK: - Result
struct CartResult: Codable {
    var countProduct: Int
    var basketProductDetailList: [BasketProductDetailList]
}

// MARK: - BasketProductDetailList
struct BasketProductDetailList: Codable {
    var basketDetailID, writerID: Int
    var writerName, productImg, title, leftAmount: String
    var basketProductOptionList: [BasketProductOptionList]
    var finalPrice, countOrder, deliveryFee, freeAmount: Int

    enum CodingKeys: String, CodingKey {
        case basketDetailID = "basketDetailId"
        case writerID = "writerId"
        case writerName, productImg, title, leftAmount, basketProductOptionList, finalPrice, countOrder, deliveryFee, freeAmount
    }
}

// MARK: - BasketProductOptionList
struct BasketProductOptionList: Codable {
    var option: Option
    var optionDetail: String
}

enum Option: String, Codable {
    case 선물포장 = "선물포장"
    case 수량 = "수량"
    case 희망배송순차배송 = "희망배송(순차배송)"
}
