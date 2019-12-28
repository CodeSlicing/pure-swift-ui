//
//  Text+Font.swift
//
//  Created by Adam Fordyce on 13/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

// MARK: ----- TEXT FONT

public extension Text {
  
    // BODY
    
    func body() -> Text {
        body(nil, nil)
    }
    
    func body(_ weight: Font.Weight? = nil) -> Text {
        body(nil, weight)
    }

    func body(_ color: Color? = nil) -> Text {
        body(color, nil)
    }

    func body(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        font(.body)
            .fontWeight(weight)
            .foregroundColor(color)
    }
    
    // CALLOUT
    
    func callout() -> Text {
        callout(nil, nil)
    }
    
    func callout(_ weight: Font.Weight? = nil) -> Text {
        callout(nil, weight)
    }

    func callout(_ color: Color? = nil) -> Text {
        callout(color, nil)
    }

    func callout(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        font(.callout)
            .fontWeight(weight)
            .foregroundColor(color)
    }
    
    // CAPTION
    
    func caption() -> Text {
        caption(nil, nil)
    }
    
    func caption(_ weight: Font.Weight? = nil) -> Text {
        caption(nil, weight)
    }

    func caption(_ color: Color? = nil) -> Text {
        caption(color, nil)
    }

    func caption(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        font(.caption)
            .fontWeight(weight)
            .foregroundColor(color)
    }
    
    // FOOTNOTE
    
    func footnote() -> Text {
        footnote(nil, nil)
    }
    
    func footnote(_ weight: Font.Weight? = nil) -> Text {
        footnote(nil, weight)
    }

    func footnote(_ color: Color? = nil) -> Text {
        footnote(color, nil)
    }

    func footnote(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        font(.footnote)
            .fontWeight(weight)
            .foregroundColor(color)
    }
    
    // HEADLINE
    
    func headline() -> Text {
        headline(nil, nil)
    }
    
    func headline(_ weight: Font.Weight? = nil) -> Text {
        headline(nil, weight)
    }

    func headline(_ color: Color? = nil) -> Text {
        headline(color, nil)
    }

    func headline(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        font(.headline)
            .fontWeight(weight)
            .foregroundColor(color)
    }
    
    // LARGETITLE
    
    func largeTitle() -> Text {
        largeTitle(nil, nil)
    }
    
    func largeTitle(_ weight: Font.Weight? = nil) -> Text {
        largeTitle(nil, weight)
    }

    func largeTitle(_ color: Color? = nil) -> Text {
        largeTitle(color, nil)
    }

    func largeTitle(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        font(.largeTitle)
            .fontWeight(weight)
            .foregroundColor(color)
    }
    
    // SUBHEADLINE
    
    func subheadline() -> Text {
        subheadline(nil, nil)
    }
    
    func subheadline(_ weight: Font.Weight? = nil) -> Text {
        subheadline(nil, weight)
    }

    func subheadline(_ color: Color? = nil) -> Text {
        subheadline(color, nil)
    }

    func subheadline(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        font(.subheadline)
            .fontWeight(weight)
            .foregroundColor(color)
    }

    // TITLE
    
    func title() -> Text {
        title(nil, nil)
    }
    
    func title(_ weight: Font.Weight? = nil) -> Text {
        title(nil, weight)
    }

    func title(_ color: Color? = nil) -> Text {
        title(color, nil)
    }

    func title(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        font(.title)
            .fontWeight(weight)
            .foregroundColor(color)
    }
}

// MARK: ----- ALIGNMENT

public extension Text {
    
    func align(_ alignment: TextAlignment) -> some View {
        multilineTextAlignment(alignment)
    }
}
