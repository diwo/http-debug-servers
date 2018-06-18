#!/bin/bash

H=""
B=""

NL=1
while IFS= read -r -n 1 c; do
  case "$c" in
    $'\r') ;;
    "")
      [ $NL -eq 1 ] && break
      H+=$'\n'
      NL=1
      ;;
    *)
      H+="$c"
      NL=0
      ;;
  esac
done

L="$(echo "$H" | egrep "^Content-Length: " | cut -d' ' -f2)"
if [ -n "$L" ]; then
  R=$L
  while [ $R -gt 0 ]; do
    read -r -n 1 c || break
    case "$c" in
      $'\r') ;;
      "")    B+=$'\n' ;;
      *)     B+="$c" ;;
    esac
    (( R-- ))
  done
fi

printf "HTTP/1.1 200 OK\r\n"
printf "\r\n"
printf "Hello\r\n"

{ printf "$H\n" | sed 's/^/> /';
  printf "$B\n"
} >&2

