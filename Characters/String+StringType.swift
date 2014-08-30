//
//  String+StringType.swift
//  Characters
//
//  Created by Brent Royal-Gordon on 8/30/14.
//  Copyright (c) 2014 Groundbreaking Software. All rights reserved.
//

/* The conformance to StringType is disabled because of a compiler crash:

4  swift                    0x0000000110c1bf03 swift::GenericSignature::getCanonical(llvm::ArrayRef<swift::GenericTypeParamType*>, llvm::ArrayRef<swift::Requirement>) + 275
5  swift                    0x0000000110ca2387 swift::TypeBase::getCanonicalType() + 2055
6  swift                    0x000000010fe3ad19 filterValues(swift::Type, swift::Module*, bool, swift::Optional<swift::CtorInitializerKind>, llvm::SmallVectorImpl<swift::ValueDecl*>&) + 361
7  swift                    0x000000010fe3a77b swift::ModuleFile::resolveCrossReference(swift::Module*, unsigned int) + 3115
8  swift                    0x000000010fe31e56 swift::ModuleFile::getDecl(swift::Fixnum<31u, unsigned int>, swift::Optional<swift::DeclContext*>) + 6326

1.	While deserializing decl #15 (XREF)
2.	Cross-reference to module 'Swift'
... String
... init 

That's a shame, because this is one of the linchpins of the whole project. */

extension String/*: StringType*/ {
    public init<T: StringType>(stringType: T) {
        self = stringType.string
    }
    
    public var string: String {
        get {
            return self
        }
        set {
            self = newValue
        }
    }

    public var characters: Characters {
        get {
            return Characters(self)
        }
        set {
            self = newValue.string
        }
    }
}
