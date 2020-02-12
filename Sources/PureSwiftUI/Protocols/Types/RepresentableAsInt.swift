//
//  RepresentableAsInt.swift
//  
//  Created by Adam Fordyce on 19/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import CoreGraphics

public protocol RepresentableAsInt {
    var asInt: Int {get}
}

extension Int: RepresentableAsInt {
    public var asInt: Int {
        self
    }
}

extension Double: RepresentableAsInt {
    public var asInt: Int {
        Int(self)
    }
}

extension Float: RepresentableAsInt {
    public var asInt: Int {
        Int(self)
    }
}

extension CGFloat: RepresentableAsInt {
    public var asInt: Int {
        Int(self)
    }
}
