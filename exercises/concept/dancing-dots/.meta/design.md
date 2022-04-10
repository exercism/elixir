# Design

## Learning objectives

- Know how to define a behaviour with callbacks
- Know how to provide a default implementation of a callback
- Know how to use a behaviour
- `@impl`

## Out of scope

- `@macrocallback`
- `@optional_callbacks`

## Concepts

- `behaviours`
- `use`

## Prerequisites

- `typespecs`
- `structs`
- `ast`
- `enum`
- `import`

## Analyzer

- Check for `@impl DancingDots.Animation` (should be used with a module, not with a boolean)
- Check that `DancingDots.Flicker` doesn't reimplement `init/1`
