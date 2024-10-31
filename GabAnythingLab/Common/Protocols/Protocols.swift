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
