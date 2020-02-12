//
//  RepresentableAsCGFloat.swift
//  
//  Created by Adam Fordyce on 19/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import CoreGraphics

public protocol RepresentableAsCGFloat {
    var asCGFloat: CGFloat {get}
}

extension Int: RepresentableAsCGFloat {
    public var asCGFloat: CGFloat {
        CGFloat(self)
    }
}

extension Float: RepresentableAsCGFloat {
    public var asCGFloat: CGFloat {
        CGFloat(self)
    }
}

extension Double: RepresentableAsCGFloat {
    public var asCGFloat: CGFloat {
        CGFloat(self)
    }
}

extension CGFloat: RepresentableAsCGFloat {
    public var asCGFloat: CGFloat {
        self
    }
}


