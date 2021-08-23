//
//  CGFloat+Angle.swift
//
//  Created by Adam Fordyce on 24/10/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public extension CGFloat {
    
    var degrees: Angle {
        .degrees(asDouble)
    }
    
    var radians: Angle {
        .radians(asDouble)
    }
    
    var cycles: Angle {
        .cycles(asDouble)
    }
    
    var degreesAsRadians: Angle {
        asDouble.degreesAsRadians
    }
    
    var radiansAsDegrees: Angle {
        asDouble.radiansAsDegrees
    }
    
    var acos: Angle {
        Darwin.acos(asDouble).radians
    }
    
    var asin: Angle {
        Darwin.asin(asDouble).radians
    }
    
    var atan: Angle {
        Darwin.atan(asDouble).radians
    }
}
