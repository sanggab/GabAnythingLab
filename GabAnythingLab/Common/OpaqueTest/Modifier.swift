//
//  Modifier.swift
//  GabAnythingLab
//
//  Created by Gab on 10/29/24.
//

import SwiftUI

struct InjectReducerModifier: ViewModifier {
    private var types: [ReducerType]
    
    init(types: [ReducerType]) {
        self.types = types
    }
    
    func body(content: Content) -> some View {
        inject(content: content)
    }
}

extension InjectReducerModifier {
    func inject(content: Content) -> some View {
        ForEach(types, id: \.self) { type in
            content
                
        }
    }
}


private struct privateReducerModifier: ViewModifier {
    private var type: ReducerType
    
    private init(type: ReducerType) {
        self.type = type
    }
    
    func body(content: Content) -> some View {
        
    }
}
