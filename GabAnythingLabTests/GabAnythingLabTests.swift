//
//  GabAnythingLabTests.swift
//  GabAnythingLabTests
//
//  Created by Gab on 10/23/24.
//

import Testing
import XCTest

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
        let viewModel = TestLingShapeViewModel()
        
        try #require(viewModel(\.animation) == .initial)
        
        viewModel.action(.animation(.fill))
        #expect(viewModel(\.animation) == .fill)
        
        viewModel.action(.timer(.setTimer))
        #expect(viewModel(\.timerState.speed) == 1.5)
        
        try await Task.sleep(nanoseconds: 3_000_000_000)
        
        try #require(viewModel(\.timerState).existCancellables() == true)
        
        viewModel.action(.timer(.stopTimer))
        
        #expect(viewModel(\.timerState).existCancellables() == false)
        
        try await Task.sleep(nanoseconds: 3_000_000_000)
        
        print(viewModel(\.timerState).date)
    }
}


public enum TestAnimationMethod: Equatable {
    public enum Ling: Equatable {
        public typealias LingTrim = (from: CGFloat, to: CGFloat)
        
        case initial
        case fill
        case empty
    }
}

public extension TestAnimationMethod.Ling {
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

public class TestLingShapeViewModel: GabReducer {
    
    public struct TimerState: Equatable {
        public static func == (lhs: TestLingShapeViewModel.TimerState, rhs: TestLingShapeViewModel.TimerState) -> Bool {
            return lhs.speed == rhs.speed ||
            lhs.cancellable == rhs.cancellable
        }
        
        init() {
            self.timer = Timer.publish(every: self.speed, on: .main, in: .default)
        }
        
        public var timer: Timer.TimerPublisher
        private var cancellable: Set<AnyCancellable> = []
        public var speed: Double = .zero
        public var date: Date = .init()
        
        mutating public func setTimer() {
            print("상갑 logEvent \(#function)")
            // MARK: Timer의 autoConnect의 장점은 멀까 - 어차피 every의 시간마다 호출되서 View가 Draw될 때 바로 onReceive에 구독되는 것도 아닌데..
            self.timer = Timer.publish(every: self.speed, on: .main, in: .default)
            self.timer.connect().store(in: &cancellable)
        }
        
        mutating public func stopTimer() {
            print("상갑 logEvent \(#function)")
            self.cancellable.removeAll()
        }
        
        func existCancellables() -> Bool {
            return !self.cancellable.isEmpty
        }
    }
    
    public struct State: Equatable {
        public init () { }
        
        public var animation: TestAnimationMethod.Ling = .initial
        public var timerState: TimerState = .init()
    }
    
    public enum Action: Equatable {
        case animation(TestAnimationMethod.Ling)
        case timer(Action.Timer)
        
        public enum Timer: Equatable {
            case setSpeed(Double)
            case setTimer
            case stopTimer
        }
    }
    
    @Published private var state: State = .init()
    
    public func action(_ action: Action) {
        print("상갑 logEvent \(#function) action: \(action)")
        switch action {
        case .animation(let mode):
            update(\.animation, newValue: mode)
        case .timer(let timerAC):
            timerAction(timerAC)
        }
    }
    
    private func timerAction(_ action: Action.Timer) {
        print("상갑 logEvent \(#function) action: \(action)")
        switch action {
        case .setSpeed(let double):
            update(\.timerState.speed, newValue: double)
        case .setTimer:
            if self.state.timerState.speed == .zero {
                self.timerAction(.setSpeed(1.5))
            }
            
            setTimer()
        case .stopTimer:
            stopTimer()
        }
    }
}

extension TestLingShapeViewModel {
    public func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return state[keyPath: keyPath]
    }
    
    private func update<V>(_ keyPath: WritableKeyPath<State, V>, newValue: V) where V : Equatable {
        state[keyPath: keyPath] = newValue
    }
    
    private func setTimer() {
        self.state.timerState.setTimer()
    }
    
    private func stopTimer() {
        self.state.timerState.stopTimer()
    }
}
