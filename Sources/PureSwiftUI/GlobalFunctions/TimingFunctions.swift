//
//  TimingFunctions.swift
//  
//
//  Created by Adam Fordyce on 09/11/2019.
//  Copyright © 2019 Adam Fordyce. All rights reserved.
//

import Foundation

@discardableResult
public func after(_ time: Double, action: @escaping () -> ()) -> Timer {
    Timer.scheduledTimer(withTimeInterval: time, repeats: false) { timer in
        action()
        timer.invalidate()
    }
}

@discardableResult
public func after(_ time: Double, action: @escaping (Timer) -> ()) -> Timer {
    Timer.scheduledTimer(withTimeInterval: time, repeats: false) { timer in
        action(timer)
        timer.invalidate()
    }
}

@discardableResult
public func every(_ interval: Double, action: @escaping () -> ()) -> Timer {
    Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
        action()
    }
}

@discardableResult
public func every(_ interval: Double, action: @escaping (Timer) -> ()) -> Timer {
    Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
        action(timer)
    }
}
