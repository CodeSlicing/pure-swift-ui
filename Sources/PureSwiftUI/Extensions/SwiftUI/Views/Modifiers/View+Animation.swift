//
//  View+Animation.swift
//  
//
//  Created by Adam Fordyce on 21/12/2019.
//

import SwiftUI

public extension View {
    
    func animationIf(_ condition: Bool, _ theAnimation: Animation? = .default) -> some View {
        transaction {
            if condition {
                $0.animation = theAnimation
            }
        }
    }
    
    func withAnimationIf<Result>(_ condition: Bool, _ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
        if condition {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
}
