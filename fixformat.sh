for f in `find .`; do if [ -d $f ]; then :; else mac2unix $f; fi; done
