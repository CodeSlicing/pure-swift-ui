//
//  Path+Convenience.swift
//  
//
//  Created by Adam Fordyce on 05/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI



// MARK: ----- NORMALISATION

public let rotationAdjustment = 90.degrees

public func adjustAngle(_ angle: Angle) -> Angle {
    angle - rotationAdjustment
}

// MARK: ----- UNCONSTRAINED MOVE

public extension Path {
    
    mutating func move(_ point: CGPoint) {
        move(to: point)
    }
    
    mutating func move(_ x: CGFloat, _ y: CGFloat) {
        move(CGPoint(x: x, y: y))
    }
    
    mutating func move(offset: CGPoint) {
        if let currentPoint = currentPoint {
            move(currentPoint.x + offset.x, currentPoint.y + offset.y)
        }
    }

    mutating func move(offset: CGSize) {
        move(offset: offset.asCGPoint)
    }

    mutating func move(offset: CGVector) {
        move(offset: offset.asCGPoint)
    }
}

// MARK: ----- CONSTRAINED MOVE IN X

public extension Path {

    mutating func hMove(offset: CGFloat) {
        move(offset: CGPoint(offset, 0))
    }
}

// MARK: ----- CONSTRAINED MOVE TO X

public extension Path {
    
    mutating func hMove(_ x: CGFloat) {
        if let currentPoint = currentPoint {
            move(x, currentPoint.y)
        }
    }
    
    mutating func hMove(_ point: CGPoint) {
        hMove(point.x)
    }
}

// MARK: ----- CONSTRAINED MOVE IN Y

public extension Path {
    
    mutating func vMove(offset: CGFloat) {
        move(offset: CGPoint(0, offset))
    }
}

// MARK: ----- CONSTRAINED MOVE TO Y

public extension Path {
        
    mutating func vMove(_ y: CGFloat) {
        if let currentPoint = currentPoint {
            move(currentPoint.x, y)
        }
    }
    
    mutating func vMove(_ point: CGPoint) {
        vMove(point.y)
    }
}

// MARK: ----- LINE

public extension Path {
    
    mutating func line(_ point: CGPoint) {
        addLine(to: point)
    }
    
    mutating func line(length: CGFloat, angle: Angle) {
        if let currentPoint = currentPoint {
            line(currentPoint.offset(radius: length, angle: angle))
        }
    }
    
    mutating func line(_ x: CGFloat, _ y: CGFloat) {
        line(CGPoint(x: x, y: y))
    }
    
    mutating func lines(_ lines: [CGPoint]) {
        addLines(lines)
    }
    
    mutating func line(offset: CGPoint) {
        if let currentPoint = currentPoint {
            line(currentPoint.x + offset.x, currentPoint.y + offset.y)
        }
    }
    
    mutating func line(offset: CGSize) {
        line(offset: offset.asCGPoint)
    }

    mutating func line(offset: CGVector) {
        line(offset: offset.asCGPoint)
    }
}

// MARK: ----- CONSTRAINED LINE IN X

public extension Path {

    mutating func hLine(offset: CGFloat) {
        line(offset: CGPoint(offset, 0))
    }
}

// MARK: ----- CONSTRAINED LINE TO X

public extension Path {
    
    mutating func hLine(_ x: CGFloat) {
        if let currentPoint = currentPoint {
            line(x, currentPoint.y)
        }
    }
    
    mutating func hLine(_ point: CGPoint) {
        hLine(point.x)
    }
}

// MARK: ----- CONSTRAINED LINE IN Y

public extension Path {

    mutating func vLine(offset: CGFloat) {
        line(offset: CGPoint(0, offset))
    }
}

// MARK: ----- CONSTRAINED LINE TO Y

public extension Path {
    
    mutating func vLine(_ y: CGFloat) {
        if let currentPoint = currentPoint {
            line(currentPoint.x, y)
        }
    }
    
    mutating func vLine(_ point: CGPoint) {
        vLine(point.y)
    }
}

// MARK: ----- LINE AT

public extension Path {
    
    mutating func line(at location: CGPoint, vector: CGVector, anchor: UnitPoint = .topLeading) {
        let origin = location.offset(in: vector, anchor: anchor)
        move(origin)
        line(origin.offset(vector))
    }
    
    mutating func hLine(at location: CGPoint, length: CGFloat, anchor: UnitPoint = .topLeading) {
        line(at: location, vector: CGVector(length, 0), anchor: anchor)
    }
    
