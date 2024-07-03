#!/bin/bash

set -x

for t in t?
do
  cd $t
  tar -Hv7 -cvf ../$t.tar *
  ../../ptar -cvf ../$t.ptar *
  od -Ad -c ../$t.tar > ../$t.tar.od
  od -Ad -c ../$t.ptar > ../$t.ptar.od
  diff ../$t.tar.od ../$t.ptar.od > ../$t.diff
  cd ..
done
