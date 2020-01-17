//
//  RelativeOffsetViewModifier.swift
//  
//
//  Created by Adam Fordyce on 13/01/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

import SwiftUI

protocol RelativeOffsetForSizeProvider {
    func offset(size: CGSize?) -> CGPoint
}

struct RelativeOffsetProvider: RelativeOffsetForSizeProvider {
    
    let relativeOffset: CGPoint
    
    func offset(size: CGSize?) -> CGPoint {
        .init(relativeOffset.x * (size?.width ?? 0), relativeOffset.y * (size?.height ?? 0))
    }
}

struct RelativeXOffsetProvider: RelativeOffsetForSizeProvider {
    
    let relativeXOffset: CGFloat
    
    func offset(size: CGSize?) -> CGPoint {
        .init(relativeXOffset * (size?.width ?? 0), 0)
    }
}

struct RelativeYOffsetProvider: RelativeOffsetForSizeProvider {
    
    let relativeYOffset: CGFloat
    
    func offset(size: CGSize?) -> CGPoint {
        .init(0, relativeYOffset * (size?.height ?? 0))
    }
}

struct RelativeOffsetViewModifier: ViewModifier {
    
    let condition: Bool
    let relativeOffsetForSizeProvider: RelativeOffsetForSizeProvider
    
    @State private var size: CGSize?
    
    func body(content: Content) -> some View {
        content
            .offsetIf(condition, relativeOffsetForSizeProvider.offset(size: self.size))
            .geometryReader { (geo: GeometryProxy) in
                self.size = geo.size
        }
    }
}
