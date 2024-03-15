//
//  Text+ConditionalModifiers.swift
//
//  Created by Adam Fordyce on 07/01/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

import SwiftUI

// MARK: ----- FOREGROUND

public extension Text {
    
    func foregroundColorIf(_ condition: Bool, _ color: @autoclosure () -> Color) -> Text {
        if (condition) {
            return foregroundColor(color())
        }
        return self
    }
}
