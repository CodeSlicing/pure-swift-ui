//
//  Text+Modifiers.swift
//
//  Created by Adam Fordyce on 07/01/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

import SwiftUI

// MARK: ----- ALIGNMENT

public extension Text {
    
    func align(_ alignment: TextAlignment) -> some View {
        multilineTextAlignment(alignment)
    }
}
