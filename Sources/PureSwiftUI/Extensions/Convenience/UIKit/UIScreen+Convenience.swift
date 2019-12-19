//
//  UIScreen+Convenience.swift
//  
//
//  Created by Adam Fordyce on 18/12/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import UIKit

public extension UIScreen {
    
    var origin: CGPoint {
        bounds.origin
    }
    
    var center: CGPoint {
        bounds.center
    }
    
    var width: CGFloat {
        bounds.width
    }
    
    var height: CGFloat {
        bounds.height
    }
    
    var size: CGSize {
        bounds.size
    }
    
    var midX: CGFloat {
        bounds.midX
    }
    
    var midY: CGFloat {
        bounds.midY
    }
    
    var minX: CGFloat {
        bounds.origin.x
    }
    
    var minY: CGFloat {
        bounds.origin.y
    }
    
    var maxX: CGFloat {
        bounds.maxX
    }
    
    var maxY: CGFloat {
        bounds.maxY
    }
}
