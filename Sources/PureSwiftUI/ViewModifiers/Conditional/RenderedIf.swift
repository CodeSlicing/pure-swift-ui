//
//  RenderedIf.swift
//  
//
//  Created by Adam Fordyce on 15/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public struct RenderedIf: ViewModifier {
    let condition: Bool
    
    public init(_ condition: Bool) {
        self.condition = condition
    }
    
    @ViewBuilder public func body(content: Content) -> some View {
        if condition {
            content
        }
    }
}

public extension View {
    
    func renderedIf(_ condition: Bool) -> some View {
        modifier(RenderedIf(condition))
    }
}
