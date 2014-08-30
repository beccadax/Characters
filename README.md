Characters.framework
================
    
`Characters` is a Swift string type with integer-based indexing.
It has the same interface as a `String`, except all the indices 
are `Int`s instead of `String.Index`es. That means every index is 
an `Int` and every range is a `Range<Int>`.

(Well, there's one other difference: `Characters` does not toll-
free bridge to `NSString`. Sorry.)

The simplest way to get a `Characters` instance is through 
`String`'s new `characters` property:

    import Characters
    
    var chars = "Hello, world!".characters                      // "Hello, world!"
    chars[0]                                                    // "H"
    chars.replaceRange(7...11, with: "Swift")
    chars                                                       // "Hello, Swift!"

You can manipulate the `characters` property directly to change 
the string it belongs to:

    var str = "Hello, world!"
    str.characters[0]                                           // "H"
    str.characters.replaceRange(6...11, with: "Swift")
    str                                                         // "Hello, Swift!"

You can also just construct `Characters` instances like any other 
type, or by using a string literal anywhere Swift expects a 
`Characters` instance.

    let moreChars: Characters = "Hello, Swift!"

Implementation
-----------

A `Characters` instance contains a `String` instance with the text, plus an array
mapping `Int` indices to `String.Index`es. This index cache is lazily computed, so 
it's stored in a separate object so it can be modified even if the `Characters` is
constant. It also uses a dispatch queue to serialize access, ensuring `Characters` 
is threadsafe (or at least as threadsafe as `String` is).

Though the cache should help, it's extremely likely that indexing a `Characters` will
be slower than indexing a `String`. That's why `String` is designed the way it is.
You're getting what you asked for when you use `Characters`.

The framework also contains a `StringType` protocol which specifies the entire 
interface of `String` in an index-type-independent way. However, due to what 
seems to be a Swift compiler bug, I can't get `String` to conform to this protocol.
Nevertheless, `Characters` and `String` do have identical interfaces except for the 
types of the indices and ranges.

Author
-----

Brent Royal-Gordon \<<brent@brentdax.com>\>, Groundbreaking Software

Copyright
-------

(C) 2014 Groundbreaking Software LLC. Distributed under the MIT License:

> Permission is hereby granted, free of charge, to any person obtaining a copy 
> of this software and associated documentation files (the "Software"), to deal 
> in the Software without restriction, including without limitation the rights to 
> use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
> of the Software, and to permit persons to whom the Software is furnished to do 
> so, subject to the following conditions:
> 
> The above copyright notice and this permission notice shall be included in all 
> copies or substantial portions of the Software.
> 
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS 
> OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
> FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
> AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
> LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
> FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS 
> IN THE SOFTWARE.
