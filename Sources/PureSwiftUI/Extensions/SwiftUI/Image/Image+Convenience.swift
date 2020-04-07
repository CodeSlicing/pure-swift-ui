//
//  Image+Convenience.swift
//
//  Created by Adam Fordyce on 20/12/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

// MARK: ----- RESIZED TO FIT

public extension Image {

    @inlinable
    func resizedToFit(capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizable(capInsets: capInsets)
            .scaledToFit()
    }

    @inlinable
    func resizedToFit<T: UINumericType>(_ size: T, _ alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFit(capInsets: capInsets)
            .frame(size, alignment)
    }
    
    @inlinable
    func resizedToFit<T: UINumericType>(width: T, _ alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFit(capInsets: capInsets)
            .width(width, alignment)
    }
    
    @inlinable
    func resizedToFit<T: UINumericType>(height: T, _ alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFit(capInsets: capInsets)
            .height(height, alignment)
    }
    
    @inlinable
    func resizedToFit<TW: UINumericType, TH: UINumericType>(_ width: TW, _ height: TH, _ alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFit(capInsets: capInsets)
            .frame(width, height, alignment)
    }
    
    @inlinable
    func resizedToFit(_ size: CGSize, _ alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFit(capInsets: capInsets)
            .frame(size, alignment)
        
    }
}

// MARK: ----- RESIZED TO FILL

public extension Image {
    
    @inlinable
    func resizedToFill(capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizable(capInsets: capInsets)
            .scaledToFill()
    }
    
    @inlinable
    func resizedToFill<T: UINumericType>(_ size: T, _ alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFill(capInsets: capInsets)
            .frame(size, alignment)
    }
    
    @inlinable
    func resizedToFill<T: UINumericType>(width: T, _ alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFill(capInsets: capInsets)
            .width(width, alignment)
    }
    
    @inlinable
    func resizedToFill<T: UINumericType>(height: T, _ alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFill(capInsets: capInsets)
            .height(height, alignment)
    }

    @inlinable
    func resizedToFill<TW: UINumericType, TH: UINumericType>(_ width: TW, _ height: TH, _ alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFill(capInsets: capInsets)
            .frame(width, height, alignment)
    }
    
    @inlinable
    func resizedToFill(_ size: CGSize, _ alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFill(capInsets: capInsets)
            .frame(size, alignment)
    }
}
