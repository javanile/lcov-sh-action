#!/usr/bin/env bash

actual_output=$(bash entrypoint.sh)
actual_exit_code=$?
expected_output="error: not found GITHUB_TOKEN"
expected_exit_code=1

if [[ "${actual_output}" != "${expected_output}" ]]; then
    echo "Error: expected '${expected_output}' found '${actual_output}' at ${BASH_SOURCE}:${LINENO}."
    exit 1
fi

if [[ "${actual_exit_code}" != "${expected_exit_code}" ]]; then
    echo "Error: expected '${expected_exit_code}' found '${actual_exit_code}' at ${BASH_SOURCE}:${LINENO}."
    exit 1
fi

bash entrypoint.sh
