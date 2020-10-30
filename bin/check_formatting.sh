#!/bin/bash

# ###
# check_formatting.sh
# ###
# Uses `mix format` to validate formatting of all elixir code
# ###
echo "Running 'mix format'"
mix format --check-formatted
