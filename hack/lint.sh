#!/bin/bash

CHART=${CHART:-"*"}
CT_ARGS=""
GIT_SAFE_DIR="false"

if [ "$GIT_SAFE_DIR" != "true" ]; then
    git config --global --add safe.directory /charts
fi

if [ "$CHART" != "*" ]; then
    CT_ARGS="--charts ${PWD}/charts/$CHART"
else
    CT_ARGS="--charts ${PWD}/charts"
fi

ct lint --config=./.github/chart-testing.yaml
