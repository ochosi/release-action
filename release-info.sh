#!/bin/bash

TAG=$(git describe "${GITHUB_REF}")
git tag --list --format="%(subject)%0a%(body)" $TAG | sed '/^-----BEGIN PGP SIGNATURE-----$/,$d' > release.md
echo "release_version=${TAG//v}" >> $GITHUB_ENV
echo "component=$(basename `git rev-parse --show-toplevel`)" >> $GITHUB_ENV