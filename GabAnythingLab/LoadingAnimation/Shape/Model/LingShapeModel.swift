//
//  LingShapeModel.swift
//  GabAnythingLab
//
//  Created by Gab on 11/5/24.
//

import SwiftUI

public enum AnimationMethod: Equatable {
    public enum Ling: Equatable {
        public typealias LingTrim = (from: CGFloat, to: CGFloat)
        
        case initial
        case fill
        case empty
    }
}

public extension AnimationMethod.Ling {
    var trim: LingTrim {
        switch self {
        case .initial:
            return (from: 0, to: 0)
        case .fill:
            return (from: 0, to: 1)
        case .empty:
            return (from: 1, to: 1)
        }
    }
}
