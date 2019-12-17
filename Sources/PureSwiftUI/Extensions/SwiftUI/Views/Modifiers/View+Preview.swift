//
//  File.swift
//  
//
//  Created by NTB on 16/12/2019.
//

import SwiftUI

public enum PreviewDeviceName: String, CaseIterable {

    case mac = "Mac"
    case iphone_7 = "iPhone 7"
    case iphone_7_plus = "iPhone 7 Plus"
    case iphone_8 = "iPhone 8"
    case iphone_8_plus = "iPhone 8 Plus"
    case iphone_se = "iPhone SE"
    case iphone_x = "iPhone X"
    case iphone_xs = "iPhone Xs"
    case iphone_xs_max = "iPhone Xs Max"
    case iphone_xr = "iPhone Xʀ"
    case ipad_mini_4 = "iPad mini 4"
    case ipad_air_2 = "iPad Air 2"
    case ipad_pro_9_7_inch = "iPad Pro (9.7-inch)"
    case ipad_pro_12_9_inch = "iPad Pro (12.9-inch)"
    case ipad_5th_gen = "iPad (5th generation)"
    case ipad_pro_12_9_inch_2nd_gen = "iPad Pro (12.9-inch) (2nd generation)"
    case ipad_pro_10_5_inch = "iPad Pro (10.5-inch)"
    case ipad_6th_gen = "iPad (6th generation)"
    case ipad_pro_11_inch = "iPad Pro (11-inch)"
    case ipad_pro_12_9_inch_3rd_gen = "iPad Pro (12.9-inch) (3rd generation)"
    case ipad_mini_5th_gen = "iPad mini (5th generation)"
    case ipad_air_3rd_gen = "iPad Air (3rd generation)"
    case apple_tv = "Apple TV"
    case apple_tv_4k = "Apple TV 4K"
    case apple_tv_4k_at_1080p = "Apple TV 4K (at 1080p)"
    case apple_watch_series_2_38mm = "Apple Watch Series 2 - 38mm"
    case apple_watch_series_2_42mm = "Apple Watch Series 2 - 42mm"
    case apple_watch_series_3_38mm = "Apple Watch Series 3 - 38mm"
    case apple_watch_series_3_42mm = "Apple Watch Series 3 - 42mm"
    case apple_watch_series_4_40mm = "Apple Watch Series 4 - 40mm"
    case apple_watch_series_4_44mm = "Apple Watch Series 4 - 44mm"
}

public extension View {
    
    func previewDevice(_ previewDeviceName: PreviewDeviceName) -> some View {
        previewDevice(previewDeviceName, displayName: previewDeviceName.rawValue)
    }

    func previewDevice(_ previewDeviceName: PreviewDeviceName, displayName: String) -> some View {
        previewDevice(PreviewDevice(rawValue: previewDeviceName.rawValue))
            .previewDisplayName(displayName)
    }
}
