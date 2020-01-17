//
//  Frame.swift
//  
//
//  Created by Adam Fordyce on 09/01/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

import SwiftUI

private func FrameInternal(width: CGFloat? = nil, height: CGFloat? = nil, color: Color) -> some View {
    color.frame(width: width, height: height)
}

private func FrameInternal(width: CGFloat? = nil, height: CGFloat? = nil) -> some View {
    FrameInternal(width: width, height: height, color: .clear)
}

private func FrameInternal(width: CGFloat? = nil, height: CGFloat? = nil, colorName: String) -> some View {
    FrameInternal(width: width, height: height, color: Color(colorName))
}

private func FrameInternal<Content: View>(width: CGFloat? = nil, height: CGFloat? = nil, content: Content, alignment: Alignment = .center) -> some View {
    FrameInternal(width: width, height: height).background(content, alignment: alignment)
}

public func Frame<T: UINumericType>(width: T) -> some View {
    FrameInternal(width: width.asCGFloat)
}

public func Frame<T: UINumericType>(height: T) -> some View {
    FrameInternal(height: height.asCGFloat)
}

public func Frame<TW: UINumericType, TH: UINumericType>(_ width: TW, _ height: TH) -> some View {
    FrameInternal(width: width.asCGFloat, height: height.asCGFloat)
}

public func Frame<T: UINumericType>(width: T, _ color: Color) -> some View {
    FrameInternal(width: width.asCGFloat, color: color)
}

public func Frame<T: UINumericType>(height: T, _ color: Color) -> some View {
    FrameInternal(height: height.asCGFloat, color: color)
}

public func Frame<TW: UINumericType, TH: UINumericType>(_ width: TW, _ height: TH, _ color: Color) -> some View {
    FrameInternal(width: width.asCGFloat, height: height.asCGFloat, color: color)
}

public func Frame(_ size: CGSize) -> some View {
    FrameInternal(width: size.width, height: size.height)
}

public func Frame(_ size: CGSize, _ color: Color) -> some View {
    FrameInternal(width: size.width, height: size.height, color: color)
}

public func Frame<T: UINumericType>(_ size: T) -> some View {
    FrameInternal(width: size.asCGFloat, height: size.asCGFloat)
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

public func Frame<T: UINumericType>(width: T, _ colorName: String) -> some View {
    FrameInternal(width: width.asCGFloat, colorName: colorName)
}

public func Frame<T: UINumericType>(height: T, _ colorName: String) -> some View {
    FrameInternal(height: height.asCGFloat, colorName: colorName)
}

public func Frame<TW: UINumericType, TH: UINumericType>(_ width: TW, _ height: TH, _ colorName: String) -> some View {
    FrameInternal(width: width.asCGFloat, height: height.asCGFloat, colorName: colorName)
}

// with view content

public func Frame<T: UINumericType, Content: View>(_ size: T, _ content: Content, alignment: Alignment = .center) -> some View {
    FrameInternal(width: size.asCGFloat, height: size.asCGFloat, content: content, alignment: alignment)
}

public func Frame<Content: View>(_ size: CGSize, _ content: Content, alignment: Alignment = .center) -> some View {
    FrameInternal(width: size.width, height: size.height, content: content, alignment: alignment)
}

public func Frame<T: UINumericType, Content: View>(width: T, _ content: Content, alignment: Alignment = .center) -> some View {
    FrameInternal(width: width.asCGFloat, content: content, alignment: alignment)
}

public func Frame<T: UINumericType, Content: View>(height: T, _ content: Content, alignment: Alignment = .center) -> some View {
    FrameInternal(height: height.asCGFloat, content: content, alignment: alignment)
}

public func Frame<TW: UINumericType, TH: UINumericType, Content: View>(_ width: TW, _ height: TH, _ content: Content, alignment: Alignment = .center) -> some View {
    FrameInternal(width: width.asCGFloat, height: height.asCGFloat, content: content, alignment: alignment)
}
