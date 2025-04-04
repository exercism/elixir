# Instructions

Your task is to determine the degree of separation between two individuals in a family tree.

- You will be given an input, with all parent names and their children.
- Each name is unique, a child _can_ have one or two parents.
- The degree of separation is defined as the shortest number of connections from one person to another.
- If two individuals are not connected, return a value that represents "no known relationship."
  Please see the test cases for the actual implementation.

## Example

Given the following family tree:

```text
      ┌──────────┐            ┌──────────┐ ┌───────────┐
      │  Helena  │            │  Erdős   │ │  Shusaku  │
      └───┬───┬──┘            └─────┬────┘ └──────┬────┘
      ┌───┘   └───────┐             └──────┬──────┘
      ▼               ▼                    ▼
┌──────────┐     ┌────────┐          ┌──────────┐
│   Isla   │     │  Tariq │          │   Kevin  │
└────┬─────┘     └────┬───┘          └──────────┘
     ▼                ▼
┌─────────┐      ┌────────┐
│   Uma   │      │ Morphy │
└─────────┘      └────────┘
```

The degree of separation between Tariq and Uma is 3 (Tariq → Helena → Isla → Uma).
There's no known relationship between Isla and [Kevin][six-bacons], as there is no connection in the given data.
The degree of separation between Uma and Isla is 1.

~~~~exercism/note
Isla and Tariq are siblings and have a separation of 1.
Similarly, this implementation would report a separation of 2 from you to your father's brother.
~~~~

[six-bacons]: https://en.m.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon
