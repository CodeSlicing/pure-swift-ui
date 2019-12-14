//
//  View+Layout.swift
//  
//
//  Created by Adam Fordyce on 28/10/2019.
//
import SwiftUI

public extension View {
    
    func offsetFromAngle(baseRotation: Angle, offsetAngle: Angle, forRadius radius: Double) -> some View {
        offset(x: xFromAngle(baseRotation + offsetAngle, forRadius: radius), y: -yFromAngle(baseRotation + offsetAngle, forRadius: radius))
    }
}
