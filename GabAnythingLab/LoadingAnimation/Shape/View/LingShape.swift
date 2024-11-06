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
        tailPath(in: rect)
    }
    
    func circlePath(in rect: CGRect) -> Path {
        Path { path in
            path.addArc(center: CGPoint(x: rect.midX,
                                        y: rect.midY),
                        radius: rect.width / 2,
                        startAngle: .degrees(0),
                        endAngle: .degrees(360),
                        clockwise: true)
            
            path.move(to: .zero)
            
            path.addLine(to: CGPoint(x: -(rect.width / 2), y: -(rect.width / 2)))
            
            path.move(to: CGPoint(x: rect.width / 2, y: -10))
            
            path.addLine(to: CGPoint(x: path.currentPoint?.x ?? .zero, y: -90))
            
        }
    }
    
    func tailPath(in rect: CGRect) -> Path {
        let a = pow(rect.width / 2, 2)
        let b = pow(rect.height / 2, 2)
        
        let c = sqrt(a + b)
        
        let _ = print("a : \(a)")
        let _ = print("b : \(b)")
        let _ = print("c : \(c)")
        
        let angleDegress = 45.0
        let angleRadians = angleDegress * .pi / 180
        let x = cos(angleRadians) * (rect.width / 2)
        let y = sin(angleRadians) * (rect.height / 2)
        
        let _ = print("x : \(x)")
        
        let _ = print("y : \(y)")
        
        return Path { path in
            
            path.move(to: CGPoint(x: rect.width / 2,
                                  y: 0))
            
            path.addLine(to: CGPoint(x: rect.width / 2,
                                     y: -c))
            
            path.move(to: CGPoint(x: (rect.width / 2) + x,
                                  y: (rect.height / 2) - y))
            
            path.addLine(to: CGPoint(x: (path.currentPoint?.x ?? .zero) + (rect.width / 2),
                                     y: (path.currentPoint?.y ?? .zero) - (rect.height / 2)))
            
            path.move(to: CGPoint(x: rect.width,
                                  y: rect.height / 2))
            
            path.addLine(to: CGPoint(x: rect.width + c,
                                     y: rect.height / 2))
            
            path.move(to: CGPoint(x: (rect.width / 2) + x,
                                  y: (rect.height / 2) + y))
            
            path.addLine(to: CGPoint(x: (path.currentPoint?.x ?? .zero) + (rect.width / 2),
                                     y: (path.currentPoint?.y ?? .zero) + (rect.height / 2)))
            
            path.move(to: CGPoint(x: rect.width / 2,
                                  y: rect.height))
            
            path.addLine(to: CGPoint(x: rect.width / 2,
                                     y: rect.height + c))
            
            path.move(to: CGPoint(x: (rect.width / 2) - x,
                                  y: (rect.height / 2) + y))
            
            path.addLine(to: CGPoint(x: (path.currentPoint?.x ?? .zero) - (rect.width / 2),
                                     y: (path.currentPoint?.y ?? .zero) + (rect.height / 2)))
            
            path.move(to: CGPoint(x: 0,
                                  y: rect.height / 2))
            
            path.addLine(to: CGPoint(x: -c,
                                     y: rect.height / 2))
            
            path.move(to: CGPoint(x: (rect.width / 2) - x,
                                  y: (rect.height / 2) - y))
            
            path.addLine(to: CGPoint(x: (path.currentPoint?.x ?? .zero) - (rect.width / 2),
                                     y: (path.currentPoint?.y ?? .zero) - (rect.height / 2)))
            
        }
    }
}

#Preview {
    LingShape()
        .stroke(.mint, style: StrokeStyle(lineWidth: 5, lineCap: .round))
        .frame(width: 20, height: 20)
}
