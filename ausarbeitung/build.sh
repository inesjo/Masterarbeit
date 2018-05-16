#! /bin/bash
export TEXMFHOME=/home/ines/Latex/texmf
export TEXINPUTS=.:./\{data,figs,tex\}//:./common//:
export BIBINPUTS=.:./common//:
masterDoc=${1}
latex="pdflatex -interaction=nonstopmode"
makeglossaries=makeglossaries
bibtex='bibtex8 -c ascii.csf -W '
rm='/bin/rm -f'
intermediateFiles='*.acn *.acr *.alg *.aux *.bbl *.blg *-blx.bib *.dvi *.glo *.glg *.gls \
*.ist *.lof *.lol *.lot *.nlg *.noa *.not *.run.xml *.toc'
${rm} ${intermediateFiles} &&
${latex} ${masterDoc} &&
${makeglossaries} ${masterDoc} &&
${bibtex} ${masterDoc} &&
${latex} ${masterDoc} &&
${makeglossaries} ${masterDoc} &&
${latex} ${masterDoc} &&
${latex} ${masterDoc}
${rm} ${intermediateFiles}