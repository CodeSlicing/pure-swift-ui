//
//  View+GridLayoutHelpers.swift
//
//  Created by Adam Fordyce on 03/02/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

public extension View {
    
    func layoutGuide(_ layoutGuideConfig: LayoutGuideConfig, color: Color = .gray) -> some View {
        modifier(LayoutViewModifier(layoutGuideConfig: layoutGuideConfig, attributes: LayoutOverlayAttributes(color: color)))
    }
    
    func layoutGuide<TW: UINumericType>(_ layoutGuideConfig: LayoutGuideConfig, color: Color = .gray, lineWidth: TW) -> some View {
        modifier(LayoutViewModifier(layoutGuideConfig: layoutGuideConfig, attributes: LayoutOverlayAttributes(color: color, lineWidth: lineWidth.asCGFloat)))
    }
    
    func layoutGuide<TO: UINumericType>(_ layoutGuideConfig: LayoutGuideConfig, color: Color = .gray, opacity: TO) -> some View {
        modifier(LayoutViewModifier(layoutGuideConfig: layoutGuideConfig, attributes: LayoutOverlayAttributes(color: color, opacity: opacity.asDouble)))
    }
    
    func layoutGuide<TW: UINumericType, TO: UINumericType>(_ layoutGuideConfig: LayoutGuideConfig, color: Color = .gray, lineWidth: TW, opacity: TO) -> some View {
        modifier(LayoutViewModifier(layoutGuideConfig: layoutGuideConfig, attributes: LayoutOverlayAttributes(color: color, lineWidth: lineWidth.asCGFloat, opacity: opacity.asDouble)))
    }
}

private struct LayoutOverlayAttributes {
    let color: Color
    let lineWidth: CGFloat
    let opacity: Double
    
    init(color: Color = .gray, lineWidth: CGFloat = 0.5, opacity: Double = 0.5) {
        self.color = color
        self.lineWidth = lineWidth
        self.opacity = opacity
    }
}

private struct LayoutViewModifier: ViewModifier {
    
    private let layoutGuideConfig: LayoutGuideConfig
    private let attributes: LayoutOverlayAttributes
    
    @State private var frame: CGRect = .zero
    
    @Environment(\.showLayoutGuides) var showLayoutOverlays
    
    init(layoutGuideConfig: LayoutGuideConfig, attributes: LayoutOverlayAttributes) {
        self.layoutGuideConfig = layoutGuideConfig
        self.attributes = attributes
    }
    
    func body(content: Content) -> some View {
        RenderIf(showLayoutOverlays) {
            content
                .geometryReader { (geo: GeometryProxy) in
                    self.frame = geo.localFrame
            }
            .overlay(self.layoutGuideConfig
            .stroke(self.attributes.color, lineWidth: self.attributes.lineWidth).opacity(self.attributes.opacity).allowsHitTesting(false))
        }.elseRender {
            content
        }
    }
}

