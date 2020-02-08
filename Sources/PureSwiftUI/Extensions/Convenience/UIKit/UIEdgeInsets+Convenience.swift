//
//  UIEdgeInsets+Convenience.swift
//  
//
//  Created by Adam Fordyce on 02/02/2020.
//

import Foundation

public extension UIEdgeInsets {
    
    init(_ width: CGFloat) {
        self.init(top: width, left: width, bottom: width, right: width)
    }
    
    init<T: UINumericType>(_ width: T) {
        self.init(width.asCGFloat)
    }
    
    init(_ horizontal: CGFloat, _ vertical: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }

    init<TH: UINumericType, TV: UINumericType>(_ horizontal: TH, _ vertical: TV) {
        self.init(horizontal.asCGFloat, vertical.asCGFloat)
    }

    init(_ top: CGFloat, _ leading: CGFloat, _ bottom: CGFloat, _ trailing: CGFloat) {
        self.init(top: top, left: leading, bottom: bottom, right: trailing)
    }

    init<T_TOP: UINumericType, T_LEADING: UINumericType, T_BOTTOM: UINumericType, T_TRAILING: UINumericType>(_ top: T_TOP, _ leading: T_LEADING, _ bottom: T_BOTTOM, _ trailing: T_TRAILING) {
        self.init(top: top.asCGFloat, left: leading.asCGFloat, bottom: bottom.asCGFloat, right: trailing.asCGFloat)
    }
}
