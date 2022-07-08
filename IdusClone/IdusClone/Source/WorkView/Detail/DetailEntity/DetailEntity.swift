//
//  DetailEntity.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/05.
//



import Foundation

// MARK: - Welcome
struct DetailEntity: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: DetailResult
}

// MARK: - Result
struct DetailResult: Codable {
    var imgURLList: [String]
    var writerID: Int
    var writerName, profileImg: String
    var rating: Double
    var countReview: Int
    var title: String
    var price, discountRate, finalPrice: Int
    var shortReviewList: [ShortReviewList]
    var countBuyer, deliveryFee, freeAmount, leftAmount: Int
    var contents: String
    var reviewList: [ReviewList]
    var commentList: [CommentList]
    var ratingAverage: Double
    var countAllReview, countAllLike, countFollow, countSupport: Int
    var countProductLike: Int
    var like: Bool

    enum CodingKeys: String, CodingKey {
        case imgURLList = "imgUrlList"
        case writerID = "writerId"
        case writerName, profileImg, rating, countReview, title, price, discountRate, finalPrice, shortReviewList, countBuyer, deliveryFee, freeAmount, leftAmount, contents, reviewList, commentList, ratingAverage, countAllReview, countAllLike, countFollow, countSupport, countProductLike, like
    }
}

// MARK: - CommentList
struct CommentList: Codable {
    var userName: String
    var userProfileImg: String?
    var userComment: String
    var writerName, writerProfileImg, writerComment: String?
}

// MARK: - ReviewList
struct ReviewList: Codable {
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

// MARK: - ShortReviewList
struct ShortReviewList: Codable {
    var repurchase: Bool
    var imgURL: String?
    var contents: String

    enum CodingKeys: String, CodingKey {
        case repurchase
        case imgURL = "imgUrl"
        case contents
    }
}
