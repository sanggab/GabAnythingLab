//
//  Page2.swift
//  GabAnythingLab
//
//  Created by Gab on 10/25/24.
//

import SwiftUI

protocol KaPPaMain {
    
}

protocol KaPPaFeature {
    associatedtype Reducer: GabReducer
    func getReducer() -> Reducer
}

protocol KaPPaGeneric {
    associatedtype Feature: KaPPaFeature
    static func makeFeature() -> Feature
}
