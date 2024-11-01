//
//  LAModel.swift
//  GabAnythingLab
//
//  Created by Gab on 11/1/24.
//

import SwiftUI

enum LoadingAnimationOrder: Equatable {
    typealias Test = (from: CGFloat, to: CGFloat)
    case none
    case one
    case two
//    case three
}

extension LoadingAnimationOrder {
    var trim: Test {
        switch self {
        case .none:
            return (0, 0)
        case .one:
            return (0, 1)
        case .two:
            return (1, 1)
//        case .three:
//            return (0, 1)
        }
    }
}
