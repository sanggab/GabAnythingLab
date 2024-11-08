//
//  RefreshShape.swift
//  GabAnythingLab
//
//  Created by Gab on 11/6/24.
//

import SwiftUI

struct RefreshShape: Shape {
    func path(in rect: CGRect) -> Path {
        tailPath(in: rect)
    }
    
    func tailPath(in rect: CGRect) -> Path {
        return Path { path in
            for i in 0..<8 {
                let refreshPoint = getRadius(in: rect, path: path, index: i)
                let movePoint = refreshPoint.Move
                let addPoint = refreshPoint.Add
                
                path.move(to: CGPoint(x: movePoint.x,
                                      y: movePoint.y))
                
                path.addLine(to: CGPoint(x: addPoint.x,
                                         y: addPoint.y))
            }
        }
    }
    
    func getRadius(in rect: CGRect, path: Path, index: Int) -> IndicatorCalculationInterface.RefreshPoint {
        let degress: Double = Double(45 * index)
        let radians = degress * .pi / 180
        
        let movePoint = makeRefreshMovePoint(in: rect,
                                             radians: radians)
        
        let addLinePoint = makeRefreshAddLinePoint(in: rect,
                                                   radians: radians,
                                                   movePoint: movePoint)
        
        return (movePoint, addLinePoint)
    }
    
    private func makeRefreshMovePoint(in rect: CGRect, radians: Double) -> RefreshMovePoint {
        let x = (rect.width / 2) + ((rect.width / 2) * cos(radians))
        let y = (rect.height / 2) + ((rect.height / 2) * sin(radians))
        
        return RefreshMovePoint(x: x,
                                y: y)
    }
    
    private func makeRefreshAddLinePoint(in rect: CGRect, radians: Double, movePoint: RefreshMovePoint) -> RefreshAddLinePoint {
        let moveX = movePoint.x
        let moveY = movePoint.y
        
        let x = moveX + ((rect.width / 2) * cos(radians))
        let y = moveY + ((rect.height / 2) * sin(radians))
        
        return RefreshAddLinePoint(x: x,
                                   y: y)
    }
    
}

#Preview {
    RefreshShape()
        .stroke(.mint, style: StrokeStyle(lineWidth: 5,
                                          lineCap: .round,
                                          lineJoin: .round))
        .frame(width: 50, height: 50)
//        .background(.orange)
}
