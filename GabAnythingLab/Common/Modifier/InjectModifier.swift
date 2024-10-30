//
//  InjectModifier.swift
//  GabAnythingLab
//
//  Created by Gab on 10/30/24.
//

import SwiftUI

struct InjectModifier: ViewModifier {
    
    var types: [ReducerType]
    
    init(types: [ReducerType]) {
        self.types = types
    }
    
    func body(content: Content) -> some View {
        ForEach(<#T##data: RandomAccessCollection##RandomAccessCollection#>, content: <#T##(Identifiable) -> View#>)
    }
}
