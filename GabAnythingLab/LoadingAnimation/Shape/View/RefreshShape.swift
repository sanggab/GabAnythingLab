//
//  RefreshShape.swift
//  GabAnythingLab
//
//  Created by Gab on 11/6/24.
//

import SwiftUI

struct RefreshShape: Shape {
    @State private var degress: Double = .zero
    @State private var count: Double = .zero
    
    func path(in rect: CGRect) -> Path {
        tailPath(in: rect)
    }
    
    func tailPath(in rect: CGRect) -> Path {
        
//        let angleRadians = angleDegress * .pi / 180
//        let x = cos(angleRadians) * (rect.width / 2)
//        let y = sin(angleRadians) * (rect.height / 2)
//        let diagonal = self.getDiagonal(in: rect)
        
        return Path { path in
            for i in 0..<3 {
                print("상갑 logEvent \(#function) index: \(i)")
                let a = pow(rect.width / 2, 2)
                let b = pow(rect.height / 2, 2)
                let sqrt = sqrt(a + b)
                print("상갑 logEvent \(#function) sqrt: \(sqrt)")
                let degress: Double = Double(45 * i)
                let radians = degress * .pi / 180
                print("상갑 logEvent \(#function) degress: \(degress)")
                print("상갑 logEvent \(#function) radians: \(radians)")
                let x = (rect.width / 2) * cos(radians) + (rect.width / 2)
                let y = (rect.height / 2) * sin(radians) + (rect.height / 2)
                
                print("상갑 logEvent \(#function) x: \(x)")
                print("상갑 logEvent \(#function) y: \(y)")
                
                
                path.addArc(center: CGPoint(x: rect.width / 2, y: rect.height / 2),
                            radius: rect.width / 2,
                            startAngle: .degrees(.zero),
                            endAngle: .degrees(90),
                            clockwise: false)
                
                path.move(to: CGPoint(x: x,
                                      y: y))
                
                let radius = getRadius(in: rect, degress: degress, sqrt: sqrt)
                
                path.addLine(to: CGPoint(x: (path.currentPoint?.x ?? .zero) + radius.0,
                                         y: (path.currentPoint?.y ?? .zero) + radius.1))
                
            }
            
        }
    }
    
    func getRadius(in rect: CGRect, degress: Double, sqrt: Double) -> (CGFloat, CGFloat) {
        switch degress {
        case 0:
            return (rect.width / 2, .zero)
        case 45:
            return (rect.width / 2 , rect.height / 2)
        case 90:
            return (.zero, rect.height / 2)
        case 135:
            return (-(rect.width / 2), rect.height / 2)
        case 180:
            return (-(rect.width / 2), .zero)
        case 225:
            return (-(rect.width / 2), -(rect.height / 2))
        case 270:
            return (.zero, -(rect.height / 2))
        case 315:
            return (rect.width / 2, -(rect.height / 2))
        default:
            return (rect.width / 2, rect.height / 2)
        }
    }
}

private extension RefreshShape {
    func getDiagonal(in rect: CGRect) -> Double {
        let x = pow(rect.width / 2, 2)
        let y = pow(rect.height / 2, 2)
        
        return sqrt(x + y)
    }
    
//    func get
}

#Preview {
    RefreshShape()
        .stroke(.mint, style: StrokeStyle(lineWidth: 1,
                                          lineCap: .butt,
                                          lineJoin: .bevel))
        .frame(width: 50, height: 50)
        .background(.orange)
}
