//
//  Text+Font.swift
//
//  Created by Adam Fordyce on 13/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

// MARK: ----- TEXT FONT

public extension Text {
  
    private func applyInternalFont(_ theFont: Font, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        font(theFont)
            .fontWeight(weight)
            .foregroundColor(color)
    }
    
    // BODY
    
    func bodyFont() -> Text {
        bodyFont(nil, nil)
    }
    
    func bodyFont(_ weight: Font.Weight? = nil) -> Text {
        bodyFont(nil, weight)
    }

    func bodyFont(_ color: Color? = nil) -> Text {
        bodyFont(color, nil)
    }

    func bodyFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.body, color, weight)
    }
    
    // CAPTION
    
    func captionFont() -> Text {
        captionFont(nil, nil)
    }
    
    func captionFont(_ weight: Font.Weight? = nil) -> Text {
        captionFont(nil, weight)
    }

    func captionFont(_ color: Color? = nil) -> Text {
        captionFont(color, nil)
    }

    func captionFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.caption, color, weight)
    }

    // CAPTION 2

    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    func caption2Font() -> Text {
        caption2Font(nil, nil)
    }

    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    func caption2Font(_ weight: Font.Weight? = nil) -> Text {
        caption2Font(nil, weight)
    }

    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    func caption2Font(_ color: Color? = nil) -> Text {
        caption2Font(color, nil)
    }

    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    func caption2Font(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.caption2, color, weight)
    }

    // CALLOUT
    
    func calloutFont() -> Text {
        calloutFont(nil, nil)
    }
    
    func calloutFont(_ weight: Font.Weight? = nil) -> Text {
        calloutFont(nil, weight)
    }

    func calloutFont(_ color: Color? = nil) -> Text {
        calloutFont(color, nil)
    }

    func calloutFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.callout, color, weight)
    }
    
    // CUSTOM
    
    func customFont(_ name: String, _ size: CGFloat) -> Text {
        customFont(name, size, nil, nil)
    }
    
    func customFont(_ name: String, _ size: CGFloat, _ weight: Font.Weight? = nil) -> Text {
        customFont(name, size, nil, weight)
    }

    func customFont(_ name: String, _ size: CGFloat, _ color: Color? = nil) -> Text {
        customFont(name, size, color, nil)
    }

    func customFont(_ name: String, _ size: CGFloat, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.custom(name, size: size), color, weight)
    }
    
    // CUSTOM WITH JUST SIZE
    
    func customFont(_ size: CGFloat) -> Text {
        customFont(size, nil, nil)
    }
    
    func customFont(_ size: CGFloat, _ weight: Font.Weight? = nil) -> Text {
        customFont(size, nil, weight)
    }

    func customFont(_ size: CGFloat, _ color: Color? = nil) -> Text {
        customFont(size, color, nil)
    }

    func customFont(_ size: CGFloat, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.system(size: size), color, weight)
    }
    
    // FOOTNOTE
    
    func footnoteFont() -> Text {
        footnoteFont(nil, nil)
    }
    
    func footnoteFont(_ weight: Font.Weight? = nil) -> Text {
        footnoteFont(nil, weight)
    }

    func footnoteFont(_ color: Color? = nil) -> Text {
        footnoteFont(color, nil)
    }

    func footnoteFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.footnote, color, weight)
    }
    
    // HEADLINE
    
    func headlineFont() -> Text {
        headlineFont(nil, nil)
    }
    
    func headlineFont(_ weight: Font.Weight? = nil) -> Text {
        headlineFont(nil, weight)
    }

    func headlineFont(_ color: Color? = nil) -> Text {
        headlineFont(color, nil)
    }

    func headlineFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.headline, color, weight)
    }
    
    // LARGETITLE
    
    func largeTitleFont() -> Text {
        largeTitleFont(nil, nil)
    }
    
    func largeTitleFont(_ weight: Font.Weight? = nil) -> Text {
        largeTitleFont(nil, weight)
    }

    func largeTitleFont(_ color: Color? = nil) -> Text {
        largeTitleFont(color, nil)
    }

    func largeTitleFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.largeTitle, color, weight)
    }
    
    // SUBHEADLINE
    
    func subheadlineFont() -> Text {
        subheadlineFont(nil, nil)
    }
    
    func subheadlineFont(_ weight: Font.Weight? = nil) -> Text {
        subheadlineFont(nil, weight)
    }

    func subheadlineFont(_ color: Color? = nil) -> Text {
        subheadlineFont(color, nil)
    }

    func subheadlineFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.subheadline, color, weight)
    }

    // TITLE
    
    func titleFont() -> Text {
        titleFont(nil, nil)
    }
    
    func titleFont(_ weight: Font.Weight? = nil) -> Text {
        titleFont(nil, weight)
    }

    func titleFont(_ color: Color? = nil) -> Text {
        titleFont(color, nil)
    }

    func titleFont(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.title, color, weight)
    }

    // TITLE 2

    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    func title2Font() -> Text {
        title2Font(nil, nil)
    }

    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    func title2Font(_ weight: Font.Weight? = nil) -> Text {
        title2Font(nil, weight)
    }

    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    func title2Font(_ color: Color? = nil) -> Text {
        title2Font(color, nil)
    }

    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    func title2Font(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.title2, color, weight)
    }

    // TITLE 3

    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    func title3Font() -> Text {
        title3Font(nil, nil)
    }

    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    func title3Font(_ weight: Font.Weight? = nil) -> Text {
        title3Font(nil, weight)
    }

    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    func title3Font(_ color: Color? = nil) -> Text {
        title3Font(color, nil)
    }

    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    func title3Font(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.title3, color, weight)
    }
}
