//
//  Shape+ConditionalModifiers.swift
//
//
//  Created by Adam Fordyce on 19/12/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

// MARK: ----- OFFSET

public extension Shape {

    func offsetIf(_ condition: Bool, _ x: CGFloat, _ y: CGFloat) -> OffsetShape<Self> {
        offset(condition ? x : 0, condition ? y : 0)
    }

    func offsetIfNot(_ condition: Bool, _ x: CGFloat, _ y: CGFloat) -> OffsetShape<Self> {
        offsetIf(!condition, x, y)
    }

    func xOffsetIf(_ condition: Bool, _ x: CGFloat) -> OffsetShape<Self> {
        xOffset(condition ? x : 0)
    }

    func xOffsetIfNot(_ condition: Bool, _ x: CGFloat) -> OffsetShape<Self> {
        xOffsetIf(!condition, x)
    }

    func yOffsetIf(_ condition: Bool, _ y: CGFloat) -> OffsetShape<Self> {
        yOffset(condition ? y : 0)
    }

    func yOffsetIfNot(_ condition: Bool, _ y: CGFloat) -> OffsetShape<Self> {
        yOffsetIf(!condition, y)
    }
}

// MARK: ----- SCALE

public extension Shape {

    func scaleIf(_ condition: Bool, _ scale: CGFloat, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        self.scale(condition ? scale : 1, anchor: anchor)
    }

    func scaleIfNot(_ condition: Bool, _ scale: CGFloat, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scaleIf(!condition, scale, anchor: anchor)
    }

    func scaleIf(_ condition: Bool, _ scaleX: CGFloat, _ scaleY: CGFloat, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scale(x: condition ? scaleX : 1, y: condition ? scaleY : 1, anchor: anchor)
    }

    func scaleIfNot(_ condition: Bool, _ scaleX: CGFloat, _ scaleY: CGFloat, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scaleIf(!condition, scaleX, scaleY, anchor: anchor)
    }

    func xScaleIf(_ condition: Bool, _ scaleX: CGFloat, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        xScale(condition ? scaleX : 1, anchor: anchor)
    }

    func xScaleIfNot(_ condition: Bool, _ scaleX: CGFloat, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        xScaleIf(!condition, scaleX, anchor: anchor)
    }

    func yScaleIf(_ condition: Bool, _ scaleY: CGFloat, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        yScale(condition ? scaleY : 1, anchor: anchor)
    }

    func yScaleIfNot(_ condition: Bool, _ scaleY: CGFloat, anchor: UnitPoint = .center) -> ScaledShape<Self> {
        scaleIf(!condition, scaleY, anchor: anchor)
    }
}

// MARK: ----- ROTATION

public extension Shape {

    func rotateIf(_ condition: Bool, _ angle: Angle, anchor: UnitPoint = .center) -> RotatedShape<Self> {
        rotation(condition ? angle : 0.degrees, anchor: anchor)
    }

    func rotateIfNot(_ condition: Bool, _ angle: Angle, anchor: UnitPoint = .center) -> RotatedShape<Self> {
        rotateIf(!condition, angle, anchor: anchor)
    }
}
