//
//  Text+Font.swift
//
//  Created by Adam Fordyce on 13/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

public extension Text {
  
    func title(_ weight: Font.Weight? = nil) -> Text {
        title(nil, weight)
    }
    
    func title(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        font(.title)
            .fontWeight(weight)
            .foregroundColor(color)
    }
    
    func largeTitle(_ weight: Font.Weight? = nil) -> Text {
        largeTitle(nil, weight)
    }

    func largeTitle(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        font(.largeTitle)
            .fontWeight(weight)
            .foregroundColor(color)
    }
    
    func body(_ weight: Font.Weight? = nil) -> Text {
        body(nil, weight)
    }
    
    func body(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        font(.body)
            .fontWeight(weight)
            .foregroundColor(color)
    }
    
    func callout(_ weight: Font.Weight? = nil) -> Text {
        callout(nil, weight)
    }
    
    func callout(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        font(.callout)
            .fontWeight(weight)
            .foregroundColor(color)
    }
    
    func caption(_ weight: Font.Weight? = nil) -> Text {
        caption(nil, weight)
    }
    
    func caption(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        font(.caption)
            .fontWeight(weight)
            .foregroundColor(color)
    }
    
    func footnote(_ weight: Font.Weight? = nil) -> Text {
        footnote(nil, weight)
    }
    
    func footnote(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        font(.footnote)
            .fontWeight(weight)
            .foregroundColor(color)
    }
    
    func headline(_ weight: Font.Weight? = nil) -> Text {
        headline(nil, weight)
    }
    
    func headline(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        font(.headline)
            .fontWeight(weight)
            .foregroundColor(color)
    }
    
    func subheadline(_ weight: Font.Weight? = nil) -> Text {
        subheadline(nil, weight)
    }
    
    func subheadline(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        font(.subheadline)
            .fontWeight(weight)
            .foregroundColor(color)
    }
}
