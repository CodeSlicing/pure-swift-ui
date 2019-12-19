//
//  UIImage+SFSymbol.swift
//  
//
//  Created by Adam Fordyce on 15/12/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import UIKit

public extension UIImage {
    
    convenience init?(sfSymbol: SFSymbolName) {
        self.init(systemName: sfSymbol.rawValue)
    }
}
