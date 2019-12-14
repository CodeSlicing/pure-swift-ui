//
//  InsettableShape+.swift
//  
//
//  Created by Adam Fordyce on 22/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public extension InsettableShape {
    
    func inset<T: UINumericType>(by amount: T) -> some InsettableShape {
        self.inset(by: amount.asCGFloat)
    }
}
