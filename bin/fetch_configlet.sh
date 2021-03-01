#!/bin/bash
set -euo pipefail

curlopts=(
  --silent
  --show-error
  --fail
  --location
  --retry 3
)

get_download_url() {
  # Returns the download URL of the latest configlet Linux release from the GitHub API
  local api_url='https://api.github.com/repos/exercism/configlet/releases/latest'
  local asset_name="configlet-${1}-64bit.tgz"
  curl "${curlopts[@]}" --header "Accept: application/vnd.github.v3+json" "${api_url}" |
    jq --arg name "${asset_name}" -r '.assets[] | select(.name==$name).browser_download_url'
}

case ${1-} in

  mac)
    download_url="$(get_download_url 'mac' )"
    ;;

  linux)
    download_url="$(get_download_url 'linux' )"
    ;;

  windows)
    download_url="$(get_download_url 'windows' )"
    ;;

  *)
    echo 'usage: fetch_configlet.sh mac | linux | windows'
    exit 1
    ;;
esac

curl "${curlopts[@]}" "${download_url}" | tar xz -C bin/
echo 'done'
