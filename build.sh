#!/bin/bash
 
 rm -Rf _build
source activate jupyter-book
jupyter-book build .

if [[ $1 == "site" ]]
then
  rsync -a _build/html/* lngo@cs.wcupa.edu:~/public_html/csc331/
fi

if [[ $1 == "pages" ]]
then
  ghp-import -n -p -f _build/html
fi