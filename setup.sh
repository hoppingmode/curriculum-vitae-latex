#!/bin/bash

if ! command -v tlmgr.bat &> /dev/null; then
    echo "TeX package install not found. Please make sure that you have installed TeX Live or TinyTex."
    exit 1
fi

eval "tlmgr.bat update --all"
eval "tlmgr.bat install \
    latexmk \
    latexindent \
    chktex \
    enumitem \
    psnfss \
    texcount \
    ifmtarg \
    ragged2e \
    fancyhdr \
    xifthen \
    unicode-math \
    tcolorbox \
    parskip \
    pifont \
    fontspec \
    needspace \
    hyperref \
    sourcesanspro \
    tikzfill"