//
//  View+ClipShapes.swift
//
//
//  Created by Adam Fordyce on 18/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public extension View {
    //extract modifier to also clip content shape
    
    private func clipShapeInternal<S: Shape>(_ shape: S, constrainGestures: Bool) -> some View {
            self.clipShape(shape)
                .contentShapeIf(constrainGestures, shape)
    }
    
    func clipCapsule(constrainGestures: Bool = true) -> some View {
        clipShapeInternal(Capsule(), constrainGestures: constrainGestures)
    }
    
    func clipCircle(constrainGestures: Bool = true) -> some View {
        clipShapeInternal(Circle(), constrainGestures: constrainGestures)
    }
    
    func clipEllipse(constrainGestures: Bool = true) -> some View {
        clipShapeInternal(Ellipse(), constrainGestures: constrainGestures)
    }
    
    func clipRectangle(constrainGestures: Bool = true) -> some View {
        clipShapeInternal(Rectangle(), constrainGestures: constrainGestures)
    }
    
    func clipRoundedRectangle<T: UINumericType>(_ cornerRadius: T, style: RoundedCornerStyle = .continuous, constrainGestures: Bool = true) -> some View {
        clipShapeInternal(RoundedRectangle(cornerRadius, style: style), constrainGestures: constrainGestures)
    }
    
    func clipRoundedRectangle<TW: UINumericType, TH: UINumericType>(_ width: TW, _ height: TH, style: RoundedCornerStyle = .continuous, constrainGestures: Bool = true) -> some View {
        clipShapeInternal(RoundedRectangle(width, height, style: style), constrainGestures: constrainGestures)
    }
    
    func clipRoundedRectangle(_ cornerSize: CGSize, style: RoundedCornerStyle = .continuous, constrainGestures: Bool = true) -> some View {
        clipShapeInternal(RoundedRectangle(cornerSize, style: style), constrainGestures: constrainGestures)
    }
}
