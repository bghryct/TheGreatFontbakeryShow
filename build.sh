#!/bin/sh


# -------------------------------------------------------------------
# Update the following as needed ------------------------------------
set -e


echo "Generating VFs"
# mkdir -p ./fonts/variable
echo "Generating VFs"
fontmake -g source/jost.glyphs -o variable --round-instances -a --output-path source/vf/jost\[slnt,wght\].ttf

echo "Removing Build UFOS"

rm -rf master_ufo/ instance_ufo/

echo "Build UFOS Removed"

# We'll cover the below once we've done our first build. 

# echo "vf cleaning"

# vfs=$(ls ./source/vf/*.ttf)
# for vf in $vfs
# do
# 	gftools fix-dsig -f $vf;
# 	gftools fix-nonhinting $vf "$vf.fix";
# 	mv "$vf.fix" $vf;
# 	ttx -f -x "MVAR" $vf; # Drop MVAR. Table has issue in DW
# 	rtrip=$(basename -s .ttf $vf)
# 	new_file=./source/vf/$rtrip.ttx;
# 	rm $vf;
# 	ttx $new_file
# 	rm ./source/vf/*.ttx
# done
# rm ./source/vf/*backup*.ttf

# echo "end vf cleaning"

fontbakery check-googlefonts ./source/vf/*.ttf --dark-theme --ghmarkdown jost_problems.md
