//
//  RenderedRandomly.swift
//  
//
//  Created by Adam Fordyce on 15/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public struct RenderedRandomly: ViewModifier {
    
    public func body(content: Content) -> some View {
        RenderRandomly() {
            content
        }
    }
}

public extension View {
    
    func renderedRandomly() -> some View {
        modifier(RenderedRandomly())
    }
}
