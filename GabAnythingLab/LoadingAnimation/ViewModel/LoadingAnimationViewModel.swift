//
//  LoadingAnimationViewModel.swift
//  GabAnythingLab
//
//  Created by Gab on 10/24/24.
//

import SwiftUI

public class LoadingAnimationViewModel: GabReducer {
    
    public struct State: Equatable {
        public init () { }
        var name: String = ""
    }
    
    public enum Action: Equatable {
        case updateName(String)
    }
    
    @Published private var state: State = .init()
    
    public func action(_ action: Action) {
        switch action {
        case .updateName(let name):
            update(\.name, newValue: name)
        }
    }
}

extension LoadingAnimationViewModel {
    public func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return state[keyPath: keyPath]
    }
    
    private func update<V>(_ keyPath: WritableKeyPath<State, V>, newValue: V) where V : Equatable {
        state[keyPath: keyPath] = newValue
    }
}
