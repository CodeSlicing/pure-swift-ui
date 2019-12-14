//
//  UINumericType.swift
//  
//
//  Created by Adam Fordyce on 19/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import CoreGraphics

public protocol UINumericType: RepresentableAsCGFloat, RepresentableAsInt, RepresentableAsDouble, RepresentableAsFloat {}

extension Int: UINumericType {}
extension Float: UINumericType {}
extension Double: UINumericType {}
extension CGFloat: UINumericType {}

