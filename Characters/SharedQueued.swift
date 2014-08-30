//
//  SharedQueued.swift
//  Characters
//
//  Created by Brent Royal-Gordon on 8/30/14.
//  Copyright (c) 2014 Groundbreaking Software. All rights reserved.
//

import Dispatch

internal class SharedQueued<T> {
    private var value: T
    private var queue = dispatch_queue_create("Shared serial queue", DISPATCH_QUEUE_SERIAL)
    
    init(_ value: T) {
        self.value = value
    }
    
    func withValue<Result> (closure: (inout value: T) -> Result) -> Result {
        var result: Result?
        dispatch_sync(queue) {
            result = closure(value: &self.value)
        }
        return result!
    }
}
