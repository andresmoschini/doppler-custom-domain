#!/bin/sh

# It is only here for reference and backward compatibility, the source of truth
# is doppler-jenkins-ci.groovy

# Exit immediately if a command exits with a non-zero status.
set -e

# Lines added to get the script running in the script path shell context
# reference: http://www.ostricher.com/2014/10/the-right-way-to-get-the-directory-of-a-bash-script/
cd "$(dirname "$0")"

export MSYS_NO_PATHCONV=1
export MSYS2_ARG_CONV_EXCL="*"

echo Verify Format...
docker build \
    --target verify-format \
    .

echo Verify .sh files...
docker build \
    --target verify-sh \
    .

echo Restore...
docker build \
    --target restore \
    .

echo Build...
docker build \
    --target build \
    .

echo Test...
docker build \
    --target test \
    .
