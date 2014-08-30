//
//  Characters+RangeReplaceableCollectionType.swift
//  Characters
//
//  Created by Brent Royal-Gordon on 8/30/14.
//  Copyright (c) 2014 Groundbreaking Software. All rights reserved.
//

extension Characters/*: RangeReplaceableCollectionType*/ {
    public mutating func replaceRange<C : CollectionType where C.Generator.Element == Character>(subRange: Range<Int>, with newValues: C) {
        string.replaceRange(stringRange(subRange), with: newValues)
    }
    
    public mutating func insert(newElement: Character, atIndex i: Int) {
        string.insert(newElement, atIndex: stringIndex(i))
    }
    
    public mutating func splice<S : CollectionType where S.Generator.Element == Character>(newValues: S, atIndex i: Int) {
        string.splice(newValues, atIndex: stringIndex(i))
    }
    
    public mutating func removeAtIndex(i: Int) -> Character {
        return string.removeAtIndex(stringIndex(i))
    }
    
    public mutating func removeRange(subRange: Range<Int>) {
        string.removeRange(stringRange(subRange))
    }

    public mutating func removeAll(keepCapacity: Bool = false) {
        string.removeAll(keepCapacity: keepCapacity)
    }
}
