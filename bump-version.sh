#!/bin/bash

VERSION=$(( $1 + 1 ))

sed -i -E "s/(Version:\\s+)[0-9]+/\1$VERSION/" *osbuild*.spec

if [ -f "setup.py" ]; then
  sed -i -E "s/(version=\")[0-9]+/\1$VERSION/" setup.py
fi
