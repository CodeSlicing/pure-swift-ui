//
//  Comparible+Convenience.swift
//  
//  Created by Adam Fordyce on 05/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

public extension Comparable {
    
    func clamped(from: Self, to: Self) -> Self {
        if (self > to) {
            return to
        } else if (self < from) {
            return from
        }
        return self
    }
}