    mutating func vLine(at location: CGPoint, length: CGFloat, anchor: UnitPoint = .topLeading) {
        line(at: location, vector: CGVector(0, length), anchor: anchor)
    }
}

// MARK: ----- LINE AT WITH ANGLE

public extension Path {
    
    mutating func line(at location: CGPoint, length: CGFloat, angle: Angle, anchor: UnitPoint = .center) {
        let rotatedPoint = location.calcPoint(length: length, angle: angle)
        let delta = rotatedPoint - location
        let origin = location.offset(in: delta, anchor: anchor)
        line(from: origin, to: origin + delta)
    }
}

// MARK: ----- LINE FROM

public extension Path {
    
    mutating func line(from: CGPoint, to: CGPoint) {
        move(from)
        line(to)
    }
}

// MARK: ----- LINE FROM WITH ANGLE

public extension Path {
    
    mutating func line(from: CGPoint, length: CGFloat, angle: Angle) {
        line(from: from, to: from.calcPoint(length: length, angle: angle))
    }
}

// MARK: ----- RECT

public extension Path {
    
    mutating func rect(_ rect: CGRect, transform: CGAffineTransform = .identity) {
        addRect(rect, transform: transform)
    }
    
    mutating func rect(_ origin: CGPoint, _ size: CGSize, transform: CGAffineTransform = .identity) {
        rect(CGRect(origin, size), transform: transform)
    }
    
    mutating func rects(_ rects: [CGRect], transform: CGAffineTransform = .identity) {
        addRects(rects, transform: transform)
    }
}

// MARK: ----- RECT WITH ANCHOR

public extension Path {
    
    mutating func rect(_ rect: CGRect, anchor: UnitPoint, transform: CGAffineTransform = .identity) {
        self.rect(rect.offset(anchor: anchor), transform: transform)
    }
    
    mutating func rect(_ origin: CGPoint, _ size: CGSize, anchor: UnitPoint, transform: CGAffineTransform = .identity) {
        rect(CGRect(origin.offset(in: size, anchor: anchor), size), transform: transform)
    }
}

// MARK: ----- FROM POINT TO POINT

public extension Path {
    
    mutating func rect(from: CGPoint, to: CGPoint, anchor: UnitPoint = .topLeading, transform: CGAffineTransform = .identity) {
        rect(CGRect(from: from, to: to), transform: transform)
    }
}

// MARK: ----- ROUNDED RECT WITH CORNER SIZE

public extension Path {
    
    mutating func roundedRect(_ rect: CGRect, cornerSize: CGSize, transform: CGAffineTransform = .identity) {
        addRoundedRect(in: rect, cornerSize: cornerSize, transform: transform)
    }
    
    mutating func roundedRect(_ origin: CGPoint, _ size: CGSize, cornerSize: CGSize, transform: CGAffineTransform = .identity) {
        roundedRect(CGRect(origin, size), cornerSize: cornerSize, transform: transform)
    }
}

// MARK: ----- ROUNDED RECT WITH CORNER RADIUS

public extension Path {
    
    mutating func roundedRect(_ rect: CGRect, cornerRadius: CGFloat, transform: CGAffineTransform = .identity) {
        addRoundedRect(in: rect, cornerSize: .square(cornerRadius), transform: transform)
    }
    
    mutating func roundedRect(_ origin: CGPoint, _ size: CGSize, cornerRadius: CGFloat, transform: CGAffineTransform = .identity) {
        roundedRect(CGRect(origin, size), cornerRadius: cornerRadius, transform: transform)
    }
}

// MARK: ----- ROUNDED RECT WITH CORNER SIZE AND ANCHOR

public extension Path {
    
    mutating func roundedRect(_ rect: CGRect, cornerSize: CGSize, anchor: UnitPoint, transform: CGAffineTransform = .identity) {
        roundedRect(rect.offset(anchor: anchor), cornerSize: cornerSize, transform: transform)
    }
    
    mutating func roundedRect(_ origin: CGPoint, _ size: CGSize, cornerSize: CGSize, anchor: UnitPoint, transform: CGAffineTransform = .identity) {
        roundedRect(CGRect(origin.offset(in: size, anchor: anchor), size), cornerSize: cornerSize, transform: transform)
    }
}

// MARK: ----- ROUNDED RECT AT WITH CORNER RADIUS AND ANCHOR

public extension Path {
    
