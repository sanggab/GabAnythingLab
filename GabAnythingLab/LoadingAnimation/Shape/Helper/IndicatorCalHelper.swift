//
//  IndicatorCalHelper.swift
//  GabAnythingLab
//
//  Created by Gab on 11/8/24.
//

import SwiftUI

public struct RefreshMovePoint {
    var x: CGFloat
    var y: CGFloat
    
    static let `default` = RefreshMovePoint(x: .zero, y: .zero)
    
    init(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }
    
    func toCGPoint() -> CGPoint {
        return CGPoint(x: x,
                       y: y)
    }
}

public struct RefreshAddLinePoint {
    var x: CGFloat
    var y: CGFloat
    
    static let `default` = RefreshAddLinePoint(x: .zero, y: .zero)
    
    init(x: CGFloat, y: CGFloat) {
        self.x = x
        self.y = y
    }
    
    func toCGPoint() -> CGPoint {
        return CGPoint(x: x,
                       y: y)
    }
}

public protocol IndicatorCalculationInterface {
    typealias RefreshPoint = (Move: RefreshMovePoint, Add: RefreshAddLinePoint)

    func makeMovePoint(in rect: CGRect, radians: Double) -> RefreshMovePoint
    func makeAddLinePoint(in rect: CGRect, radians: Double, movePoint: RefreshMovePoint) -> RefreshAddLinePoint
    func makePathPoint(in rect: CGRect, degress: Double) -> RefreshPoint
}

public class IndicatorHelpler {
    public static let shared = IndicatorHelpler()
    
    private init() { }
}

extension IndicatorHelpler: IndicatorCalculationInterface {
    
    public func makeMovePoint(in rect: CGRect, radians: Double) -> RefreshMovePoint {
        let x = (rect.width / 2) + ((rect.width / 2) * cos(radians))
        let y = (rect.height / 2) + ((rect.height / 2) * sin(radians))
        
        return RefreshMovePoint(x: x,
                                y: y)
    }
    
    public func makeAddLinePoint(in rect: CGRect, radians: Double, movePoint: RefreshMovePoint) -> RefreshAddLinePoint {
        let moveX = movePoint.x
        let moveY = movePoint.y
        
        let x = moveX + ((rect.width / 2) * cos(radians))
        let y = moveY + ((rect.height / 2) * sin(radians))
        
        return RefreshAddLinePoint(x: x,
                                   y: y)
    }
    
    public func makePathPoint(in rect: CGRect, degress: Double) -> RefreshPoint {
        let radians = degress * .pi / 180
        
        let movePoint = self.makeMovePoint(in: rect,
                                           radians: radians)
        
        let addLinePoint = self.makeAddLinePoint(in: rect,
                                                 radians: radians,
                                                 movePoint: movePoint)
        
        return (movePoint, addLinePoint)
    }
}
