# ``Radix_Primitives``

@Metadata {
    @DisplayName("Radix Primitives")
    @TitleHeading("Swift Primitives")
}

The positional-numeral-base model: a radix value paired with its ordered digit
alphabet, plus single-digit value↔glyph mapping.

## Overview

A ``Radix/Radix`` is a base and its digit alphabet — the shared model that
integer formatting and binary-base encodings build on. It maps a digit value to
its glyph and a glyph back to its value; it is deliberately not a formatter.
The standard ``Radix/Radix/binary``, ``Radix/Radix/octal``,
``Radix/Radix/decimal``, and ``Radix/Radix/hexadecimal`` radixes are provided,
and custom radixes are constructed from a validated alphabet.

## Topics

### The model

- ``Radix/Radix``

### Standard radixes

- ``Radix/Radix/binary``
- ``Radix/Radix/octal``
- ``Radix/Radix/decimal``
- ``Radix/Radix/hexadecimal``

### Digit mapping

- ``Radix/Radix/base``
- ``Radix/Radix/digit(for:)``
- ``Radix/Radix/value(of:)``

### Supporting types

- ``Radix/Radix/Casing``
- ``Radix/Radix/Error``