    mutating func roundedRect(_ rect: CGRect, cornerRadius: CGFloat, anchor: UnitPoint, transform: CGAffineTransform = .identity) {
        roundedRect(rect.offset(anchor: anchor), cornerSize: .square(cornerRadius), transform: transform)
    }

    mutating func roundedRect(_ origin: CGPoint, _ size: CGSize, cornerRadius: CGFloat, anchor: UnitPoint, transform: CGAffineTransform = .identity) {
        roundedRect(CGRect(origin.offset(in: size, anchor: anchor), size), cornerSize: .square(cornerRadius), transform: transform)
    }
}

// MARK: ----- ELLIPSE

public extension Path {
    
    mutating func ellipse(_ rect: CGRect, transform: CGAffineTransform = .identity) {
        addEllipse(in: rect, transform: transform)
    }
    
    mutating func ellipse(_ origin: CGPoint, _ size: CGSize, transform: CGAffineTransform = .identity) {
        ellipse(CGRect(origin, size), transform: transform)
    }
}

// MARK: ----- ELLIPSE WITH ANCHOR

public extension Path {

    mutating func ellipse(_ rect: CGRect, anchor: UnitPoint, transform: CGAffineTransform = .identity) {
        ellipse(rect.offset(anchor: anchor), transform: transform)
    }

    mutating func ellipse(_ origin: CGPoint, _ size: CGSize, anchor: UnitPoint, transform: CGAffineTransform = .identity) {
        ellipse(CGRect(origin.offset(in: size, anchor: anchor), size), transform: transform)
    }
    
}

// MARK: ----- CIRCLE

public extension Path {
    
    mutating func circle(_ rect: CGRect, transform: CGAffineTransform = .identity) {
        addEllipse(in: rect, transform: transform)
    }
    
    mutating func circle(_ origin: CGPoint, _ size: CGFloat, transform: CGAffineTransform = .identity) {
        circle(origin, size, anchor: .center)
    }
}

// MARK: ----- CIRCLE WITH ANCHOR

public extension Path {

    mutating func circle(_ rect: CGRect, anchor: UnitPoint, transform: CGAffineTransform = .identity) {
        circle(rect.offset(anchor: anchor), transform: transform)
    }

    mutating func circle(_ origin: CGPoint, _ size: CGFloat, anchor: UnitPoint, transform: CGAffineTransform = .identity) {
        let squareCGSize: CGSize = .square(size * 2)
        circle(CGRect(origin.offset(in: squareCGSize, anchor: anchor), squareCGSize), transform: transform)
    }
    
}

// MARK: ----- QUAD CURVE

public extension Path {
    
    private mutating func addControlPoint(_ point: CGPoint)  {
        if let currentPoint = currentPoint {
            ellipse(point, .square(5), anchor: .center)
            line(from: point, to: currentPoint)
        }
    }
    
    mutating func quadCurve(_ point: CGPoint, cp: CGPoint, showControlPoints: Bool = false) {
        if showControlPoints {
            addControlPoint(cp)
        }
        addQuadCurve(to: point, control: cp)
    }
}

// MARK: ----- CURVE

public extension Path {
    
    private mutating func addControlPoints(_ cp1: CGPoint, _ cp2: CGPoint, destination: CGPoint)  {
        if let currentPoint = currentPoint {
            ellipse(cp1, .square(5), anchor: .center)
            ellipse(cp2, .square(5), anchor: .center)
            line(from: cp2, to: destination)
            line(from: cp1, to: currentPoint)
        }
    }
    
    mutating func curve(_ point: CGPoint, cp1: CGPoint, cp2: CGPoint, showControlPoints: Bool = false) {
        if showControlPoints {
            addControlPoints(cp1, cp2, destination: point)
        }
        addCurve(to: point, control1: cp1, control2: cp2)
    }
}

// MARK: ----- ARC

public extension Path {
    
    mutating func arc(_ center: CGPoint, radius: CGFloat, startAngle: Angle, endAngle: Angle, clockwise: Bool = true, transform: CGAffineTransform = .identity) {
        addArc(center: center, radius: radius, startAngle: adjustAngle(startAngle), endAngle: adjustAngle(endAngle), clockwise: !clockwise, transform: transform)
    }
    
    mutating func relativeArc(_ center: CGPoint, radius: CGFloat, startAngle: Angle, delta: Angle, transform: CGAffineTransform = .identity) {
        addRelativeArc(center: center, radius: radius, startAngle: adjustAngle(startAngle), delta: delta, transform: transform)
    }
}
