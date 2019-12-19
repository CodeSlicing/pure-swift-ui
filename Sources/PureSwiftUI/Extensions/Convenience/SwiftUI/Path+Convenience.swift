//
//  Path+Convenience.swift
//  
//
//  Created by Adam Fordyce on 05/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

private let rotationAdjustment = 90.degrees

private func adjustAngle(_ angle: Angle) -> Angle {
    angle - rotationAdjustment
}

public extension Path {
    
    mutating func line<TX: UINumericType, TY: UINumericType>(_ x: TX, _ y: TY) {
        line(x.asCGFloat, y.asCGFloat)
    }
    
    mutating func line(_ x: CGFloat, _ y: CGFloat) {
        addLine(to: CGPoint(x: x, y: y))
    }

    mutating func line(_ point: CGPoint) {
        addLine(to: point)
    }
    
    mutating func move<TX: UINumericType, TY: UINumericType>(_ x: TX, _ y: TY) {
        move(x.asCGFloat, y.asCGFloat)
    }
    
    mutating func move(_ x: CGFloat, _ y: CGFloat) {
        move(to: CGPoint(x: x, y: y))
    }
    
    mutating func move(_ point: CGPoint) {
        move(to: point)
    }
       
    mutating func arc(center: CGPoint, radius: CGFloat, startAngle: Angle, endAngle: Angle, clockwise: Bool) {
        
        addArc(center: center, radius: radius, startAngle: adjustAngle(startAngle), endAngle: adjustAngle(endAngle), clockwise: !clockwise)
    }
}
