#!/bin/bash

mkdir lay
cd lay
svn export 'http://svn.berlios.de/svnroot/repos/quad-pres/lm-solve/layouts/layouts/'
ver="$(cat layouts/ver.txt)"
dir_base="LM-Solve-Layouts-$ver"
arc_name="$dir_base.tar.gz"
mv layouts $dir_base
tar -czvf $arc_name $dir_base
mv -f $arc_name ../
cd ..
rm -fr lay
echo -n $ver > devel-layouts-ver.txt

