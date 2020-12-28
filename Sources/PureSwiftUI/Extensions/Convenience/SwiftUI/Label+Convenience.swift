//
//  Label+Convenience.swift
//  
//  Created by Adam Fordyce on 28/12/2020.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import Foundation
import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public extension Label where Title == Text, Icon == Image {
    
    init(_ titleKey: LocalizedStringKey, sfSymbol sfSymbolName: SFSymbolName) {
        self.init(titleKey, systemImage: sfSymbolName.rawValue)
    }

    init<S>(_ title: S, sfSymbol sfSymbolName: SFSymbolName) where S : StringProtocol {
        self.init(title, systemImage: sfSymbolName.rawValue)
    }
}
