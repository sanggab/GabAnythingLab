//
//  Preview.swift
//  GabAnythingLab
//
//  Created by Gab on 10/24/24.
//

import SwiftUI

//struct CommonPreviewModifier<Feature: ZoneFeature>: PreviewModifier {
//    typealias Context = Feature.Reducer
//    
//    var option: GabZoneOption
//    
//    init(option: GabZoneOption = .one) {
//        self.option = option
//    }
//    
//    static func makeSharedContext() async throws -> Context {
//        return Feature.testCase(option: .one)
//    }
//    // TODO: 지금은 Reducer 자체를 뽑아내고 있지만 앞으로 해결할려면 option을 가지고 Reducer를 뽑아내는 중간 다리 Protocol로 리턴하게 해야할 듯
//    func body(content: Content, context: Context) -> some View {
//        return content.environmentObject(context)
//    }
//}
//
////struct TestPreviewModifier<Zone: ZoneTest>: PreviewModifier {
////    typealias Context = Zone.Feature
////    
////    var option: GabZoneOption = .one
////    
////    static func makeSharedContext() async throws -> Context {
////        return Zone.nextReturn()
////    }
////    
////    func body(content: Content, context: Context) -> some View {
////        content.environmentObject(context.makeReducer(option: option))
////    }
////}
//
////struct KaPPaPreViewModifier<G: KaPPaGeneric>: PreviewModifier {
////    typealias Context = G.Feature
////    
////    static func makeSharedContext() async throws -> Context {
////        return G.makeFeature()
////    }
////    
////    func body(content: Content, context: Context) -> some View {
////        return content.environmentObject(context.getReducer())
////    }
////}
