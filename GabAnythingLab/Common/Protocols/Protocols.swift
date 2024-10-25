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

class SampleReducer: GabReducer {
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
//
//
//class GabLab: KaPPaFeature {
//    
//    var option: GabZoneOption
//    
//    init(option: GabZoneOption) {
//        self.option = option
//    }
//    
//    
//    func getReducer() -> some GabReducer {
//        switch option {
//        case .one:
//            return LoadingAnimationViewModel()
//        default:
//            return SampleReducer()
//        }
//    }
//}
