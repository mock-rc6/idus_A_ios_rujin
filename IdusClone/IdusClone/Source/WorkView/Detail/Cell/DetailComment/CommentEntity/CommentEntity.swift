//
//  CommentEntity.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/07.
//

import Foundation

// MARK: - Welcome
struct CommentEntity: Codable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: [CommentResult]
}

// MARK: - Result
struct CommentResult: Codable {
    var userName: String
    var userProfileImg: String?
    var userComment: String
    var writerName, writerProfileImg, writerComment: String?
}
