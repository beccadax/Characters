//
//  Characters+Streamable.swift
//  Characters
//
//  Created by Brent Royal-Gordon on 8/30/14.
//  Copyright (c) 2014 Groundbreaking Software. All rights reserved.
//

extension Characters/*: Streamable*/ {
    public func writeTo <Target: OutputStreamType>(inout target: Target) {
        string.writeTo(&target)
    }
}
