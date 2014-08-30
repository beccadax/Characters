//
//  Characters+StringType.swift
//  Characters
//
//  Created by Brent Royal-Gordon on 8/30/14.
//  Copyright (c) 2014 Groundbreaking Software. All rights reserved.
//

extension Characters: StringType {
    public init<T: StringType>(stringType: T) {
        self.init(stringType.string)
    }

    public init(_ c: Character) {
        self.init(String(c))
    }
    
    public init(count: Int, repeatedValue c: Character) {
        self.init(String(count: count, repeatedValue: c))
    }

    public init(count: Int, repeatedValue s: UnicodeScalar) {
        self.init(String(count: count, repeatedValue: s))
    }

    public init<T: SignedIntegerType>(_ v: T) {
        self.init(String(v))
    }
    
    public init<T: UnsignedIntegerType>(_ v: T) {
        self.init(String(v))
    }
    
    public init<T: SignedIntegerType>(_ v: T, radix: Int, uppercase: Bool = false) {
        self.init(String(v, radix: radix, uppercase: uppercase))
    }
    
    public init<T: UnsignedIntegerType>(_ v: T, radix: Int, uppercase: Bool = false) {
        self.init(String(v, radix: radix, uppercase: uppercase))
    }
    
    public init(_ scalarView: String.UnicodeScalarView) {
        self.init(String(scalarView))
    }
    
    public mutating func append(scalar: UnicodeScalar) {
        string.append(scalar)
    }
    
    public init<S : SequenceType where S.Generator.Element == Character>(seq: S) {
        self.init(String(seq: seq))
    }
    
    public var nulTerminatedUTF8: ContiguousArray<UTF8.CodeUnit> {
        return string.nulTerminatedUTF8
    }
    
    public var utf8: String.UTF8View {
        return string.utf8
    }
    
    public var utf16: String.UTF16View {
        return string.utf16
    }
    
    public var unicodeScalars: String.UnicodeScalarView {
        get {
            return string.unicodeScalars
        }
        set {
            string.unicodeScalars = newValue
        }
    }
    
    public func withCString<Result>(f: (UnsafePointer<Int8>) -> Result) -> Result {
        return string.withCString(f)
    }
    
    public func join<Sequence: SequenceType where Sequence.Generator.Element == Characters>(elements: Sequence) -> Characters {
        return string.join(lazy(elements).map { $0.string }).characters
    }
    
    public var isEmpty: Bool {
        return string.isEmpty
    }
    
    public func hasPrefix(prefix: Characters) -> Bool {
        return string.hasPrefix(prefix.string)
    }
    
    public func hasSuffix(suffix: Characters) -> Bool {
        return string.hasSuffix(suffix.string)
    }

    public func toInt() -> Int? {
        return string.toInt()
    }
}
