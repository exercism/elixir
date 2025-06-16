# Design

## Goal

The Goal is to learn how to use sets.

## Learning objectives

- Know what a set is
- Build: new, put, delete,
- Query: member?, size, disjoint?, subset?, equal?
- Combine: union, intersection, difference, symmetric_difference
- Lists: to_list
- Transform: filter, reject, split_with,
- know that order is not guaranteed

## Out of scope

Nothing

## Concepts

The concepts this exercise unlock are:

- mapsets

## Prerequisites

- strings
- lists
- enum
- tuples
- pattern-matching
- booleans

## Analyzer

Make sure that:

- (essential) `add_card` uses `MapSet.member?` and `MapSet.put`
- (essential) `trade_card` uses `MapSet.member?`, `MapSet.put` and `MapSet.delete`
- (essential) `remove_duplicates` uses `MapSet.to_list`
- (essential) `extra_cards` uses `MapSet.difference` and `MapSet.size`
- (essential) `boring_cards` uses `MapSet.intersection` and `MapSet.toList`
- (actionable) `boring_cards` uses `Enum.reduce`
- (essential) `total_cards` uses `MapSet.union` and `MapSet.size`
- (actionable) `total_cards` uses `Enum.reduce`
- (essential) `split_shiny_cards` uses `MapSet.partition` and `MapSet.toList`
- (actionable) `split_shiny_cards` uses `String.startsWith`
- (essential) `remove_duplicates`, `boring_cards` and `split_shiny_cards` use `Enum.sort`
