//
//  Characters+Sliceable.swift
//  Characters
//
//  Created by Brent Royal-Gordon on 8/30/14.
//  Copyright (c) 2014 Groundbreaking Software. All rights reserved.
//

extension Characters/*: Sliceable*/ {
    typealias SubSlice = Characters
    typealias Index = Int
    public subscript(range: Range<Int>) -> Characters {
        get {
            return string[stringRange(range)].characters
        }
    }
}
