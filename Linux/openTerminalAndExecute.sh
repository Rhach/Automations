#!/bin/bash

#This will open a new terminal and execute the file
#Be sure to change the path as well as the file
#And obviously rename this to something usefull...
#When using KDE the terminal is konsole but that is subject to change
konsole -e /bin/bash -c 'cd <path> && <file>; exec /bin/bash -i'
