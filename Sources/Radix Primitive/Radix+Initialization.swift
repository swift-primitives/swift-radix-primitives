// Radix+Initialization.swift

extension Radix {
    /// Creates a radix from an ordered digit alphabet, validating the alphabet.
    ///
    /// The glyph at position `v` becomes the digit whose numeric value is `v`,
    /// and ``base`` becomes the number of glyphs.
    ///
    /// ```swift
    /// let base4 = try Radix(digits: ["w", "x", "y", "z"])
    /// base4.base                     // 4
    /// base4.digit(for: 3)            // "z"
    /// ```
    ///
    /// - Parameters:
    ///   - digits: The ordered glyphs of the base. Must contain at least two
    ///     glyphs, all distinct (under the chosen `casing`).
    ///   - casing: Whether glyph → value lookup folds ASCII letter case.
    ///     Defaults to ``Radix/Casing/sensitive``.
    /// - Throws: ``Radix/Error/insufficientDigits(count:)`` when fewer than two
    ///   glyphs are supplied, or ``Radix/Error/duplicateDigit(_:)`` when a glyph
    ///   repeats.
    public init(digits: [Unicode.Scalar], casing: Casing = .sensitive) throws(Radix.Error) {
        guard digits.count >= 2 else {
            throw .insufficientDigits(count: digits.count)
        }

        var seen: Set<UInt32> = []
        seen.reserveCapacity(digits.count)
        for glyph in digits {
            let key: UInt32
            switch casing {
            case .sensitive:
                key = glyph.value
            case .insensitive:
                key = Radix.folded(glyph).value
            }
            guard seen.insert(key).inserted else {
                throw .duplicateDigit(glyph)
            }
        }

        self.init(digits, casing: casing)
    }

    /// Folds an ASCII upper-case letter to its lower-case form, leaving every
    /// other scalar unchanged.
    ///
    /// Folding is restricted to ASCII `A`–`Z` so the model stays
    /// Foundation-free and Embedded-Swift-compatible — it never consults the
    /// Unicode case-mapping tables.
    @usableFromInline
    static func folded(_ glyph: Unicode.Scalar) -> Unicode.Scalar {
        guard glyph.value >= 0x41, glyph.value <= 0x5A else { return glyph }
        return Unicode.Scalar(UInt8(glyph.value + 0x20))
    }
}
