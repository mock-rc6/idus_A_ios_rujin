//
//  OptionInput.swift
//  IdusClone
//
//  Created by RooZin on 2022/07/08.
//

import Foundation

struct OptionInput : Encodable {
    var orderOptionList : [OptionList]
    var amount : Int
}

struct OptionList : Encodable {
    var productOptionId : Int
    var optionDetailId : Int
}
