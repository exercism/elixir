# Instructions

You have been working in the city office for a while, and you have developed a set of tools that speed up your day-to-day work, for example with filling out forms.

Now, a new colleague is joining you, and you realized your tools might not be self-explanatory. There are a lot of weird conventions in your office, like always filling out forms with uppercase letters and avoiding leaving fields empty.

You decide to write some documentation so that it's easier for your new colleague to hop right in and start using your tools.

## 1. Document the purpose of the form tools

Add documentation to the `Form` module that describes its purpose. It should read:

> A collection of loosely related functions helpful for filling out various forms at the city office.

## 2. Document filling out fields with blank values

Add documentation and a typespec to the `Form.blanks/1` function. The documentation should read:

> Generates a string of a given length.
>
> This string can be used to fill out a form field that is supposed to have no value.
> Such fields cannot be left empty because a malicious third party could fill them out with false data.

The typespec should explain that the function accepts a single argument, a non-negative integer, and returns a string.

## 3. Document splitting values into lists of uppercase letters

Add documentation and a typespec to the `Form.letters/1` function. The documentation should read:

> Splits the string into a list of uppercase letters.
>
> This is needed for form fields that don't offer a single input for the whole string,
> but instead require splitting the string into a predefined number of single-letter inputs.

The typespec should explain that the function accepts a single argument, a string, and returns a list of string.

## 4. Document checking if a value fits a field with a max length

Add documentation and a typespec to the `Form.check_length/1` function. The documentation should read:

> Checks if the value has no more than the maximum allowed number of letters.
>
> This is needed for form fields that don't offer a single input for the whole string,
> but instead require splitting the string into a predefined number of single-letter inputs.

The typespec should explain that the function accepts two arguments, a string and a non-negative integer, and returns one of two possible values. It returns either the `:ok` atom or a 2-tuple with the first element being the `:error` atom, and the second a positive integer.

## 5. Document different address formats

For some unknown to you reason, the city office's internal system uses two different ways of representing addresses - either as a map or as a tuple.

Document this fact by defining three custom public types:
- `address_map` - a map with the keys `:street`, `:postal_code`, and `:city`. Each key holds a value of type string.
- `address_tuple` - a tuple with three values - `street`, `postal_code`, and `city`. Each value is of type string. Differentiate the values by giving them names in the typespec.
- `address` - can be either an `address_map` or an `address_tuple`.

## 6. Document formatting the address

Add documentation and a typespec to the `Form.format_address/1` function. The documentation should read:

> Formats the address as an uppercase multiline string.

The typespec should explain that the function accepts one argument, an address, and returns a string.
