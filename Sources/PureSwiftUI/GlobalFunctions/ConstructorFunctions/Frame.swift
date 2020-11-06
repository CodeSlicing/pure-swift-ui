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

public func Frame(width: CGFloat) -> some View {
    FrameInternal(width: width)
}

public func Frame(height: CGFloat) -> some View {
    FrameInternal(height: height)
}

public func Frame(_ width: CGFloat, _ height: CGFloat) -> some View {
    FrameInternal(width: width, height: height)
}

public func Frame(width: CGFloat, _ color: Color) -> some View {
    FrameInternal(width: width, color: color)
}

public func Frame(height: CGFloat, _ color: Color) -> some View {
    FrameInternal(height: height, color: color)
}

public func Frame(_ width: CGFloat, _ height: CGFloat, _ color: Color) -> some View {
    FrameInternal(width: width, height: height, color: color)
}

public func Frame(_ size: CGSize) -> some View {
    FrameInternal(width: size.width, height: size.height)
}

public func Frame(_ size: CGSize, _ color: Color) -> some View {
    FrameInternal(width: size.width, height: size.height, color: color)
}

public func Frame(_ size: CGFloat) -> some View {
    FrameInternal(width: size, height: size)
}

public func Frame(_ size: CGFloat, _ color: Color) -> some View {
    Frame(size, size, color)
}

// named colors

public func Frame(_ size: CGSize, _ colorName: String) -> some View {
    Frame(size, Color(colorName))
}

public func Frame(_ size: CGFloat, _ colorName: String) -> some View {
    Frame(size, Color(colorName))
}

public func Frame(width: CGFloat, _ colorName: String) -> some View {
    FrameInternal(width: width, colorName: colorName)
}

public func Frame(height: CGFloat, _ colorName: String) -> some View {
    FrameInternal(height: height, colorName: colorName)
}

public func Frame(_ width: CGFloat, _ height: CGFloat, _ colorName: String) -> some View {
    FrameInternal(width: width, height: height, colorName: colorName)
}

// with view content

public func Frame<Content: View>(_ size: CGFloat, _ content: Content, alignment: Alignment = .center) -> some View {
    FrameInternal(width: size, height: size, content: content, alignment: alignment)
}

public func Frame<Content: View>(_ size: CGSize, _ content: Content, alignment: Alignment = .center) -> some View {
    FrameInternal(width: size.width, height: size.height, content: content, alignment: alignment)
}

public func Frame<Content: View>(width: CGFloat, _ content: Content, alignment: Alignment = .center) -> some View {
    FrameInternal(width: width, content: content, alignment: alignment)
}

public func Frame<Content: View>(height: CGFloat, _ content: Content, alignment: Alignment = .center) -> some View {
    FrameInternal(height: height, content: content, alignment: alignment)
}

public func Frame<Content: View>(_ width: CGFloat, _ height: CGFloat, _ content: Content, alignment: Alignment = .center) -> some View {
    FrameInternal(width: width, height: height, content: content, alignment: alignment)
}
