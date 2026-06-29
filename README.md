# Radix Primitives

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

The keystone model for positional numeral systems — a `Radix` is a base paired with its ordered digit alphabet, plus single-digit value↔glyph mapping. It is the shared vocabulary that integer formatting (value → base-N text) and binary base encodings (which need a digit alphabet) both build on.

`Radix` is mathematics, not a specification: it lives at the primitives layer, imports no Foundation, and depends on no other package. It models what a radix *is* — it deliberately stops short of rendering whole integers, which is a separate formatter concern.

---

## Quick Start

```swift
import Radix_Primitives

let hex = Radix.hexadecimal
hex.base                       // 16
hex.digit(for: 10)             // "a"   — value → glyph
hex.value(of: "A")             // 10    — glyph → value (hex is case-insensitive)
hex.value(of: "g")             // nil   — not a hex digit
```

The four standard numeral radixes are provided as values:

```swift
Radix.binary.base              // 2
Radix.octal.digit(for: 7)      // "7"
Radix.decimal.value(of: "9")   // 9
Radix.hexadecimal.digit(for: 15) // "f"
```

Build a custom radix from its alphabet — the initializer validates that there are at least two distinct digits:

```swift
let base4 = try Radix(digits: ["w", "x", "y", "z"])
base4.base                     // 4
base4.value(of: "y")           // 2
```

### Why a model, not a formatter

Rendering an integer to a base-N string needs a digit alphabet *and* a division-and-remainder algorithm. `Radix` owns the first half — the alphabet and the per-digit mapping — so that every formatter, encoder, and parser agrees on what "base 16" means before any of them decides how to spell a whole number. Keeping the model separate is what lets a hex formatter and a Base16 encoder share one definition of the hexadecimal alphabet.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-primitives/swift-radix-primitives.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "Radix Primitives", package: "swift-radix-primitives"),
    ]
)
```

The package is pre-1.0 — until 0.1.0 is tagged, depend on `branch: "main"` rather than `from: "0.1.0"`. Requires Swift 6.3.1 and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Architecture

Two library products plus a Test Support target.

| Product | Target | Purpose |
|---------|--------|---------|
| `Radix Primitive` | `Sources/Radix Primitive/` | The `Radix` model — the type, the standard `binary` / `octal` / `decimal` / `hexadecimal` radixes, digit mapping (`base`, `digit(for:)`, `value(of:)`), and validating construction. Zero dependencies. |
| `Radix Primitives` | `Sources/Radix Primitives/` | Umbrella — re-exports the model under the canonical import name. Import this. |
| `Radix Primitives Test Support` | `Tests/Support/` | Re-exports the umbrella for downstream test consumers. |

The package depends only on the Swift standard library. Digit glyphs are `Unicode.Scalar`; digit values are `Int`. Case folding for case-insensitive radixes is ASCII-only, keeping the model Embedded-Swift-compatible.

Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26+ | ✅ |
| iOS 26+ | ✅ |
| tvOS 26+ | ✅ |
| watchOS 26+ | ✅ |
| visionOS 26+ | ✅ |
| Linux (Swift 6.3+) | ✅ |
| Windows (Swift 6.3+) | ✅ |
| Embedded Swift | ✅ |

---

## Related Packages

- [`swift-byte-primitives`](https://github.com/swift-primitives/swift-byte-primitives) — `Byte`, the atomic binary unit. A future binary-base encoder pairs byte streams with a `Radix` digit alphabet.
- [`swift-binary-base-primitives`](https://github.com/swift-primitives/swift-binary-base-primitives) — Base16/32/64/85 encodings; a consumer of this digit-alphabet model.

---

## Community

<!-- BEGIN: discussion -->
<!-- END: discussion -->

## License

Apache License 2.0 — see [LICENSE.md](LICENSE.md).
