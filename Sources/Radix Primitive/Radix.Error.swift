// Radix.Error.swift

extension Radix {
    /// A failure raised while constructing a ``Radix`` from a digit alphabet.
    ///
    /// Each case describes the condition the supplied alphabet violated, not a
    /// recovery action.
    public enum Error: Swift.Error, Sendable, Equatable, Hashable {
        /// The alphabet had fewer than two glyphs.
        ///
        /// A positional numeral base requires at least two distinct digits;
        /// `count` is the number of glyphs that were supplied.
        case insufficientDigits(count: Int)

        /// The alphabet contained the same digit twice.
        ///
        /// Under ``Radix/Casing/insensitive`` casing, glyphs that differ only in
        /// ASCII letter case count as the same digit. `glyph` is the repeated
        /// glyph.
        case duplicateDigit(Unicode.Scalar)
    }
}
