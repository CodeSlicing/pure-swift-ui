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
    
    case iPhone_4s = "iPhone 4s"

    case iPhone_5  = "iPhone 5"
    case iPhone_5s = "iPhone 5s"
    
    case iPhone_6       = "iPhone 6"
    case iPhone_6_Plus  = "iPhone 6 Plus"
    case iPhone_6s      = "iPhone 6s"
    case iPhone_6s_Plus = "iPhone 6s Plus"

    case iPhone_7      = "iPhone 7"
    case iPhone_7_Plus = "iPhone 7 Plus"
    
    case iPhone_8      = "iPhone 8"
    case iPhone_8_Plus = "iPhone 8 Plus"
    
    case iPhone_SE = "iPhone SE"
    
    case iPhone_X      = "iPhone X"
    case iPhone_XS     = "iPhone Xs"
    case iPhone_XS_Max = "iPhone Xs Max"
    case iPhone_XR     = "iPhone Xʀ"
    
    case iPhone_11         = "iPhone 11"
    case iPhone_11_Pro     = "iPhone 11 Pro"
    case iPhone_11_Pro_Max = "iPhone 11 Pro Max"

    case iPhone_SE_1st_gen = "iPhone SE (1st generation)"
    case iPhone_SE_2nd_gen = "iPhone SE (2nd generation)"
    
    case iPhone_12_mini    = "iPhone 12 mini"
    case iPhone_12         = "iPhone 12"
    case iPhone_12_Pro     = "iPhone 12 Pro"
    case iPhone_12_Pro_Max = "iPhone 12 Pro Max"
    
    case iPhone_13_mini    = "iPhone 13 mini"
    case iPhone_13         = "iPhone 13"
    case iPhone_13_Pro     = "iPhone 13 Pro"
    case iPhone_13_Pro_Max = "iPhone 13 Pro Max"

    case iPod_touch_7th_gen = "iPod touch (7th generation)"
    
    case iPad_mini_2       = "iPad mini 2"
    case iPad_mini_3       = "iPad mini 3"
    case iPad_mini_4       = "iPad mini 4"
    case iPad_mini_5th_gen = "iPad mini (5th generation)"
    case iPad_mini_6th_gen = "iPad mini (6th generation)"
    
    case iPad_Air         = "iPad Air"
    case iPad_Air_2       = "iPad Air 2"
    case iPad_Air_3rd_gen = "iPad Air (3rd generation)"
    case iPad_Air_4th_gen = "iPad Air (4th generation)"

    case iPad_2       = "iPad 2"
    case iPad_5th_gen = "iPad (5th generation)"
    case iPad_6th_gen = "iPad (6th generation)"
    case iPad_7th_gen = "iPad (7th generation)"
    case iPad_8th_gen = "iPad (8th generation)"
    case iPad_9th_gen = "iPad (9th generation)"

    case iPad_Retina = "iPad Retina"
    
    case iPad_Pro_9_7_inch = "iPad Pro (9.7-inch)"
    
    case iPad_Pro_10_5_inch = "iPad Pro (10.5-inch)"
    
    @available(*, unavailable, renamed: "iPad_Pro_11_inch_1st_gen")
    case iPad_Pro_11_inch         = "iPad_Pro_11_inch - do not use"
    case iPad_Pro_11_inch_1st_gen = "iPad Pro (11-inch) (1st generation)"
    case iPad_Pro_11_inch_2nd_gen = "iPad Pro (11-inch) (2nd generation)"
    case iPad_Pro_11_inch_3nd_gen = "iPad Pro (11-inch) (3nd generation)"

    @available(*, unavailable, renamed: "iPad_Pro_12_9_inch_1st_gen")
    case iPad_Pro_12_9_inch         = "iPad_Pro_12_9_inch - do not use"
    case iPad_Pro_12_9_inch_1st_gen = "iPad Pro (12.9-inch) (1st generation)"
    case iPad_Pro_12_9_inch_2nd_gen = "iPad Pro (12.9-inch) (2nd generation)"
    case iPad_Pro_12_9_inch_3rd_gen = "iPad Pro (12.9-inch) (3rd generation)"
    case iPad_Pro_12_9_inch_4th_gen = "iPad Pro (12.9-inch) (4th generation)"
    case iPad_Pro_12_9_inch_5th_gen = "iPad Pro (12.9-inch) (5th generation)"

    case Apple_TV                     = "Apple TV"
    case Apple_TV_4K                  = "Apple TV 4K"
    case Apple_TV_4K_2nd_gen          = "Apple TV 4K (2nd generation)"
    case Apple_TV_4K_at_1080p         = "Apple TV 4K (at 1080p)"
    case Apple_TV_4K_at_1080p_2nd_gen = "Apple TV 4K (at 1080p) (2nd generation)"

    case Apple_Watch_38mm = "Apple Watch - 38mm"
    case Apple_Watch_42mm = "Apple Watch - 42mm"
    
    case Apple_Watch_SE_40mm = "Apple Watch SE - 40mm"
    case Apple_Watch_SE_44mm = "Apple Watch SE - 44mm"

    case Apple_Watch_Series_2_38mm = "Apple Watch Series 2 - 38mm"
    case Apple_Watch_Series_2_42mm = "Apple Watch Series 2 - 42mm"
    case Apple_Watch_Series_3_38mm = "Apple Watch Series 3 - 38mm"
    case Apple_Watch_Series_3_42mm = "Apple Watch Series 3 - 42mm"
    case Apple_Watch_Series_4_40mm = "Apple Watch Series 4 - 40mm"
    case Apple_Watch_Series_4_44mm = "Apple Watch Series 4 - 44mm"
    case Apple_Watch_Series_5_40mm = "Apple Watch Series 5 - 40mm"
    case Apple_Watch_Series_5_44mm = "Apple Watch Series 5 - 44mm"
    case Apple_Watch_Series_6_40mm = "Apple Watch Series 6 - 40mm"
    case Apple_Watch_Series_6_44mm = "Apple Watch Series 6 - 44mm"
    case Apple_Watch_Series_7_41mm = "Apple Watch Series 7 - 41mm"
    case Apple_Watch_Series_7_45mm = "Apple Watch Series 7 - 45mm"

    public static var allCases: [PreviewDeviceName] = {
        var toReturn = [
            Mac,
            
            iPhone_4s,

            iPhone_5,
            iPhone_5s,
            
            iPhone_6,
            iPhone_6_Plus,
            iPhone_6s,
            iPhone_6s_Plus,

            iPhone_7,
            iPhone_7_Plus,
            
            iPhone_8,
            iPhone_8_Plus,
            
            iPhone_SE,
            
            iPhone_X,
            iPhone_XS,
            iPhone_XS_Max,
            iPhone_XR,
            
            iPhone_11,
            iPhone_11_Pro,
            iPhone_11_Pro_Max,

            iPhone_SE_1st_gen,
            iPhone_SE_2nd_gen,
            
            iPhone_12_mini,
            iPhone_12,
            iPhone_12_Pro,
            iPhone_12_Pro_Max,
            
            iPhone_13_mini,
            iPhone_13,
            iPhone_13_Pro,
            iPhone_13_Pro_Max,

            iPod_touch_7th_gen,
            
            iPad_mini_2,
            iPad_mini_3,
            iPad_mini_4,
            iPad_mini_5th_gen,
            iPad_mini_6th_gen,
            
            iPad_Air,
            iPad_Air_2,
            iPad_Air_3rd_gen,
            iPad_Air_4th_gen,

            iPad_2,
            iPad_5th_gen,
            iPad_6th_gen,
            iPad_7th_gen,
            iPad_8th_gen,
            iPad_9th_gen,

            iPad_Retina,
            
            iPad_Pro_9_7_inch,
            
            iPad_Pro_10_5_inch,
            
            iPad_Pro_11_inch_1st_gen,
            iPad_Pro_11_inch_2nd_gen,
            iPad_Pro_11_inch_3nd_gen,

            iPad_Pro_12_9_inch_1st_gen,
            iPad_Pro_12_9_inch_2nd_gen,
            iPad_Pro_12_9_inch_3rd_gen,
            iPad_Pro_12_9_inch_4th_gen,
            iPad_Pro_12_9_inch_5th_gen,

            Apple_TV,
            Apple_TV_4K,
            Apple_TV_4K_2nd_gen,
            Apple_TV_4K_at_1080p,
            Apple_TV_4K_at_1080p_2nd_gen,

            Apple_Watch_38mm,
            Apple_Watch_42mm,
            
            Apple_Watch_SE_40mm,
            Apple_Watch_SE_44mm,

            Apple_Watch_Series_2_38mm,
            Apple_Watch_Series_2_42mm,
            Apple_Watch_Series_3_38mm,
            Apple_Watch_Series_3_42mm,
            Apple_Watch_Series_4_40mm,
            Apple_Watch_Series_4_44mm,
            Apple_Watch_Series_5_40mm,
            Apple_Watch_Series_5_44mm,
            Apple_Watch_Series_6_40mm,
            Apple_Watch_Series_6_44mm,
            Apple_Watch_Series_7_41mm,
            Apple_Watch_Series_7_45mm,
        ]
        
        return toReturn
    }()
}

// MARK: ----- PREVIEW DEVICE


public extension View {
    
    func previewDevice(_ previewDeviceName: PreviewDeviceName) -> some View {
        previewDevice(previewDeviceName, displayName: previewDeviceName.rawValue)
    }

    func previewDevice(_ previewDeviceName: PreviewDeviceName, displayName: String) -> some View {
        previewDevice(PreviewDevice(rawValue: previewDeviceName.rawValue))
            .previewDisplayName(displayName)
    }
}

// MARK: ----- LAYOUT

public extension View {

    func previewSizeThatFits() -> some View {
        previewLayout(.sizeThatFits)
    }

    func previewFixedSize(_ size: CGSize) -> some View {
        previewLayout(.fixed(width: size.width, height: size.height))
    }

    func previewFixedSize(_ size: CGFloat) -> some View {
        previewLayout(.fixed(width: size, height: size.asCGFloat))
    }

    func previewFixedSize(_ x: CGFloat, _ y: CGFloat) -> some View {
        previewLayout(.fixed(width: x, height: y))
    }
}
