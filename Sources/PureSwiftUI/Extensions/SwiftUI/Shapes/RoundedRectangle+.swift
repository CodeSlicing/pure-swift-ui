//
//  RoundedRectangle+.swift
//  
//
//  Created by Adam Fordyce on 10/12/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public extension RoundedRectangle {
    
    init(_ cornerRadius: CGFloat, style: RoundedCornerStyle = .circular) {
        self.init(cornerRadius: cornerRadius, style: style)
    }

    init(_ cornerSize: CGSize, style: RoundedCornerStyle = .circular) {
        self.init(cornerSize: cornerSize, style: style)
    }
    
    init(_ cornerWidth: CGFloat, _ cornerHeight: CGFloat, style: RoundedCornerStyle = .circular) {
        self.init(cornerSize: .init(cornerWidth, cornerHeight), style: style)
    }
}
