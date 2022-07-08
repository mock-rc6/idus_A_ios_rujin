//
//  ClassEntity.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/08.
//

import Foundation

// MARK: - Welcome
struct OnlineClassEntity: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: OnlineResult
}

// MARK: - Result
struct OnlineResult: Codable {
    var bestReviewList: [BestReviewList]
    var newOpenClassesList: [NewOpenClassesList]
    var userLikeClassesList: [UserLikeClassesList]
    var allOnlineClassesList: [AllOnlineClassesList]
}

// MARK: - AllOnlineClassesList
struct AllOnlineClassesList: Codable {
    var classID: Int
    var profileImg, categoryName, writerName, classTitle: String
    var reviewRating: Int
    var userName, contents: String?
    var like, streaming: Bool

    enum CodingKeys: String, CodingKey {
        case classID = "classId"
        case profileImg, categoryName, writerName, classTitle, reviewRating, userName, contents, like, streaming
    }
}

// MARK: - BestReviewList
struct BestReviewList: Codable {
    var onlineClassReviewID: Int
    var reviewImg: String
    var rating: Int
    var nickName, contents: String
    var classID: Int
    var classImg, classTitle: String

    enum CodingKeys: String, CodingKey {
        case onlineClassReviewID = "onlineClassReviewId"
        case reviewImg, rating, nickName, contents
        case classID = "classId"
        case classImg, classTitle
    }
}

// MARK: - NewOpenClassesList
struct NewOpenClassesList: Codable {
    var classID: Int
    var profileImg, categoryName, writerName, title: String
    var like, streaming: Bool

    enum CodingKeys: String, CodingKey {
        case classID = "classId"
        case profileImg, categoryName, writerName, title, like, streaming
    }
}

// MARK: - UserLikeClassesList
struct UserLikeClassesList: Codable {
    var classID: Int
    var profileImg, categoryName, writerName, classTitle: String

    enum CodingKeys: String, CodingKey {
        case classID = "classId"
        case profileImg, categoryName, writerName, classTitle
    }
}
