// Characters.framework
// ================
//     
// `Characters` is a Swift string type with integer-based indexing.
// It has the same interface as a `String`, except all the indices 
// are `Int`s instead of `String.Index`es. That means every index is 
// an `Int` and every range is a `Range<Int>`.
// 
// (Well, there's one other difference: `Characters` does not toll-
// free bridge to `NSString`. Sorry.)
// 
// The simplest way to get a `Characters` instance is through 
// `String`'s new `characters` property:

    import Characters
    
    var chars = "Hello, world!".characters
    chars[0]
    chars.replaceRange(7...11, with: "Swift")
    chars.string

// You can manipulate the `characters` property directly to change 
// the string it belongs to:

    var str = "Hello, world!"
    str.characters[0]
    str.characters.replaceRange(7...11, with: "Swift")
    str

// You can also just construct `Characters` instances like any other 
// type, or by using a string literal anywhere Swift expects a 
// `Characters` instance.

    let moreChars: Characters = "Hello, Swift!"
