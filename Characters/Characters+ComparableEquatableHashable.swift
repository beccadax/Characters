//
//  Characters+Equatable.swift
//  Characters
//
//  Created by Brent Royal-Gordon on 8/30/14.
//  Copyright (c) 2014 Groundbreaking Software. All rights reserved.
//

extension Characters/*: Equatable, Comparable, Hashable*/ {
    public var hashValue: Int {
        return string.hashValue
    }
}

public func == (lhs: Characters, rhs: Characters) -> Bool {
    return lhs.string == rhs.string
}

public func < (lhs: Characters, rhs: Characters) -> Bool {
    return lhs.string < rhs.string
}
