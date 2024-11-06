//
//  LingShape.swift
//  GabAnythingLab
//
//  Created by Gab on 11/1/24.
//

import SwiftUI
import Foundation

struct LingShape: Shape {
    func path(in rect: CGRect) -> Path {
        circlePath(in: rect)
    }
    
    func circlePath(in rect: CGRect) -> Path {
        Path { path in
            path.addArc(center: CGPoint(x: rect.midX,
                                        y: rect.midY),
                        radius: rect.width / 2,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360),
                        clockwise: true)
        }
    }
}

#Preview {
    LingShape()
        .stroke(.mint, style: StrokeStyle(lineWidth: 5, lineCap: .round))
        .frame(width: 20, height: 20)
}
