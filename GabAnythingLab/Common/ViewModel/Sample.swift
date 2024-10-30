//
//  Sample.swift
//  GabAnythingLab
//
//  Created by Gab on 10/30/24.
//

import SwiftUI

class TestAViewModel: GabReducer {
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
        case one
    }
    
    @Published private var state: State = State()
    
    func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return state[keyPath: keyPath]
    }
    
    func action(_ action: Action) {
        
    }
}

class TestBViewModel: GabReducer {
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
        case one
    }
    
    @Published private var state: State = State()
    
    func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return state[keyPath: keyPath]
    }
    
    func action(_ action: Action) {
        
    }
}

class TestCViewModel: GabReducer {
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
        case one
    }
    
    @Published private var state: State = State()
    
    func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return state[keyPath: keyPath]
    }
    
    func action(_ action: Action) {
        
    }
}

