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
        var hi: Int = .zero
        
    }
    
    public enum Action: Equatable {
        
    }
    
    @Published private var state: State = .init()
    
    public func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return state[keyPath: keyPath]
    }
    
    public func action(_ action: Action) {
        
    }
}
