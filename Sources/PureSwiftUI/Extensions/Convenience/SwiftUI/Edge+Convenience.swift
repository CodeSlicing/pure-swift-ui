//
//  Edge+Convenience.swift
//  
//
//  Created by Adam Fordyce on 02/02/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

import SwiftUI

// MARK: ----- INSETS

public extension Edge.Set {

    func inset(_ edgeSet: Edge.Set, _ size: CGFloat) -> CGFloat {
        self.contains(edgeSet) ? size : 0
    }

    func hInset(_ size: CGFloat) -> CGFloat {
        inset(.horizontal, size)
    }
    
    func vInset(_ size: CGFloat) -> CGFloat {
        inset(.vertical, size)
    }
}
