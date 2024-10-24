//
//  Practice.swift
//  GabAnythingLab
//
//  Created by Gab on 10/24/24.
//

import SwiftUI

protocol ReducerInterface: ObservableObject {
    associatedtype State: Equatable
    associatedtype Action: Equatable
    
    func callAsFunction<V: Equatable>(_ keyPath: KeyPath<State, V>) -> V
    
    func action(_ action: Action)
}

protocol LAMReducer: ReducerInterface {
    static func test() -> String
}

protocol LAMFeatures {
    associatedtype Reducer: LAMReducer
    
    func eraseType() -> Reducer
}

class GabVM: LAMReducer {
    
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
        case one
    }
    
    @Published private var state: State = .init()
    
    func callAsFunction<V>(_ keyPath: KeyPath<State, V>) -> V where V : Equatable {
        return state[keyPath: keyPath]
    }
    
    func action(_ action: Action) {
        
    }
    
    static func test() -> String {
        return ""
    }
}

struct GabZoneOption: OptionSet {
    let rawValue: Int
    
    static let one = GabZoneOption(rawValue: 1 << 0)
}

protocol ZoneFeature {
    associatedtype Reducer: GabReducer
    
//    var option: GabZoneOption { get set }
    
    static func testCase(option: GabZoneOption) -> Reducer
}

class GabSelectZone: ZoneFeature {
    @ObservedObject private var viewModel = LoadingAnimationViewModel()
    
    static let shared = GabSelectZone()
    
//    var option: GabZoneOption
//    
//    public init(option: GabZoneOption) {
//        self.option = option
//    }
    
    static func testCase(option: GabZoneOption) -> some GabReducer {
        return GabSelectZone().viewModel
    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var gabZone: Self = .modifier(CommonPreviewModifier<GabSelectZone>())
}
