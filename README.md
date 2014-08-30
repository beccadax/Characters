Characters.framework
================

**Important Note:** This code has literally **never been run**, largely because 
Beta 6 crashes constantly when I'm in a file with an XCTestCase. Consider it a 
proof of concept.

`Characters` is a Swift string type with integer-based indexing. It has the same 
interface as a `String`, except all the indices are `Int`s instead of 
`String.Index`es. That means every index is an `Int` and every range is a 
`Range<Int>`.

The simplest way to get a `Characters` instance is through `String`'s new 
`characters` property:

    let chars = "Hello, world?".characters
    chars[12] = "!"
    println(chars.string)           // Hello, world!

You should also be able to manipulate the `characters` property directly to change 
the underlying string:

    var str = "Hello, world?"
    str.characters[12] = "!"
    println(str)            // Hello, world!

You can also just construct `Characters` objects like any other object, or by using 
a string literal.

Implementation
-----------

A `Characters` instance contains a `String` instance with the text, plus an array
mapping `Int` indices to `String.Index`es. The index array is lazily computed, so 
it's stored in a separate object so it can be modified even if the `Characters` is
constant. It also uses a dispatch queue to serialize access, ensuring the class is 
threadsafe (or at least as threadsafe as `String` is).

The framework also contains a `StringType` protocol which specifies the entire 
interface of `String` in an index-type-independent way. However, due to what 
seems to be a Swift compiler bug, I can't get `String` to conform to this protocol.
Nevertheless, `Characters` and `String` do have identical interfaces except for the 
types of the indices and ranges.

(Well, there's one other difference: `Characters` does not toll-free bridge to 
`NSString`. Sorry.)

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
