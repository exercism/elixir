#!/usr/bin/env bash

# Exit if anything fails.
set -eo pipefail

# If argument not provided, print usage and exit
if [ -z "$1" ]; then
    echo "Usage: bin/generate_practice_exercise.sh <exercise-slug>"
    exit 1
fi

SLUG="$1"
exercise_dir="exercises/practice/${SLUG}"

# build configlet
echo "Fetching latest version of configlet..."
./bin/fetch-configlet

# Preparing config.json
echo "Adding instructions and configuration files..."
UUID=$(bin/configlet uuid)
jq --arg slug "$SLUG" --arg uuid "$UUID" \
    '.exercises.practice += [{slug: $slug, name: "TODO", uuid: $uuid, practices: [], prerequisites: [], difficulty: 5}]' \
    config.json > config.json.tmp
mv config.json.tmp config.json

# Create instructions and config files
./bin/configlet sync --update --yes --docs --filepaths --metadata --exercise "$SLUG"

# Create Elixir files
echo "Creating Elixir files..."
elixir bin/bootstrap_practice_exercise.exs $SLUG

echo "All stub files were created. After implementing the solution, tests and configuration, please run:"
echo "    elixir bin/check_practice_exercise_order.exs --write"
echo "    ./bin/configlet sync --update --tests --exercise ${SLUG}"
echo "    ./bin/configlet fmt --update --yes --exercise ${SLUG}"
