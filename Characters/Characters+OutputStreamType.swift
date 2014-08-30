//
//  Characters+OutputStreamType.swift
//  Characters
//
//  Created by Brent Royal-Gordon on 8/30/14.
//  Copyright (c) 2014 Groundbreaking Software. All rights reserved.
//

extension Characters/*: OutputStreamType*/ {
    public mutating func write(string: String) {
        self.string.write(string)
    }
}
