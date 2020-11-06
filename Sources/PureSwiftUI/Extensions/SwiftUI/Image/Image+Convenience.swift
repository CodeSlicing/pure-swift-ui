//
//  Image+Convenience.swift
//
//  Created by Adam Fordyce on 20/12/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

// MARK: ----- RESIZED TO FIT

public extension Image {

    func resizedToFit(capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizable(capInsets: capInsets)
            .scaledToFit()
    }

    func resizedToFit(_ size: CGFloat, _ alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFit(capInsets: capInsets)
            .frame(size, alignment)
    }
    
    func resizedToFit(width: CGFloat, _ alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFit(capInsets: capInsets)
            .width(width, alignment)
    }
    
    func resizedToFit(height: CGFloat, _ alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFit(capInsets: capInsets)
            .height(height, alignment)
    }
    
    func resizedToFit(_ width: CGFloat, _ height: CGFloat, _ alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFit(capInsets: capInsets)
            .frame(width, height, alignment)
    }
    
    func resizedToFit(_ size: CGSize, _ alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFit(capInsets: capInsets)
            .frame(size, alignment)
        
    }
}

// MARK: ----- RESIZED TO FILL

public extension Image {
    
    func resizedToFill(capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizable(capInsets: capInsets)
            .scaledToFill()
    }
    
    func resizedToFill(_ size: CGFloat, _ alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFill(capInsets: capInsets)
            .frame(size, alignment)
    }
    
    func resizedToFill(width: CGFloat, _ alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFill(capInsets: capInsets)
            .width(width, alignment)
    }
    
    func resizedToFill(height: CGFloat, _ alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFill(capInsets: capInsets)
            .height(height, alignment)
    }

    func resizedToFill(_ width: CGFloat, _ height: CGFloat, _ alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFill(capInsets: capInsets)
            .frame(width, height, alignment)
    }
    
    func resizedToFill(_ size: CGSize, _ alignment: Alignment = .center, capInsets: EdgeInsets = EdgeInsets()) -> some View {
        resizedToFill(capInsets: capInsets)
            .frame(size, alignment)
    }
}
