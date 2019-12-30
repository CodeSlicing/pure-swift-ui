//
//  TextFontTypes.swift
//  
//
//  Created by Adam Fordyce on 27/12/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import SwiftUI

// MARK: ----- BODY

public func BodyText<S: StringProtocol>(_ content: S) -> Text {
    BodyText(content, nil, nil)
}

public func BodyText<S: StringProtocol>(_ content: S, _ color: Color? = nil) -> Text {
    BodyText(content, color, nil)
}

public func BodyText<S: StringProtocol>(_ content: S, _ weight: Font.Weight? = nil) -> Text {
    BodyText(content, nil, weight)
}

public func BodyText<S: StringProtocol>(_ content: S, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
    Text(content)
        .font(.body)
        .foregroundColor(color)
        .fontWeight(weight)
}

// MARK: ----- CALLOUT

public func CalloutText<S: StringProtocol>(_ content: S) -> Text {
    CalloutText(content, nil, nil)
}

public func CalloutText<S: StringProtocol>(_ content: S, _ color: Color? = nil) -> Text {
    CalloutText(content, color, nil)
}

public func CalloutText<S: StringProtocol>(_ content: S, _ weight: Font.Weight? = nil) -> Text {
    CalloutText(content, nil, weight)
}

public func CalloutText<S: StringProtocol>(_ content: S, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
    Text(content)
        .font(.callout)
        .foregroundColor(color)
        .fontWeight(weight)
}

// MARK: ----- CAPTION

public func CaptionText<S: StringProtocol>(_ content: S) -> Text {
    CaptionText(content, nil, nil)
}

public func CaptionText<S: StringProtocol>(_ content: S, _ color: Color? = nil) -> Text {
    CaptionText(content, color, nil)
}

public func CaptionText<S: StringProtocol>(_ content: S, _ weight: Font.Weight? = nil) -> Text {
    CaptionText(content, nil, weight)
}

public func CaptionText<S: StringProtocol>(_ content: S, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
    Text(content)
        .font(.caption)
        .foregroundColor(color)
        .fontWeight(weight)
}

// MARK: ----- FOOTNOTE

public func FootnoteText<S: StringProtocol>(_ content: S) -> Text {
    FootnoteText(content, nil, nil)
}

public func FootnoteText<S: StringProtocol>(_ content: S, _ color: Color? = nil) -> Text {
    FootnoteText(content, color, nil)
}

public func FootnoteText<S: StringProtocol>(_ content: S, _ weight: Font.Weight? = nil) -> Text {
    FootnoteText(content, nil, weight)
}

public func FootnoteText<S: StringProtocol>(_ content: S, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
    Text(content)
        .font(.footnote)
        .foregroundColor(color)
        .fontWeight(weight)
}

// MARK: ----- HEADLINE

public func HeadlineText<S: StringProtocol>(_ content: S) -> Text {
    HeadlineText(content, nil, nil)
}

public func HeadlineText<S: StringProtocol>(_ content: S, _ color: Color? = nil) -> Text {
    HeadlineText(content, color, nil)
}

public func HeadlineText<S: StringProtocol>(_ content: S, _ weight: Font.Weight? = nil) -> Text {
    HeadlineText(content, nil, weight)
}

public func HeadlineText<S: StringProtocol>(_ content: S, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
    Text(content)
        .font(.headline)
        .foregroundColor(color)
        .fontWeight(weight)
}

// MARK: ----- LARGETITLE

public func LargeTitleText<S: StringProtocol>(_ content: S) -> Text {
    LargeTitleText(content, nil, nil)
}

public func LargeTitleText<S: StringProtocol>(_ content: S, _ color: Color? = nil) -> Text {
    LargeTitleText(content, color, nil)
}

public func LargeTitleText<S: StringProtocol>(_ content: S, _ weight: Font.Weight? = nil) -> Text {
    LargeTitleText(content, nil, weight)
}

public func LargeTitleText<S: StringProtocol>(_ content: S, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
    Text(content)
        .font(.largeTitle)
        .foregroundColor(color)
        .fontWeight(weight)
}

// MARK: ----- SUBHEADLINE

public func SubheadlineText<S: StringProtocol>(_ content: S) -> Text {
    SubheadlineText(content, nil, nil)
}

public func SubheadlineText<S: StringProtocol>(_ content: S, _ color: Color? = nil) -> Text {
    SubheadlineText(content, color, nil)
}

public func SubheadlineText<S: StringProtocol>(_ content: S, _ weight: Font.Weight? = nil) -> Text {
    SubheadlineText(content, nil, weight)
}

public func SubheadlineText<S: StringProtocol>(_ content: S, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
    Text(content)
        .font(.subheadline)
        .foregroundColor(color)
        .fontWeight(weight)
}

// MARK: ----- TITLE

public func TitleText<S: StringProtocol>(_ content: S) -> Text {
    TitleText(content, nil, nil)
}

public func TitleText<S: StringProtocol>(_ content: S, _ color: Color? = nil) -> Text {
    TitleText(content, color, nil)
}

public func TitleText<S: StringProtocol>(_ content: S, _ weight: Font.Weight? = nil) -> Text {
    TitleText(content, nil, weight)
}

public func TitleText<S: StringProtocol>(_ content: S, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
    Text(content)
        .font(.title)
        .foregroundColor(color)
        .fontWeight(weight)
}

