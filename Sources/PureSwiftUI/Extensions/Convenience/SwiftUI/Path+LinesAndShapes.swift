//
//  Path+LinesAndShapes.swift
//
//  Created by Adam Fordyce on 23/08/2021.
//  Copyright © 2021 Adam Fordyce. All rights reserved.
//

import SwiftUI

public typealias PointAndRadius = (point: CGPoint, radius: CGFloat)

public extension Path {
    
    mutating func lines(_ points: CGPoint..., cornerRadius: CGFloat = 0) {
        lines(points, cornerRadius: cornerRadius)
    }
    
    mutating func lines(_ points: [CGPoint], cornerRadius: CGFloat = 0) {
        
        for index in 0..<(points.count - 1) {
            arc(points[index], points[index + 1], radius: cornerRadius)
        }
        line(points.last!)
    }
    
    mutating func lines(_ points: PointAndRadius...) {
        lines(points)
    }
    
    mutating func lines(_ points: [PointAndRadius]) {
        guard points.count > 0 else { return }
        
        for index in 0..<(points.count - 1) {
            arc(points[index].point, points[index + 1].point, radius: points[index].radius)
        }
        line(points.last?.point ?? .zero)
    }

    mutating func shape(_ points: CGPoint..., cornerRadius: CGFloat = 0) {
        shape(points, cornerRadius: cornerRadius)
    }
    
    mutating func shape(_ points: [CGPoint], cornerRadius: CGFloat = 0) {
        
            guard points.count > 0 else { return }
        
        if points.count == 1 {
            line(points.first!)
        } else {
            let startingPoint = points.first!.to(points.last!, 0.5)
            
            move(startingPoint)

            for index in 0..<(points.count - 1) {
                arc(points[index], points[index + 1], radius: cornerRadius)
            }
            arc(points.last!, startingPoint, radius: cornerRadius)
            line(startingPoint)
        }
    }
    
    mutating func shape(_ points: PointAndRadius...) {
        shape(points)
    }
    
    mutating func shape(_ points: [PointAndRadius]) {
        guard points.count > 0 else { return }
        
        if points.count == 1 {
            line(points.first!.point)
        } else {

            let startingPoint = points.first!.point.to(points.last!.point, 0.5)
                
            move(startingPoint)

            for index in 0..<(points.count - 1) {
                arc(points[index].point, points[index + 1].point, radius: points[index].radius)
            }
            arc(points.last!.point, startingPoint, radius: points.last!.radius)
            line(startingPoint)
        }
    }
}
