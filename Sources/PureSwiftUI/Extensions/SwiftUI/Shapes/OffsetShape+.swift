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
    
    init<TX: UINumericType>(_ shape: Content, x: TX) {
        self.init(shape, x: x, y: 0)
    }
    
    init<TY: UINumericType>(_ shape: Content, y: TY) {
        self.init(shape, x: 0, y: y)
    }
    
    init<TX: UINumericType, TY: UINumericType>(_ shape: Content, x: TX, y: TY) {
        self.init(shape, x: x.asCGFloat, y: y.asCGFloat)
    }
}


