// Radix+Standard.swift

extension Radix {
    /// Base 2 — the binary radix, digits `0` and `1`.
    public static let binary = Radix(
        ["0", "1"],
        casing: .sensitive
    )

    /// Base 8 — the octal radix, digits `0` through `7`.
    public static let octal = Radix(
        ["0", "1", "2", "3", "4", "5", "6", "7"],
        casing: .sensitive
    )

    /// Base 10 — the decimal radix, digits `0` through `9`.
    public static let decimal = Radix(
        ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"],
        casing: .sensitive
    )

    /// Base 16 — the hexadecimal radix.
    ///
    /// The digit alphabet is the conventional lower-case form `0`–`9` then
    /// `a`–`f`. Lookup is ``Radix/Casing/insensitive``, so the upper-case
    /// glyphs `A`–`F` resolve to the same values.
    public static let hexadecimal = Radix(
        ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"],
        casing: .insensitive
    )
}
