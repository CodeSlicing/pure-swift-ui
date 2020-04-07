//
//  OffsetToPositionViewModifier.swift
//
//
//  Created by Adam Fordyce on 13/01/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

import SwiftUI

protocol OffsetForPositionProvider {
    func offsetPosition(center: CGPoint?, relativeTo: CGPoint, anchorOffset: CGSize) -> CGPoint
}

struct XOffsetPositionProvider: OffsetForPositionProvider {
    
    func offsetPosition(center: CGPoint?, relativeTo: CGPoint, anchorOffset: CGSize) -> CGPoint {
        if let center = center {
            return .init(relativeTo.x - center.x + anchorOffset.width, 0)
        }
        return .zero
    }
}

struct YOffsetPositionProvider: OffsetForPositionProvider {
    
    func offsetPosition(center: CGPoint?, relativeTo: CGPoint, anchorOffset: CGSize) -> CGPoint {
        if let center = center {
            return .init(0, relativeTo.y - center.y + anchorOffset.height)
        }
        return .zero
    }
}

struct OffsetPositionProvider: OffsetForPositionProvider {
    
    func offsetPosition(center: CGPoint?, relativeTo: CGPoint, anchorOffset: CGSize) -> CGPoint {
        if let center = center {
            return .init(relativeTo.x - center.x + anchorOffset.width, relativeTo.y - center.y + anchorOffset.height)
        }
        return .zero
    }
}

struct OffsetToPositionViewModifier: ViewModifier {
    
    var condition: Bool
    var relativeTo: CGPoint = .zero
    var coordinateSpace = CoordinateSpace.global
    var anchor: UnitPoint = .center
    var offsetForPositionProvider: OffsetForPositionProvider

    @State private var center: CGPoint?
    @State private var size: CGSize?
    
    var anchorAsOffset: CGSize {
        if let size = size, let _ = center {
            switch anchor {
            case .topLeading, .zero:
                return size.scaled(0.5)
            case .top:
                return .init(0, size.height / 2)
            case .topTrailing:
                return .init(-size.width / 2, size.height / 2)
            case .leading:
                return .init(size.width / 2, 0)
            case .center:
                return .zero
            case .trailing:
                return .init(-size.width / 2, 0)
            case .bottomLeading:
                return .init(size.width / 2, -size.height / 2)
            case .bottom:
                return .init(0, -size.height / 2)
            case .bottomTrailing:
                return .init(-size.width / 2, -size.height / 2)
            default:
                return .init(anchor.x - size.width / 2, anchor.y - size.height / 2)
            }
        }
        return .zero
    }
    
    func body(content: Content) -> some View {
        content
            .offsetIf(condition, offsetForPositionProvider.offsetPosition(
                center: self.center,
                relativeTo: self.relativeTo,
                anchorOffset: self.anchorAsOffset))
            .geometryReader { (geo: GeometryProxy) in
                self.center = geo.frame(in: self.coordinateSpace).center
                self.size = geo.size
        }
    }
}
