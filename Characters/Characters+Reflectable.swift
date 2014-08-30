//
//  Characters+Reflectable.swift
//  Characters
//
//  Created by Brent Royal-Gordon on 8/30/14.
//  Copyright (c) 2014 Groundbreaking Software. All rights reserved.
//

extension Characters/*: Reflectable*/ {
    public func getMirror() -> MirrorType {
        return string.getMirror()
    }
}