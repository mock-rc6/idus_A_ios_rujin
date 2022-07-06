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
    var writerName: String?
    var writerProfileImg: CommentJSONNull?
    var writerComment: String?
}

// MARK: - Encode/decode helpers

class CommentJSONNull: Codable, Hashable {

    public static func == (lhs: CommentJSONNull, rhs: CommentJSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(CommentJSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
