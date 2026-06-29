// exports.swift
// Umbrella re-export of the full Radix surface. Per [MOD-005] this target's
// sole content is `@_exported public import` of the sub-namespace target.
// Consumers importing Radix_Primitives get the whole model.

@_exported public import Radix_Primitive
