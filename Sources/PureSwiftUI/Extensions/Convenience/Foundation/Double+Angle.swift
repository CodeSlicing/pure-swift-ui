//
//  Double+Angle.swift
//
//  Created by Adam Fordyce on 23/10/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

private let degreesAsRadiansFactor = Double.pi / 180
private let radiansAsDegreesFactor = 180 / Double.pi

public extension Double {
    
    var degrees: Angle {
        .degrees(self)
    }
    
    var radians: Angle {
        .radians(self)
    }

    var degreesAsRadians: Angle {
        (self * degreesAsRadiansFactor).radians
    }
    
    var radiansAsDegrees: Angle {
        (self * radiansAsDegreesFactor).degrees
    }
    
    var acos: Angle {
        Darwin.acos(self).radians
    }
    
    var asin: Angle {
        Darwin.asin(self).radians
    }
    
    var atan: Angle {
        Darwin.atan(self).radians
    }
}
