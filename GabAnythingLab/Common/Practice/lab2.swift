//
//  lab2.swift
//  GabAnythingLab
//
//  Created by Gab on 10/28/24.
//

import SwiftUI

class KappaViewModel: GabReducer, ExtractReducer {
    struct State: Equatable {
        
    }
    
    struct Action: Equatable {
        
    }
    
    @Published private var state: State = .init()
    
    func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return state[keyPath: keyPath]
    }
    
    func action(_ action: Action) {
        
    }
}
// ExtraReducer
extension KappaViewModel {
    func getReducer() -> some GabReducer {
        return self
    }
}
