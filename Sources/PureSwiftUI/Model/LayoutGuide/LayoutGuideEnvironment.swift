//
//  LayoutGuideEnvironment.swift
//
//
//  Created by Adam Fordyce on 04/02/2020.
//  Copyright © 2020 Adam Fordyce. All rights reserved.
//

import SwiftUI

public struct ShowLayoutGuidesKey: EnvironmentKey {
    public static let defaultValue: Bool = false
}

public extension EnvironmentValues {
    var showLayoutGuides: Bool {
        get {
            self[ShowLayoutGuidesKey.self]
        }
        set {
            self[ShowLayoutGuidesKey.self] = newValue
        }
    }
}

public struct ShowControlPoints: EnvironmentKey {
    public static let defaultValue: Bool = false
}

public extension EnvironmentValues {
    var showControlPoints: Bool {
        get {
            self[ShowControlPoints.self]
        }
        set {
            self[ShowControlPoints.self] = newValue
        }
    }
}

// MARK: ----- VIEW EXTENSIONS

public extension View {
    
    func showLayoutGuides(_ value: Bool) -> some View {
        environment(\.showLayoutGuides, value)
    }
    
    func showControlPoints(_ value: Bool) -> some View {
        environment(\.showControlPoints, value)
    }
}
