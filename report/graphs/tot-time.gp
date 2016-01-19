# combox - report - 2016
#
#
# benchmark - total time to process all files  - gnuplot
#
# By Siddharth Ravikumar <sravik@bgsu.edu>
#
# No rights reserved. Dedicated to Public Domain.
# <https://creativecommons.org/publicdomain/zero/1.0/>

set terminal latex size 13cm, 8cm
set output "tot-time.tex"
set format xy '%g'
set xlabel 'data processed (MiB)'
set ylabel 'time taken (s)' offset -2, 1.7, 0
set grid
set key left
plot 'tot-time' u 1:2 t 'time to process all files' w linespoints
