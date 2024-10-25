//
//  page3.swift
//  GabAnythingLab
//
//  Created by Gab on 10/25/24.
//

import SwiftUI
import Combine

public protocol GabReducer: ObservableObject {
    associatedtype State: Equatable
    associatedtype Action: Equatable
    
    func callAsFunction<V: Equatable>(_ keyPath: KeyPath<State, V>) -> V
    
    func action(_ action: Action)
}

protocol GabInterface {
//    associatedtype Reducer: GabReducer where Reducer
//    static func makeReducer() ->
}

protocol GabFeature {
    associatedtype Reducer: GabReducer
}


//protocol KaPPaFeature {
//    associatedtype Reducer: GabReducer
//    func getReducer() -> Reducer
//}
//
//protocol KaPPaGeneric {
//    associatedtype Feature: KaPPaFeature
//    static func makeFeature() -> Feature
//}


class OneStore: GabReducer {
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
        
    }
    
    @Published private var state: State = .init()
    
    func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return state[keyPath: keyPath]
    }
    
    func action(_ action: Action) {
        
    }
}

class SampleStore: GabReducer {
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
        
    }
    
    @Published private var state: State = .init()
    
    func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return state[keyPath: keyPath]
    }
    
    func action(_ action: Action) {
        
    }
}

class GabStore: GabReducer {
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
        
    }
    
    @Published private var state: State = .init()
    
    func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return state[keyPath: keyPath]
    }
    
    func action(_ action: Action) {
        
    }
}


class KaPPaStore: GabReducer {
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
        
    }
    
    @Published private var state: State = .init()
    
    func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return state[keyPath: keyPath]
    }
    
    func action(_ action: Action) {
        
    }
}
