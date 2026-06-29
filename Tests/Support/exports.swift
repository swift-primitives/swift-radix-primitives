// exports.swift
// Re-export test support dependencies for consumers.
//
// Spine per [MOD-024]: this package has no upstream product dependencies, so
// there is no upstream Test Support to anchor on — the shell re-exports only
// this package's own product to keep the namespace uniform.

@_exported public import Radix_Primitives
