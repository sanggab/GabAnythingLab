//
//  ViewModel.swift
//  GabAnythingLab
//
//  Created by Gab on 10/29/24.
//

import SwiftUI

class MainViewModel: GabReducer {
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
        case main
    }
    
    @Published private var state: State = State()
    
    func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return state[keyPath: keyPath]
    }
    
    func action(_ action: Action) {
        
    }
}
