//
//  IndicatorWingShape.swift
//  GabAnythingLab
//
//  Created by Gab on 11/8/24.
//

import SwiftUI

struct IndicatorWingShape: Shape {
    
    var degress: Double
    
    init(degress: Double) {
        self.degress = degress
    }
    
    func path(in rect: CGRect) -> Path {
        draw(in: rect)
    }
    
    func draw(in rect: CGRect) -> Path {
        Path { path in
            let radians = degress * .pi / 180
            let movePoint = makeRefreshMovePoint(in: rect,
                                                 radians: radians)
            
            let addLinePoint = makeRefreshAddLinePoint(in: rect,
                                                       radians: radians,
                                                       movePoint: movePoint)
            
            path.move(to: movePoint.toCGPoint())
            path.addLine(to: addLinePoint.toCGPoint())
        }
    }
}

extension IndicatorWingShape {
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
    ZStack {
        IndicatorWingShape(degress: -90.0)
            .stroke(style: StrokeStyle(lineWidth: 5))
            .opacity(0.25)
            .frame(width: 50, height: 50)
        
        IndicatorWingShape(degress: -45.0)
            .stroke(style: StrokeStyle(lineWidth: 5))
            .opacity(0.5)
            .frame(width: 50, height: 50)
        
        IndicatorWingShape(degress: 0.0)
            .stroke(style: StrokeStyle(lineWidth: 5))
            .opacity(0.75)
            .frame(width: 50, height: 50)
        
        IndicatorWingShape(degress: 45.0)
            .stroke(style: StrokeStyle(lineWidth: 5))
            .frame(width: 50, height: 50)
    }
}
