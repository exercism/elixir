## Currency as integer

The original specs had balances expressed as floats, which were changed to integers to avoid the usual complications.

## Customs tests

All of the tests only had one API request, so in order to justify using stateful processes, some multiple-request tests were added.
