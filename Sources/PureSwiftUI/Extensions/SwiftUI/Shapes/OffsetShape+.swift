//
//  OffsetShape+.swift
//  
//
//  Created by Adam Fordyce on 18/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public extension OffsetShape {
    
    init(_ shape: Content, x: CGFloat = 0, y: CGFloat = 0) {
        self.init(shape: shape, offset: CGSize(width: x, height: y))
    }
    
    init(_ shape: Content, x: CGFloat) {
        self.init(shape, x: x, y: 0)
    }
    
    init(_ shape: Content, y: CGFloat) {
        self.init(shape, x: 0, y: y)
    }
}


