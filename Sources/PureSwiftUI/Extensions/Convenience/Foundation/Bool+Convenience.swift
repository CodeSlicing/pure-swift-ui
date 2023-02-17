//
//  Bool+Convenience.swift
//
//
//  Created by Emil Kaczmarek on 17/02/2023.
//  Copyright © 2022 Emil Kaczmarek. All rights reserved.

public extension Bool {
    var isFalse: Bool {
        return self == false
    }
    var isTrue: Bool {
        return self == true
    }
    var negated: Bool {
        return !self
    }
}
