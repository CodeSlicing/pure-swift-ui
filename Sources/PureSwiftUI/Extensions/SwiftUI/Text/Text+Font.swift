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
    
    func customFont<T: UINumericType>(_ name: String, _ size: T) -> Text {
        customFont(name, size, nil, nil)
    }
    
    func customFont<T: UINumericType>(_ name: String, _ size: T, _ weight: Font.Weight? = nil) -> Text {
        customFont(name, size, nil, weight)
    }

    func customFont<T: UINumericType>(_ name: String, _ size: T, _ color: Color? = nil) -> Text {
        customFont(name, size, color, nil)
    }

    func customFont<T: UINumericType>(_ name: String, _ size: T, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.custom(name, size: size.asCGFloat), color, weight)
    }
    
    // CUSTOM WITH JUST SIZE
    
    func customFont<T: UINumericType>(_ size: T) -> Text {
        customFont(size, nil, nil)
    }
    
    func customFont<T: UINumericType>(_ size: T, _ weight: Font.Weight? = nil) -> Text {
        customFont(size, nil, weight)
    }

    func customFont<T: UINumericType>(_ size: T, _ color: Color? = nil) -> Text {
        customFont(size, color, nil)
    }

    func customFont<T: UINumericType>(_ size: T, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.system(size: size.asCGFloat), color, weight)
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
}

// MARK: ----- TEXT FONT DEPRECATED

public extension Text {
    
    // BODY
    
    @available(*, deprecated, renamed: "bodyFont")
    func body() -> Text {
        body(nil, nil)
    }
    
    @available(*, deprecated, renamed: "bodyFont")
    func body(_ weight: Font.Weight? = nil) -> Text {
        body(nil, weight)
    }

    @available(*, deprecated, renamed: "bodyFont")
    func body(_ color: Color? = nil) -> Text {
        body(color, nil)
    }

    @available(*, deprecated, renamed: "bodyFont")
    func body(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.body, color, weight)
    }
    
    // CALLOUT
    
    @available(*, deprecated, renamed: "calloutFont")
    func callout() -> Text {
        callout(nil, nil)
    }
    
    @available(*, deprecated, renamed: "calloutFont")
    func callout(_ weight: Font.Weight? = nil) -> Text {
        callout(nil, weight)
    }

    @available(*, deprecated, renamed: "calloutFont")
    func callout(_ color: Color? = nil) -> Text {
        callout(color, nil)
    }

    @available(*, deprecated, renamed: "calloutFont")
    func callout(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.callout, color, weight)
    }
    
    // CAPTION
    
    @available(*, deprecated, renamed: "captionFont")
    func caption() -> Text {
        caption(nil, nil)
    }
    
    @available(*, deprecated, renamed: "captionFont")
    func caption(_ weight: Font.Weight? = nil) -> Text {
        caption(nil, weight)
    }

    @available(*, deprecated, renamed: "captionFont")
    func caption(_ color: Color? = nil) -> Text {
        caption(color, nil)
    }

    @available(*, deprecated, renamed: "captionFont")
    func caption(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.caption, color, weight)
    }
    
    // FOOTNOTE
    
    @available(*, deprecated, renamed: "footnoteFont")
    func footnote() -> Text {
        footnote(nil, nil)
    }
    
    @available(*, deprecated, renamed: "footnoteFont")
    func footnote(_ weight: Font.Weight? = nil) -> Text {
        footnote(nil, weight)
    }

    @available(*, deprecated, renamed: "footnoteFont")
    func footnote(_ color: Color? = nil) -> Text {
        footnote(color, nil)
    }

    @available(*, deprecated, renamed: "footnoteFont")
    func footnote(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.footnote, color, weight)
    }
    
    // HEADLINE
    
    @available(*, deprecated, renamed: "headlineFont")
    func headline() -> Text {
        headline(nil, nil)
    }
    
    @available(*, deprecated, renamed: "headlineFont")
    func headline(_ weight: Font.Weight? = nil) -> Text {
        headline(nil, weight)
    }

    @available(*, deprecated, renamed: "headlineFont")
    func headline(_ color: Color? = nil) -> Text {
        headline(color, nil)
    }

    @available(*, deprecated, renamed: "headlineFont")
    func headline(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.headline, color, weight)
    }
    
    // LARGETITLE
    
    @available(*, deprecated, renamed: "largeTitleFont")
    func largeTitle() -> Text {
        largeTitle(nil, nil)
    }
    
    @available(*, deprecated, renamed: "largeTitleFont")
    func largeTitle(_ weight: Font.Weight? = nil) -> Text {
        largeTitle(nil, weight)
    }

    @available(*, deprecated, renamed: "largeTitleFont")
    func largeTitle(_ color: Color? = nil) -> Text {
        largeTitle(color, nil)
    }

    @available(*, deprecated, renamed: "largeTitleFont")
    func largeTitle(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.largeTitle, color, weight)
    }
    
    // SUBHEADLINE
    
    @available(*, deprecated, renamed: "subheadlineFont")
    func subheadline() -> Text {
        subheadline(nil, nil)
    }
    
    @available(*, deprecated, renamed: "subheadlineFont")
    func subheadline(_ weight: Font.Weight? = nil) -> Text {
        subheadline(nil, weight)
    }

    @available(*, deprecated, renamed: "subheadlineFont")
    func subheadline(_ color: Color? = nil) -> Text {
        subheadline(color, nil)
    }

    @available(*, deprecated, renamed: "subheadlineFont")
    func subheadline(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {        applyInternalFont(.subheadline, color, weight)
    }

    // TITLE
    
    @available(*, deprecated, renamed: "titleFont")
    func title() -> Text {
        title(nil, nil)
    }
    
    @available(*, deprecated, renamed: "titleFont")
    func title(_ weight: Font.Weight? = nil) -> Text {
        title(nil, weight)
    }

    @available(*, deprecated, renamed: "titleFont")
    func title(_ color: Color? = nil) -> Text {
        title(color, nil)
    }

    @available(*, deprecated, renamed: "titleFont")
    func title(_ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        applyInternalFont(.title, color, weight)
    }
}
