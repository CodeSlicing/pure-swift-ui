//
//  View+Preview.swift
//
//
//  Created by Adam Fordyce on 16/12/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public enum PreviewDeviceName: String, CaseIterable {

    case Mac = "Mac"
    case iPhone_7 = "iPhone 7"
    case iPhone_7_Plus = "iPhone 7 Plus"
    case iPhone_8 = "iPhone 8"
    case iPhone_8_Plus = "iPhone 8 Plus"
    case iPhone_SE = "iPhone SE"
    case iPhone_X = "iPhone X"
    case iPhone_XS = "iPhone Xs"
    case iPhone_XS_Max = "iPhone Xs Max"
    case iPhone_XR = "iPhone Xʀ"
    case iPhone_11_Pro = "iPhone 11 Pro"
    case iPhone_11_Pro_Max = "iPhone 11 Pro Max"
    case iPad_mini_4 = "iPad mini 4"
    case iPad_Air_2 = "iPad Air 2"
    case iPad_Pro_9_7_inch = "iPad Pro (9.7-inch)"
    case iPad_Pro_12_9_inch = "iPad Pro (12.9-inch)"
    case iPad_5th_gen = "iPad (5th generation)"
    case iPad_Pro_12_9_inch_2nd_gen = "iPad Pro (12.9-inch) (2nd generation)"
    case iPad_Pro_10_5_inch = "iPad Pro (10.5-inch)"
    case iPad_6th_gen = "iPad (6th generation)"
    case iPad_Pro_11_inch = "iPad Pro (11-inch)"
    case iPad_Pro_12_9_inch_3rd_gen = "iPad Pro (12.9-inch) (3rd generation)"
    case iPad_mini_5th_gen = "iPad mini (5th generation)"
    case iPad_Air_3rd_gen = "iPad Air (3rd generation)"
    case Apple_TV = "Apple TV"
    case Apple_TV_4K = "Apple TV 4K"
    case Apple_TV_4K_at_1080p = "Apple TV 4K (at 1080p)"
    case Apple_Watch_Series_2_38mm = "Apple Watch Series 2 - 38mm"
    case Apple_Watch_Series_2_42mm = "Apple Watch Series 2 - 42mm"
    case Apple_Watch_Series_3_38mm = "Apple Watch Series 3 - 38mm"
    case Apple_Watch_Series_3_42mm = "Apple Watch Series 3 - 42mm"
    case Apple_Watch_Series_4_40mm = "Apple Watch Series 4 - 40mm"
    case Apple_Watch_Series_4_44mm = "Apple Watch Series 4 - 44mm"
}

// MARK: ----- PREVIEW DEVICE


public extension View {
    
    @inlinable
    func previewDevice(_ previewDeviceName: PreviewDeviceName) -> some View {
        previewDevice(previewDeviceName, displayName: previewDeviceName.rawValue)
    }

    @inlinable
    func previewDevice(_ previewDeviceName: PreviewDeviceName, displayName: String) -> some View {
        previewDevice(PreviewDevice(rawValue: previewDeviceName.rawValue))
            .previewDisplayName(displayName)
    }
}

// MARK: ----- LAYOUT

public extension View {

    @inlinable
    func previewSizeThatFits() -> some View {
        previewLayout(.sizeThatFits)
    }

    @inlinable
    func previewFixedSize(_ size: CGSize) -> some View {
        previewLayout(.fixed(width: size.width, height: size.height))
    }

    @inlinable
    func previewFixedSize<T: UINumericType>(_ size: T) -> some View {
        previewLayout(.fixed(width: size.asCGFloat, height: size.asCGFloat))
    }

    @inlinable
    func previewFixedSize<TX: UINumericType, TY: UINumericType>(_ x: TX, _ y: TY) -> some View {
        previewLayout(.fixed(width: x.asCGFloat, height: y.asCGFloat))
    }
}
