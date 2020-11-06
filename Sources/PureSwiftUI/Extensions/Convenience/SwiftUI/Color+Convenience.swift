//
//  Color+Convenience.swift
//
//  Created by Adam Fordyce on 08/02/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

// MARK: ----- PURE COLORS

public extension Color {
    static let cgRed = Color(red: 1, green: 0, blue: 0)
    static let cgGreen = Color(red: 0, green: 1, blue: 0)
    static let cgBlue = Color(red: 0, green: 0, blue: 1)
    static let cgYellow = Color(red: 1, green: 1, blue: 0)
    static let cgMagenta = Color(red: 1, green: 0, blue: 1)
    static let cgOrange = Color(red: 1, green: 0.5, blue: 0)
    static let cgPurple = Color(red: 0.5, green: 0, blue: 0.5)
    static let cgCyan = Color(red: 0, green: 1, blue: 1)
    static let cgBrown = Color(red: 0.6, green: 0.4, blue: 0.2)
    static let cgGray = Color(white: 0.5)
    static let cgLightGray = Color(white: 0.667)
    static let cgDarkGray = Color(white: 0.333)
}

// MARK: ----- STATIC INITIALISERS

public extension Color {
    
    static func rgb(_ red: Double, _ green: Double, _ blue: Double) -> Color {
        Color(red: red / 255, green: green / 255, blue: blue / 255)
    }
    
    static func hsb(_ hue: Double, _ saturation: Double, _ brightness: Double) -> Color {
        Color(hue: hue, saturation: saturation, brightness: brightness)
    }
}
