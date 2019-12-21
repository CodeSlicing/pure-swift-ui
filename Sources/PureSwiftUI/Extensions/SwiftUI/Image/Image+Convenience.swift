//
//  Image+Convenience.swift
//
//  Created by Adam Fordyce on 20/12/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public extension Image {

    func resizedToFit(capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizable(capInsets: capInsets)
            .scaledToFit()
    }

    func resizedToFit<T: UINumericType>(width: T, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFit(capInsets: capInsets)
            .width(width)
    }
    
    func resizedToFit<T: UINumericType>(height: T, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFit(capInsets: capInsets)
            .height(height)
    }
    
    func resizedToFit<TW: UINumericType, TH: UINumericType>(_ width: TW, _ height: TH, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFit(capInsets: capInsets)
            .frame(width, height)
    }

    func resizedToFill(capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizable(capInsets: capInsets)
            .scaledToFill()
    }
    
    func resizedToFill<T: UINumericType>(width: T, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFill(capInsets: capInsets)
            .width(width)
    }
    
    func resizedToFill<T: UINumericType>(height: T, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFill(capInsets: capInsets)
            .height(height)
    }

    func resizedToFill<TW: UINumericType, TH: UINumericType>(_ width: TW, _ height: TH, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFill(capInsets: capInsets)
            .frame(width, height)
    }
}
