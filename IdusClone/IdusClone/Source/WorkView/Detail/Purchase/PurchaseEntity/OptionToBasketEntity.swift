//
//  OptionToBasketEntity.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/08.
//

import Foundation

// MARK: - Welcome
struct OptionToBasketEntity: Codable {
    var isSuccess: Bool
    var code: Int
    var message, result: String
}
