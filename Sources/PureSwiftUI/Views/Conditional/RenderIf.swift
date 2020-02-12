//
//  RenderIf.swift
//
//  Created by Adam Fordyce on 26/10/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public struct RenderIf<IfContent: View>: View {
    
    let render: Bool
    let ifContent: () -> IfContent

    public init(_ render: Bool, @ViewBuilder content ifContent: @escaping () -> IfContent) {
        self.render = render
        self.ifContent = ifContent
    }
    
    public var body: some View {
        if render {
            return IfContent?.some(ifContent())
        } else {
            return IfContent?.none
        }
    }
    
    public func elseRender<ElseContent: View>(@ViewBuilder content elseContent: @escaping () -> ElseContent) -> some View {
        Builder {
            if self.render {
                ifContent()
            } else {
                elseContent()
            }
        }
    }
}

internal struct Builder<Content: View>: View {
    
    var content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
    }
}
