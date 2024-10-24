////
////  Preview.swift
////  GabAnythingLab
////
////  Created by Gab on 10/24/24.
////
//
import SwiftUI

struct CommonPreviewModifier<Test: ZoneFeature>: PreviewModifier {
    typealias Context = Test.Reducer
    
    static func makeSharedContext() async throws -> Context {
        return Test.testCase(option: .one)
    }
    
    func body(content: Content, context: Context) -> some View {
        content.environmentObject(context)
    }
}
