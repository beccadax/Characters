//
//  StringType.swift
//  Characters
//
//  Created by Brent Royal-Gordon on 8/30/14.
//  Copyright (c) 2014 Groundbreaking Software. All rights reserved.
//

/// The StringType protocol includes the entire public interface of a String, along with a couple additions to support the Characters type.
public protocol StringType: CollectionType, Comparable, DebugPrintable, Equatable, ExtensibleCollectionType, Hashable, OutputStreamType, Reflectable, Sliceable, Streamable, StringLiteralConvertible, StringInterpolationConvertible, RangeReplaceableCollectionType {
    typealias Index: BidirectionalIndexType
    
    init()
    init<T: StringType>(stringType: T)
    
    init(_ c: Character)
    init(count sz: Int, repeatedValue c: Character)
    init(count: Int, repeatedValue c: UnicodeScalar)
    
    init<T: SignedIntegerType>(_ v: T)
    init<T: UnsignedIntegerType>(_ v: T)
    init<T: SignedIntegerType>(_ v: T, radix: Int, uppercase: Bool)
    init<T: UnsignedIntegerType>(_ v: T, radix: Int, uppercase: Bool)
    
    var startIndex: Index { get }
    var endIndex: Index { get }
    subscript (i: Index) -> Character { get }
    func generate() -> IndexingGenerator<String>
    
    var nulTerminatedUTF8: ContiguousArray<UTF8.CodeUnit> { get }
    var utf8: String.UTF8View { get }
    var utf16: String.UTF16View { get }
    
    init(_ view: String.UnicodeScalarView)
    var unicodeScalars: String.UnicodeScalarView { get set }
    
    func withCString<Result>(f: (UnsafePointer<Int8>) -> Result) -> Result
    
    func getMirror() -> MirrorType
    
    mutating func write(string: String)
    func writeTo<Target : OutputStreamType>(inout target: Target)
    
    mutating func extend(rhs: String)
    mutating func append(x: UnicodeScalar)
    
    subscript (subRange: Range<Index>) -> Self { get }
    
    mutating func reserveCapacity(n: Int)
    mutating func append(c: Character)
    mutating func extend<S : SequenceType where S.Generator.Element == Character>(seq: S)
    init<S : SequenceType where S.Generator.Element == Character>(seq: S)
    
    func join<S : SequenceType where S.Generator.Element == Self>(elements: S) -> Self
    
    mutating func replaceRange<C : CollectionType where C.Generator.Element == Character>(subRange: Range<Index>, with newValues: C)
    mutating func insert(newElement: Character, atIndex i: Index)
    mutating func splice<S : CollectionType where S.Generator.Element == Character>(newValues: S, atIndex i: Index)
    mutating func removeAtIndex(i: Index) -> Character
    mutating func removeRange(subRange: Range<Index>)
    mutating func removeAll(#keepCapacity: Bool)
    
    var isEmpty: Bool { get }
    func hasPrefix(prefix: Self) -> Bool
    func hasSuffix(suffix: Self) -> Bool
    
    func toInt() -> Int?
    
    var characters: Characters { get set }
    var string: String { get set }
}


