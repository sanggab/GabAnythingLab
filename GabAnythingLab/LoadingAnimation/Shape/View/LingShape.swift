//
//  LingShape.swift
//  GabAnythingLab
//
//  Created by Gab on 11/1/24.
//

import SwiftUI

struct LingShape: Shape {
    @EnvironmentObject private var viewModel: LingShapeViewModel
    
    func path(in rect: CGRect) -> Path {
        let _ = print("상갑 logEvent \(#function) rect: \(rect)")
        
        return Path { path in
            path.addArc(center: CGPoint(x: rect.midX,
                                        y: rect.midY),
                        radius: rect.width / 2,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360),
                        clockwise: true)
        }
    }
}

#Preview(traits: .lingShape) {
    LingShape()
        .stroke(.mint, lineWidth: 5)
        .frame(width: 100, height: 100)
}
