//
//  GeometryProxy.swift
//
//  Created by Adam Fordyce on 13/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public extension GeometryProxy {
    
    var width: CGFloat {
        size.width
    }
    
    func width<T: UINumericType>(fraction: T) -> CGFloat {
        width * fraction.asCGFloat
    }
    
    func width(fraction: CGFloat) -> CGFloat {
        width * fraction
    }
    
    var height: CGFloat {
        size.height
    }
    
    func height<T: UINumericType>(fraction: T) -> CGFloat {
        height * fraction.asCGFloat
    }
    
    func height(fraction: CGFloat) -> CGFloat {
        height * fraction
    }
    
    var localMidX: CGFloat {
        frame(in: .local).midX
    }
    
    var localMidY: CGFloat {
        frame(in: .local).midY
    }
    
    var globalMidX: CGFloat {
        frame(in: .global).midX
    }
    
    var globalMidY: CGFloat {
        frame(in: .global).midY
    }
    
    var globalOrigin: CGPoint {
        frame(in: .global).origin
    }
    
    var globalCenter: CGPoint {
        CGPoint(globalMidX, globalMidY)
    }
}
