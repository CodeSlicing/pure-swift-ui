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
        Group {
            if render {
                ifContent()
            }
        }
    }
    
    public func elseRender<ElseContent: View>(@ViewBuilder content elseContent: @escaping () -> ElseContent) -> some View {
        Group {
            if (self.render) {
                ifContent()
            } else {
                elseContent()
            }
        }
    }
}

