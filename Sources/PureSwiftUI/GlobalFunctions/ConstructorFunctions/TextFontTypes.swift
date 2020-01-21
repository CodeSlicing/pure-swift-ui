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
        .bodyFont(color, weight)
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
        .calloutFont(color, weight)
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
        .captionFont(color, weight)
}

// MARK: ----- CUSTOM

public func CustomText<S: StringProtocol, T: UINumericType>(_ content: S, _ name: String, _ size: T) -> Text {
    CustomText(content, name, size, nil, nil)
}

public func CustomText<S: StringProtocol, T: UINumericType>(_ content: S, _ name: String, _ size: T, _ weight: Font.Weight? = nil) -> Text {
    CustomText(content, name, size, nil, weight)
}

public func CustomText<S: StringProtocol, T: UINumericType>(_ content: S, _ name: String, _ size: T, _ color: Color? = nil) -> Text {
    CustomText(content, name, size, color, nil)
}

public func CustomText<S: StringProtocol, T: UINumericType>(_ content: S, _ name: String, _ size: T, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
    Text(content)
        .customFont(name, size, color, weight)
}

// CUSTOM FONT THAT SCALES

public func CustomTextThatScales<S: StringProtocol, T: UINumericType>(_ content: S, _ name: String, _ size: T) -> some View {
    CustomTextThatScales(content, name, size, nil, nil)
}

public func CustomTextThatScales<S: StringProtocol, T: UINumericType>(_ content: S, _ name: String, _ size: T, _ weight: Font.Weight? = nil) -> some View {
    CustomTextThatScales(content, name, size, nil, weight)
}

public func CustomTextThatScales<S: StringProtocol, T: UINumericType>(_ content: S, _ name: String, _ size: T, _ color: Color? = nil) -> some View {
    CustomTextThatScales(content, name, size, color, nil)
}

public func CustomTextThatScales<S: StringProtocol, T: UINumericType>(_ content: S, _ name: String, _ size: T, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
    Text(content)
        .customFontThatScales(name, size, color, weight)
}

// MARK: ----- CUSTOM WITH SIZE

public func CustomText<S: StringProtocol, T: UINumericType>(_ content: S, _ size: T) -> Text {
    CustomText(content, size, nil, nil)
}

public func CustomText<S: StringProtocol, T: UINumericType>(_ content: S, _ size: T, _ weight: Font.Weight? = nil) -> Text {
    CustomText(content, size, nil, weight)
}

public func CustomText<S: StringProtocol, T: UINumericType>(_ content: S, _ size: T, _ color: Color? = nil) -> Text {
    CustomText(content, size, color, nil)
}

public func CustomText<S: StringProtocol, T: UINumericType>(_ content: S, _ size: T, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> Text {
        Text(content)
            .customFont(size, color, weight)
}

// CUSTOM FONT SIZE THAT SCALES

public func CustomTextThatScales<S: StringProtocol, T: UINumericType>(_ content: S, _ size: T) -> some View {
    CustomTextThatScales(content, size, nil, nil)
}

public func CustomTextThatScales<S: StringProtocol, T: UINumericType>(_ content: S, _ size: T, _ weight: Font.Weight? = nil) -> some View {
    CustomTextThatScales(content, size, nil, weight)
}

public func CustomTextThatScales<S: StringProtocol, T: UINumericType>(_ content: S, _ size: T, _ color: Color? = nil) -> some View {
    CustomTextThatScales(content, size, color, nil)
}

public func CustomTextThatScales<S: StringProtocol, T: UINumericType>(_ content: S, _ size: T, _ color: Color? = nil, _ weight: Font.Weight? = nil) -> some View {
        Text(content)
            .customFontThatScales(size, color, weight)
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
        .footnoteFont(color, weight)
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
        .headlineFont(color, weight)
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
        .largeTitleFont(color, weight)
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
        .subheadlineFont(color, weight)
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
        .titleFont(color, weight)
}

