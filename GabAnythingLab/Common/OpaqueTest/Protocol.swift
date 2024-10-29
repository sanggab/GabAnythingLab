//
//  Protocol.swift
//  GabAnythingLab
//
//  Created by Gab on 10/29/24.
//

import SwiftUI

public protocol GabReducer: ObservableObject {
    associatedtype State: Equatable
    associatedtype Action: Equatable

    func callAsFunction<V: Equatable>(_ keyPath: KeyPath<State, V>) -> V

    func action(_ action: Action)
}


public protocol ReducerFeature {
    associatedtype Reducer: GabReducer
    
    static func makeReducer() -> Reducer
}

protocol TesingResting {
    associatedtype Reducer: ReducerInterface
    func test(_ reducer: Reducer)
}

protocol MakingFactory {
    associatedtype Reducer: ReducerInterface where Reducer.Maker == Self
    func make() -> Reducer
}

protocol ReducerInterface {
    associatedtype Maker: MakingFactory where Maker.Reducer == Self
    
    static func making() -> Maker
    func test()
}
