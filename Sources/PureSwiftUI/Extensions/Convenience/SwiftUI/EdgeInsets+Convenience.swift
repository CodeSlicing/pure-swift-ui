//
//  EdgeInsets+Convenience.swift
//  
//
//  Created by Adam Fordyce on 02/02/2020.
//

import SwiftUI

public extension EdgeInsets {
    
    init(_ size: CGFloat) {
        self.init(top: size, leading: size, bottom: size, trailing: size)
    }
    
    init(_ horizontal: CGFloat, _ vertical: CGFloat) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }

    init(_ top: CGFloat, _ leading: CGFloat, _ bottom: CGFloat, _ trailing: CGFloat) {
        self.init(top: top, leading: leading, bottom: bottom, trailing: trailing)
    }

}

