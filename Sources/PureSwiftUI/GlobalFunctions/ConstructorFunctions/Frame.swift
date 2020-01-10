//
//  Frame.swift
//  
//
//  Created by Adam Fordyce on 09/01/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

import SwiftUI

public func Frame(_ width: CGFloat, _ height: CGFloat) -> some View {
    Spacer().frame(width, height)
}

public func Frame<TW: UINumericType, TH: UINumericType>(_ width: TW, _ height: TH) -> some View {
    Frame(width.asCGFloat, height.asCGFloat)
}

public func Frame<TW: UINumericType, TH: UINumericType>(_ width: TW, _ height: TH, _ color: Color) -> some View {
    Frame(width, height).backgroundColor(color)
}

public func Frame(_ size: CGSize) -> some View {
    Frame(size.width, size.height)
}

public func Frame(_ size: CGSize, _ color: Color) -> some View {
    Frame(size.width, size.height, color)
}

public func Frame<T: UINumericType>(_ size: T) -> some View {
    Frame(size, size)
}

public func Frame<T: UINumericType>(_ size: T, _ color: Color) -> some View {
    Frame(size, size, color)
}

// named colors

public func Frame(_ size: CGSize, _ colorName: String) -> some View {
    Frame(size, Color(colorName))
}

public func Frame<T: UINumericType>(_ size: T, _ colorName: String) -> some View {
    Frame(size, Color(colorName))
}

public func Frame<TW: UINumericType, TH: UINumericType>(_ width: TW, _ height: TH, _ colorName: String) -> some View {
    Frame(width, height, Color(colorName))
}

// with view content

public func Frame<T: UINumericType, Content: View>(_ size: T, _ content: Content, alignment: Alignment = .center) -> some View {
    Frame(size, size, content, alignment: alignment)
}

public func Frame<Content: View>(_ size: CGSize, _ content: Content, alignment: Alignment = .center) -> some View {
    Frame(size.width, size.height, content, alignment: alignment)
}

public func Frame<TW: UINumericType, TH: UINumericType, Content: View>(_ width: TW, _ height: TH, _ content: Content, alignment: Alignment = .center) -> some View {
    Frame(width, height).background(content, alignment: alignment)
}
