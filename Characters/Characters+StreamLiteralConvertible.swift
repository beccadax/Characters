//
//  Characters+StreamLiteralConvertible.swift
//  Characters
//
//  Created by Brent Royal-Gordon on 8/30/14.
//  Copyright (c) 2014 Groundbreaking Software. All rights reserved.
//

extension Characters/*: StringLiteralConvertible*/ {
    public static func convertFromStringLiteral(value: String) -> Characters {
        return value.characters
    }
    
    public static func convertFromExtendedGraphemeClusterLiteral(value: String) -> Characters {
        return value.characters
    }
}
