//
//  PreviewTraits.swift
//  GabAnythingLab
//
//  Created by Gab on 10/31/24.
//

import SwiftUI

struct LoadingAnimationTraits: PreviewModifier {
    typealias Context = LoadingAnimationViewModel
    
    static func makeSharedContext() async throws -> Context {
        return LoadingAnimationViewModel()
    }
    
    func body(content: Content, context: Context) -> some View {
        content
            .environmentObject(context)
    }
}

public extension PreviewTrait where T == Preview.ViewTraits {
    @MainActor static var loadingAnimation: Self = .modifier(LoadingAnimationTraits())
}
