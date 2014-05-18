#!/bin/bash

set -eu

for tmpl in /app/*.erb; do
  erb $tmpl > $(dirname $tmpl)/$(basename $tmpl .erb)
done
exec $@
