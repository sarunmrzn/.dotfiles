#!/bin/sh

BLANK='#00000000'           # Fully transparent
CLEAR='#121212cc'           # Semi-transparent dark gray background
DEFAULT='#b0b0b0'           # Light gray for default color
TEXT='#b0b0b0'              # Light gray for text
WRONG='#616161'             # Dark gray for wrong input
VERIFYING='#888888'         # Medium gray for verifying

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

