//
//  Image+SFSymbol.swift
//
//  Created by Adam Fordyce on 13/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public extension Image {
    @available(macOS 11.0, *)
    init(sfSymbol sfsymbol: SFSymbolName) {
        self.init(sfSymbol: sfsymbol.rawValue)
    }

    @available(macOS 11.0, *)
    init(sfSymbol sfsymbolName: String) {
        self.init(systemName: sfsymbolName)
    }
}
