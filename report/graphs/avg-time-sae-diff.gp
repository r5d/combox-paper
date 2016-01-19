# combox - report - 2016
#
#
# benchmark - avg. time to split and encrypt file - difference between
# 2016 and 2015 run - gnuplot
#
# By Siddharth Ravikumar <sravik@bgsu.edu>
#
# No rights reserved. Dedicated to Public Domain.
# <https://creativecommons.org/publicdomain/zero/1.0/>

set terminal latex size 13cm, 8cm
set output "avg-time-sae-diff.tex"
set format xy '%g'
set xlabel 'total size of files processed (MiB)'
set ylabel 'avg time taken (ms)' offset -5.5, 2.8, 0
set grid
set key right center
plot 'avg-time-sae' u 1:2 t 'avg. time to split \& encrypt file (2016)'\
     w linespoints,\
     'avg-time-sae-2015' u 1:2 t 'avg. time to split \& encrypt file (2015)'\
     w linespoints
