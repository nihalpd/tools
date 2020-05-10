#!/bin/sh
# little script to create my morning page entry

MP_DIR=$HOME/morning-pages

if [ ! -d "$FILE" ]; then
  mkdir -p $MP_DIR
fi
FILE=$MP_DIR/$(date +%m-%d-%Y).txt

DESIRED_WC=1500
if [ ! -f "$FILE" ]; then
  vim "$FILE"
  exit 0
fi

if [ ! -f "$FILE" ]; then
  vim "$FILE"
  exit 0
fi

current_wc=$(wc -w "$FILE" | cut -d' ' -f1)

if [ $current_wc -ge $DESIRED_WC ]; then
  echo "It seems you have already done your morning pages. Continue? (y/n)"
  read yn
  case $yn in
    [Yy]* ) vim "$FILE"; exit;;
    [Nn]* ) echo "Goodbye!"; exit;;
 esac
  exit 0
fi
