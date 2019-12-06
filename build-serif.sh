
# Sans

TTFDIR="./fonts/InriaSerif/TTF"
UFODIR="./masters/INRIA-SERIF"
rm -r $TTFDIR/*.ttf


for f in $UFODIR/*.ufo
do
	fontmake -u $f -o ttf --output-dir $TTFDIR -a
done


for f in $TTFDIR/*.ttf
do
	gftools fix-dsig --autofix $f
	gftools fix-hinting $f
	mv $f.fix $f
done

# # Clean up
rm -r instance_ufo
rm -r master_ufo
