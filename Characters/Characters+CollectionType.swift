//
//  Characters+CollectionType.swift
//  Characters
//
//  Created by Brent Royal-Gordon on 8/30/14.
//  Copyright (c) 2014 Groundbreaking Software. All rights reserved.
//

extension Characters/*: CollectionType*/ {
    public var startIndex: Int {
        return 0
    }
    
    public var endIndex: Int {
        return indexCache.withValue { (inout cache: [String.Index]) in
            // Extend the cache to the end of the string
            // ! is safe because indexCache always contains at least string.startIndex
            cache += cache.last!...self.string.endIndex
            return cache.endIndex - 1
        }
    }
    
    public subscript(i: Int) -> Character {
        get {
            return string[stringIndex(i)]
        }
    }

    public func generate() -> IndexingGenerator<String> {
        return IndexingGenerator(string)
    }
}
