//
//  Characters.swift
//  Characters
//
//  Created by Brent Royal-Gordon on 8/30/14.
//  Copyright (c) 2014 Groundbreaking Software. All rights reserved.
//

public struct Characters {
    public var string: String {
        didSet {
            indexCache = SharedQueued([string.startIndex])
        }
    }
    internal var indexCache: SharedQueued<[String.Index]>
    
    init(_ string: String) {
        self.string = string
        indexCache = SharedQueued([string.startIndex])
    }
    
    public var characters: Characters {
        get {
            return self
        }
        set {
            self = newValue
        }
    }
    
    public func stringIndex(i: Int) -> String.Index {
        return indexCache.withValue { (inout cache: [String.Index]) in
            return self.stringIndex(i, withCache: &cache)
        }
    }
    
    private func stringIndex(i: Int, inout withCache cache: [String.Index]) -> String.Index {
        if i < cache.endIndex {
            return cache[i]
        }
        
        let strIdx = stringIndex(i - 1, withCache: &cache).successor()
        assert(cache.endIndex == i, "stringIndex(_:withCache:) should build up indices from beginning to end")
        cache.append(strIdx)
        return strIdx
    }
    
    public func stringRange(range: Range<Int>) -> Range<String.Index> {
        let start = stringIndex(range.startIndex)
        let end = stringIndex(range.endIndex)
        return Range(start: start, end: end)
    }
}

