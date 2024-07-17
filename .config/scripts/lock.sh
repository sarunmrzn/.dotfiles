#!/bin/sh

BLANK='#00000000'           # Fully transparent
CLEAR='#282828cc'           # Semi-transparent Gruvbox dark background
DEFAULT='#d3869b'           # Gruvbox purple
TEXT='#ebdbb2'              # Gruvbox light tan (text)
WRONG='#fb4934'             # Gruvbox red (wrong input)
VERIFYING='#b8bb26'         # Gruvbox green (verifying)

i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--screen 1                   \
--blur 5                     \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %Y-%m-%d"    \
--keylayout 1

