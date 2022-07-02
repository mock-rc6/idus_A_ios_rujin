//
//  ProductEntity.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/02.
//

import Foundation

// MARK: - Welcome
struct TodayEntity: Codable {
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: ProductResult?
}

// MARK: - Result
struct ProductResult: Codable {
    var categoryProductList: [CategoryProductList]?
    var productReviewList: [ProductReviewList]?
}

// MARK: - CategoryProductList
struct CategoryProductList: Codable {
    var categoryID: Int?
    var categoryName: String?
    var productsList: [ProductsList]?

    enum CodingKeys: String, CodingKey {
        case categoryID = "categoryId"
        case categoryName, productsList
    }
}

// MARK: - ProductsList
struct ProductsList: Codable {
    var productID: Int?
    var productImg: String?
    var productTitle: String?

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case productImg, productTitle
    }
}

// MARK: - ProductReviewList
struct ProductReviewList: Codable {
    var reviewID: Int?
    var reviewImg: String?
    var rating: Int?
    var nickName, contents: String?
    var productID: Int?
    var productImg: String?
    var productTitle: String?

    enum CodingKeys: String, CodingKey {
        case reviewID = "reviewId"
        case reviewImg, rating, nickName, contents
        case productID = "productId"
        case productImg, productTitle
    }
}

