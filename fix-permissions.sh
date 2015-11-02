#!/bin/bash
for f in `find .`; do if [ -d $f ]; then chmod 775 "$f"; elif [ "${f: -3}" == ".sh" ]; then chmod 764 "$f"; else chmod 664 "$f"; fi; done
