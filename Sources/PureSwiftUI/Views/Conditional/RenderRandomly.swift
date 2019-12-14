//
//  RandomlyRender.swift
//
//  Created by Adam Fordyce on 09/10/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public struct RenderRandomly<IfContent>: View where IfContent: View {
    
    let render = Bool.random()
    let ifContent: () -> IfContent
    
    public init(@ViewBuilder content: @escaping () -> IfContent) {
        self.ifContent = content
    }
    
    public var body: some View {
        RenderIf(render) {
            self.ifContent()
        }
    }
    
    public func elseRender<ElseContent: View>(@ViewBuilder content elseContent: @escaping () -> ElseContent) -> some View {

        RenderIf(render) {
            self.ifContent()
        }.elseRender {
            elseContent()
        }
    }
}
