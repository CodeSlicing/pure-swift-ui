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
    
    init(_ horizontal: CGFloat, _ vertical: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }

    init(_ top: CGFloat, _ leading: CGFloat, _ bottom: CGFloat, _ trailing: CGFloat) {
        self.init(top: top, left: leading, bottom: bottom, right: trailing)
    }
}
