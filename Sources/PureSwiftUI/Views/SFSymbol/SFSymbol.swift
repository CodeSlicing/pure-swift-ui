//
//  SFSymbol.swift
//  
//
//  Created by Adam Fordyce on 07/12/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

public struct SFSymbol: View {
    
    private let image: Image
    
    public init(_ sfSymbol: SFSymbolName) {
        self.init(sfSymbol.rawValue)
    }
    
    public init(_ systemName: String) {
        self.image = Image(systemName: systemName)
    }
    
    public var body: Image {
        image
    }
    
    public func resizable() -> Image {
        self.image.resizable()
    }
    
    public func resizable(capInsets: EdgeInsets = EdgeInsets(), resizingMode: Image.ResizingMode = .stretch) -> Image {
        self.image.resizable(capInsets: capInsets, resizingMode: resizingMode)
    }
    
    public func antialiased(_ isAntialiased: Bool) -> Image {
        self.image.antialiased(isAntialiased)
    }
    
    public func interpolation(_ interpolation: Image.Interpolation) -> Image {
        self.image.interpolation(interpolation)
    }
    
    public func renderingMode(_ renderingMode: Image.TemplateRenderingMode?) -> Image {
        self.image.renderingMode(renderingMode)
    }
}
