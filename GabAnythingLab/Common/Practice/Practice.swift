//
//  Practice.swift
//  GabAnythingLab
//
//  Created by Gab on 10/24/24.
//

import SwiftUI

protocol ReducerInterface: ObservableObject {
    associatedtype State: Equatable
    associatedtype Action: Equatable
    
    func callAsFunction<V: Equatable>(_ keyPath: KeyPath<State, V>) -> V
    
    func action(_ action: Action)
}

protocol LAMReducer: ReducerInterface {
    
}

protocol LAMFeatures {
    associatedtype Reducer: LAMReducer
    
    func eraseType() -> Reducer
}

class GabVM: LAMReducer {
    
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
        case one
    }
    
    @Published private var state: State = .init()
    
    func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return state[keyPath: keyPath]
    }
    
    func action(_ action: Action) {
        
    }
}

class HI: LAMFeatures {
    func eraseType() -> some LAMReducer {
        return GabVM()
    }
}


