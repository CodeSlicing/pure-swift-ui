//
//  DynamicallyScalingFontViewModifier.swift
//
//  Created by Adam Fordyce on 16/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import Foundation

public struct DynamicallyScalingFontViewModifier: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String?
    var size: CGFloat

    public func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return RenderIf(name != nil) {
            content.font(.custom(self.name!, size: scaledSize))
        }.elseRender {
            content.font(.system(size: scaledSize))
        }
    }
}

public extension View {
    func scalingFont<T: UINumericType>(size: T, name: String? = nil) -> some View {
        return self.modifier(DynamicallyScalingFontViewModifier(name: name, size: size.asCGFloat))
    }
}
