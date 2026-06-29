// Radix.Casing.swift

extension Radix {
    /// The case-folding policy a radix applies when mapping a glyph to its value.
    ///
    /// Standard hexadecimal is ``insensitive`` so that `"A"` and `"a"` both
    /// resolve to `10`. Radixes whose alphabet distinguishes letter case — a
    /// base-62 alphabet of `0`–`9`, `A`–`Z`, `a`–`z`, for instance — must be
    /// ``sensitive`` so the two cases remain distinct digits.
    public enum Casing: Sendable, Equatable, Hashable {
        /// Glyphs are matched exactly; `"A"` and `"a"` are distinct digits.
        case sensitive

        /// ASCII letter case is folded; `"A"` and `"a"` resolve to the same digit.
        case insensitive
    }
}
