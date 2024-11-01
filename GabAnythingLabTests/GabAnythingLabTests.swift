//
//  GabAnythingLabTests.swift
//  GabAnythingLabTests
//
//  Created by Gab on 10/23/24.
//

import Testing

import SwiftUI
import Combine

@testable import GabAnythingLab

struct GabAnythingLabTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        print("상갑 logEvent \(#function)")
    }

    @Test func test() async throws {
        print("상갑 logEvent \(#function)")
    }
}


extension GabAnythingLabTests {
    
    @Test("LingShape Test")
    func lingShapeTest() async throws {
        print("상갑 logEvent \(#function)")
    }
}


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

public class LingShapeViewModel: GabReducer {
    public struct State: Equatable {
        public static func == (lhs: LingShapeViewModel.State, rhs: LingShapeViewModel.State) -> Bool {
            return lhs.animation == rhs.animation
        }
        
        public init () { }
        
        private var timer = Timer.publish(every: 1.5, on: .main, in: .default)
        private var cancellable: Cancellable?
        public var animation: AnimationMethod.Ling = .initial
    }
    
    public enum Action: Equatable {
        case animation(AnimationMethod.Ling)
    }
    
    @Published private var state: State = .init()
    
    public func action(_ action: Action) {
        switch action {
        case .animation(let mode):
            update(\.animation, newValue: mode)
        }
    }
}

extension LingShapeViewModel {
    public func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return state[keyPath: keyPath]
    }
    
    private func update<V>(_ keyPath: WritableKeyPath<State, V>, newValue: V) where V : Equatable {
        state[keyPath: keyPath] = newValue
    }
}
