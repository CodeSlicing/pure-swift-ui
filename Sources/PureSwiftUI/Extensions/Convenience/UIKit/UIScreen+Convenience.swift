//
//  UIScreen+Convenience.swift
//  
//
//  Created by Adam Fordyce on 18/12/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

#if canImport(UIKit) && !os(watchOS)
import UIKit

public extension UIScreen {
    
    static func mainOrigin() -> CGPoint {
        main.origin
    }
    
    static func mainCenter() -> CGPoint {
        main.center
    }
    
    static var mainWidth: CGFloat {
        main.width
    }
    
    static var halfMainWidth: CGFloat {
        main.size.halfWidth
    }

    static func mainWidthScaled(_ scale: CGFloat) -> CGFloat {
        main.widthScaled(scale)
    }
    
    static var mainHeight: CGFloat {
        main.height
    }
    
    static var halfMainHeight: CGFloat {
        main.size.halfHeight
    }
    
    static func mainHeightScaled(_ scale: CGFloat) -> CGFloat {
        main.heightScaled(scale)
    }
    
    static var mainMidX: CGFloat {
        main.midX
    }

    static var mainMidY: CGFloat {
        main.midY
    }

    static var mainMinX: CGFloat {
        main.minX
    }

    static var mainMinY: CGFloat {
        main.minY
    }
    
    static var mainMaxX: CGFloat {
        main.maxX
    }

    static var mainMaxY: CGFloat {
        main.maxY
    }
    
    static func mainSizeScaled(_ scale: CGFloat) -> CGSize {
        main.sizeScaled(scale)
    }
    
    static func mainSizeScaled(_ widthScale: CGFloat, _ heightScale: CGFloat) -> CGSize {
        main.sizeScaled(widthScale, heightScale)
    }
    
    static var mainSize: CGSize {
        main.size
    }
    
    static var mainBounds: CGRect {
        main.bounds
    }
    
    var origin: CGPoint {
        bounds.origin
    }
    
    var center: CGPoint {
        bounds.center
    }
    
    var width: CGFloat {
        bounds.width
    }
    
    var halfWidth: CGFloat {
        bounds.halfWidth
    }
    
    func widthScaled(_ scale: CGFloat) -> CGFloat {
        width * scale
    }
    
    var height: CGFloat {
        bounds.height
    }
    
    var halfHeight: CGFloat {
        bounds.halfHeight
    }
    
    func heightScaled(_ scale: CGFloat) -> CGFloat {
        height * scale
    }

    var size: CGSize {
        bounds.size
    }
    
    func sizeScaled(_ scale: CGFloat) -> CGSize {
        bounds.size.scaled(scale)
    }
    
    func sizeScaled(_ widthScale: CGFloat, _ heightScale: CGFloat) -> CGSize {
        bounds.size.scaled(widthScale, heightScale)
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
#endif
