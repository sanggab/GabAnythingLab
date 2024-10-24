////
////  Preview.swift
////  GabAnythingLab
////
////  Created by Gab on 10/24/24.
////
//
import SwiftUI

struct CommonPreviewModifier<CASE: LAMReducer>: PreviewModifier {
    typealias Context = CASE
    
    static func makeSharedContext() async throws -> Context {
//        return 
    }
    
    func body(content: Content, context: Context) -> some View {
        
    }
}
