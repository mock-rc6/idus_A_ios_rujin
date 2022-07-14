//
//  OnlineDetailEntity.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/13.
//

import Foundation

// MARK: - Welcome
struct OnlineDetailEntity: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: OnlineDetailResult
}

// MARK: - Result
struct OnlineDetailResult: Codable {
    var videoURL: String
    var writerID: Int
    var writerImg, writerName, categoryName, title: String
    var streaming: Bool
    var startingDay, level: String
    var userLike: Bool
    var countLike: Int
    var rating: Double
    var countReview: Int
    var onlineClassReviewList: [OnlineClassReviewList]
    var contents: String
    var onlineClassCommentList: [OnlineClassCommentList]

    enum CodingKeys: String, CodingKey {
        case videoURL = "videoUrl"
        case writerID = "writerId"
        case writerImg, writerName, categoryName, title, streaming, startingDay, level, userLike, countLike, rating, countReview, onlineClassReviewList, contents, onlineClassCommentList
    }
}

// MARK: - OnlineClassCommentList
struct OnlineClassCommentList: Codable {
    var userName: String
    var userImg: String?
    var userComment, writerName, writerImg, writerComment: String
}

// MARK: - OnlineClassReviewList
struct OnlineClassReviewList: Codable {
    var reviewID: Int
    var reviewImg, userName: String
    var profileImg: String?
    var createAt, contents: String

    enum CodingKeys: String, CodingKey {
        case reviewID = "reviewId"
        case reviewImg, userName, profileImg, createAt, contents
    }
}
