//
//  RoundedRectangle+.swift
//  
//
//  Created by Adam Fordyce on 10/12/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public extension RoundedRectangle {
    
    init<T: UINumericType>(_ cornerRadius: T, style: RoundedCornerStyle = .circular) {
        self.init(cornerRadius: cornerRadius.asCGFloat, style: style)
    }

    init(_ cornerSize: CGSize, style: RoundedCornerStyle = .circular) {
        self.init(cornerSize: cornerSize, style: style)
    }
    
    init<TW: UINumericType, TH: UINumericType>(_ cornerWidth: TW, _ cornerHeight: TH, style: RoundedCornerStyle = .circular) {
        self.init(cornerSize: .init(cornerWidth, cornerHeight), style: style)
    }
}
