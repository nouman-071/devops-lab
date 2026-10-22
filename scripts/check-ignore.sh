#!/usr/bin/env bash
set -euo pipefail

cd "$(git rev-parse --show-toplevel)"

for path in out/lab04-check.txt lab04-check.log; do
    if ! git check-ignore -q --no-index -- "$path"; then
        printf 'FAIL: %s is not ignored\n' "$path" >&2
        exit 1
    fi
done

tracked_files=$(git ls-files -- 'out/*' '*.log')

if [[ -n "$tracked_files" ]]; then
    printf 'FAIL: Generated output or log files are tracked:\n%s\n' \
        "$tracked_files" >&2
    exit 1
fi

printf 'PASS: Output and log paths are ignored; none are tracked.\n'
