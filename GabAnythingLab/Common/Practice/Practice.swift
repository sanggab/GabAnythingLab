//
//  Practice.swift
//  GabAnythingLab
//
//  Created by Gab on 10/24/24.
//

import SwiftUI

struct GabZoneOption: OptionSet {
    let rawValue: Int
    
    static let one = GabZoneOption(rawValue: 1 << 0)
}

protocol ZoneTest {
    associatedtype Feature: ZoneFeature
    static func nextReturn() -> Feature
}

protocol ZoneFeature {
    associatedtype Reducer: GabReducer
    
    static func testCase(option: GabZoneOption) -> Reducer
    
//    func makeReducer(option: GabZoneOption) -> Reducer
}

class GabSelectZone: ZoneFeature, ZoneTest {
    @ObservedObject private var viewModel = LoadingAnimationViewModel()
    
    static func testCase(option: GabZoneOption) -> some GabReducer {
        return GabSelectZone().viewModel
    }
    
    static func nextReturn() -> some ZoneFeature {
        return GabSelectZone()
    }
    
//    func makeReducer(option: GabZoneOption) -> Reducer {
//        return LoadingAnimationViewModel()
//    }
}

extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var gabZone: Self = .modifier(CommonPreviewModifier<GabSelectZone>())
}
