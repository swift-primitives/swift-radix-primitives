// Radix+Mapping.swift

extension Radix {
    /// The radix value — the number of distinct digits in the base.
    ///
    /// ```swift
    /// Radix.hexadecimal.base         // 16
    /// Radix.binary.base              // 2
    /// ```
    @inlinable
    public var base: Int { digits.count }

    /// The glyph that spells the digit with the given numeric value.
    ///
    /// ```swift
    /// Radix.hexadecimal.digit(for: 10)   // "a"
    /// Radix.hexadecimal.digit(for: 16)   // nil
    /// ```
    ///
    /// - Parameter value: A digit value. Valid values are `0 ..< base`.
    /// - Returns: The corresponding glyph, or `nil` when `value` is outside
    ///   `0 ..< base`.
    @inlinable
    public func digit(for value: Int) -> Unicode.Scalar? {
        guard value >= 0, value < digits.count else { return nil }
        return digits[value]
    }

    /// The numeric value of the given digit glyph.
    ///
    /// When this radix's ``casing`` is ``Radix/Casing/insensitive``, ASCII
    /// letter case is folded, so `"A"` and `"a"` resolve to the same value.
    ///
    /// ```swift
    /// Radix.hexadecimal.value(of: "a")   // 10
    /// Radix.hexadecimal.value(of: "A")   // 10  (case-insensitive)
    /// Radix.hexadecimal.value(of: "g")   // nil (not a hex digit)
    /// ```
    ///
    /// - Parameter glyph: A candidate digit glyph.
    /// - Returns: The digit value in `0 ..< base`, or `nil` when `glyph` is not
    ///   a digit of this radix.
    @inlinable
    public func value(of glyph: Unicode.Scalar) -> Int? {
        switch casing {
        case .sensitive:
            return digits.firstIndex(of: glyph)
        case .insensitive:
            let target = Radix.folded(glyph)
            return digits.firstIndex { Radix.folded($0) == target }
        }
    }
}
