// Radix.swift

/// A positional numeral base together with its ordered digit alphabet.
///
/// A *radix* is the keystone model for positional numeral notation. It answers
/// "in which base are values written, and which glyphs spell the digits of that
/// base?" — the shared vocabulary that integer formatting (value → base-N text)
/// and binary base encodings (which need a digit alphabet) both build on.
///
/// A `Radix` carries two things:
///
/// - the ``base`` — the radix value, e.g. `16` for hexadecimal, derived from the
///   size of the alphabet, and
/// - the ``digits`` — the ordered glyphs of the base, where the glyph at
///   position `v` represents the digit whose numeric value is `v`.
///
/// ```swift
/// let hex = Radix.hexadecimal
/// hex.base                       // 16
/// hex.digit(for: 10)             // "a"
/// hex.value(of: "A")             // 10  (hexadecimal is case-insensitive)
/// hex.value(of: "g")             // nil (not a hex digit)
/// ```
///
/// ## Scope
///
/// This type is the base-and-alphabet *model* plus single-digit mapping. It is
/// deliberately **not** a formatter: rendering an integer to a base-N string,
/// or parsing a base-N string back to an integer, is a separate
/// numeric-formatter concern that composes this model. Keeping `Radix` a pure
/// primitive lets every consumer agree on what a radix *is* before deciding how
/// to render with it.
///
/// ## Digit glyphs
///
/// A digit glyph is a `Unicode.Scalar`. The standard numeral radixes use the
/// ASCII glyphs `0`–`9` and `a`–`f`, but the model itself imposes no such
/// restriction — any ordered sequence of distinct scalars is a valid alphabet.
///
/// ## Custom radixes
///
/// Construct a custom radix from its alphabet with ``init(digits:casing:)``,
/// which validates the alphabet (at least two digits, no duplicates):
///
/// ```swift
/// let base4 = try Radix(digits: ["w", "x", "y", "z"])
/// base4.value(of: "y")           // 2
/// ```
@frozen
public struct Radix {
    /// The ordered digit alphabet.
    ///
    /// The glyph at position `v` is the digit whose numeric value is `v`. The
    /// number of glyphs is the radix's ``base``.
    public let digits: [Unicode.Scalar]

    /// Whether glyph → value lookup folds ASCII letter case.
    ///
    /// `.insensitive` lets, for example, both `"a"` and `"A"` resolve to the same
    /// hexadecimal value; `.sensitive` treats them as distinct glyphs.
    public let casing: Casing

    /// Creates a radix from a known-valid, already-validated alphabet.
    ///
    /// This initializer performs no validation; it is the canonical storage
    /// initializer used by the standard radixes and by the validating
    /// ``init(digits:casing:)``.
    @inlinable
    init(_ digits: [Unicode.Scalar], casing: Casing) {
        self.digits = digits
        self.casing = casing
    }
}

extension Radix: Sendable {}
