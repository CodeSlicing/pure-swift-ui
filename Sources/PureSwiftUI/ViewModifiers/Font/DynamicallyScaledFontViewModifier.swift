//
//  DynamicallyScalingFontViewModifier.swift
//
//  Created by Adam Fordyce on 16/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import Foundation
#if !os(macOS)
public struct DynamicallyScalingFontViewModifier: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String?
    var size: CGFloat
    var weight: Font.Weight?

    public func body(content: Content) -> some View {
        let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(createFont(scaledSize: scaledSize))
    }
    
    private func createFont(scaledSize: CGFloat) -> Font {
        if let name = name {
            if let weight = weight {
                return Font.custom(name, size: scaledSize).weight(weight)
            } else {
                return Font.custom(name, size: scaledSize)
            }
        } else {
            if let weight = weight {
                return Font.system(size: scaledSize).weight(weight)
            } else {
                return Font.system(size: scaledSize)
            }
        }
    }
}

public extension View {
    func scalingFont(size: CGFloat, name: String? = nil, weight: Font.Weight? = nil) -> some View {
        modifier(DynamicallyScalingFontViewModifier(name: name, size: size, weight: weight))
    }
}
#endif
