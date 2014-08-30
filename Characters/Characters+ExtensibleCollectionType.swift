//
//  Characters+ExtensibleCollectionType.swift
//  Characters
//
//  Created by Brent Royal-Gordon on 8/30/14.
//  Copyright (c) 2014 Groundbreaking Software. All rights reserved.
//

extension Characters/*: ExtensibleCollectionType*/ {
    public init() {
        self.init("")
    }
    
    public mutating func reserveCapacity(n: Int) {
        string.reserveCapacity(n)
    }
    
    public mutating func append(char: Character) {
        string.append(char)
    }
    
    public mutating func extend<S : SequenceType where S.Generator.Element == Character>(seq: S) {
        string.extend(seq)
    }
}