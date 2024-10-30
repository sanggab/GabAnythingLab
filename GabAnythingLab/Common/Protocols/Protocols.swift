//
//  Protocols.swift
//  GabAnythingLab
//
//  Created by Gab on 10/24/24.
//

import SwiftUI

public protocol GabReducer: ObservableObject {
    associatedtype State: Equatable
    associatedtype Action: Equatable
    
    func callAsFunction<V: Equatable>(_ keyPath: KeyPath<State, V>) -> V
    
    func action(_ action: Action)
}

class InjectReducerManager {
    static let `default` = InjectReducerManager()
    
    private init() { }
    
    func makeReducer(_ types: [ReducerType]) -> [any GabReducer] {
        var reducer: [any GabReducer] = []
        
        for type in types {
            switch type {
            case .a:
                reducer.append(makeAReducer())
            case .b:
                reducer.append(makeBReducer())
            case .c:
                reducer.append(makeCReducer())
            }
        }
        
        return reducer
    }
}

extension InjectReducerManager {
    func makeAReducer() -> some GabReducer {
        return TestAViewModel()
    }
    
    func makeBReducer() -> some GabReducer {
        return TestAViewModel()
    }
    
    func makeCReducer() -> some GabReducer {
        return TestAViewModel()
    }
}
