//
//  Model.swift
//  GabAnythingLab
//
//  Created by Gab on 10/30/24.
//

import SwiftUI

//struct ReducerType: OptionSet {
//    let rawValue: Int
//    
//    init(rawValue: Int) {
//        self.rawValue = rawValue
//    }
//    
//    static let `a` = ReducerType(rawValue: 1 << 0)
//    static let `b` = ReducerType(rawValue: 1 << 1)
//    static let `c` = ReducerType(rawValue: 1 << 2)
//}

enum ReducerType: Equatable {
    case `a`
    case `b`
    case `c`
}
