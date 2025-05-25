#!/bin/bash
list_wmls()
{
    find ./src/ -name '*.html.wml' |
        perl -nl -E 's!\A\./src/!! ; s!\.html\.wml\z!! ; if ( not m!\Asource/index\z! ) { say; }' |
        sort
}

get_subdirs()
{
    grep '/' |
        sed 's!/[^/]*$!!' |
        uniq
}

add_extra()
{
    cat ;
    echo "source"
    echo "source/arcs"
}

(echo "PAGES = $(list_wmls | xargs)" ;
echo
echo "SUBDIRS = $(list_wmls | get_subdirs | add_extra | xargs)"
echo ) > defs.mak

printf "%s\\n" "include lib/make/main.mak" > "Makefile"
