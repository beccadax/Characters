//
//  Characters+StringInterpolationConvertible.swift
//  Characters
//
//  Created by Brent Royal-Gordon on 8/30/14.
//  Copyright (c) 2014 Groundbreaking Software. All rights reserved.
//

extension Characters/*: StringInterpolationConvertible*/ {
    public static func convertFromStringInterpolation(strings: Characters...) -> Characters {
        return strings.reduce("", +)
    }
    public static func convertFromStringInterpolationSegment<T>(expr: T) -> Characters {
        return String.convertFromStringInterpolationSegment(expr).characters
    }
}
