//
//  SFSymbol.swift
//  
//
//  Created by Adam Fordyce on 07/12/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public func SFSymbol(_ sfSymbol: SFSymbolName) -> Image {
    Image(systemName: sfSymbol.rawValue)
}
