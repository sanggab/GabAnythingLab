//
//  lablab.swift
//  GabAnythingLab
//
//  Created by Gab on 10/28/24.
//

import SwiftUI

public protocol GabReducer: ObservableObject {
    associatedtype State: Equatable
    associatedtype Action: Equatable

    func callAsFunction<V: Equatable>(_ keyPath: KeyPath<State, V>) -> V

    func action(_ action: Action)
}

// 각 ViewModel의 Interface = GabReducer
// GabReducer 뽑아낼 수 있는 Interface가 존재해야됨 = ExtractReducer

protocol ExtractReducer {
    associatedtype Reducer: GabReducer
    
    func getReducer() -> Reducer
}
