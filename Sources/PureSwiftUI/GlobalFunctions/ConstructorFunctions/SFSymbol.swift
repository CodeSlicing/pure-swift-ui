//
//  SFSymbol.swift
//  
//
//  Created by Adam Fordyce on 07/12/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

@available(macOS 11.0, *)
public func SFSymbol(_ systemName: String) -> Image {
    Image(systemName: systemName)
}

@available(macOS 11.0, *)
public func SFSymbol(_ systemName: String, _ renderingMode: Image.TemplateRenderingMode) -> Image {
    SFSymbol(systemName)
        .renderingMode(renderingMode)
}

@available(macOS 11.0, *)
public func SFSymbol(_ sfSymbol: SFSymbolName) -> Image {
    SFSymbol(sfSymbol.rawValue)
}

@available(macOS 11.0, *)
public func SFSymbol(_ sfSymbol: SFSymbolName, _ renderingMode: Image.TemplateRenderingMode) -> Image {
    SFSymbol(sfSymbol.rawValue, renderingMode)
}


