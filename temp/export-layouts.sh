#!/bin/bash

mkdir lay
cd lay
svn export http://stalker.iguide.co.il:8080/svn/lm-solve/lm-solve/layouts/layouts
ver="$(cat layouts/ver.txt)"
dir_base="LM-Solve-Layouts-$ver"
arc_name="$dir_base.tar.gz"
mv layouts $dir_base
tar -czvf $arc_name $dir_base
mv -f $arc_name ../
cd ..
rm -fr lay
echo -n $ver > devel-layouts-ver.txt

