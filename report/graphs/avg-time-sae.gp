# combox - report - 2016
#
#
# benchmark - avg. time to split and encrypt file  - gnuplot
#
# By Siddharth Ravikumar <sravik@bgsu.edu>
#
# No rights reserved. Dedicated to Public Domain.
# <https://creativecommons.org/publicdomain/zero/1.0/>

set terminal latex size 13cm, 8cm
set output "avg-time-sae.tex"
set format xy '%g'
set xlabel 'total size of files processed (MiB)'
set ylabel 'avg time taken (ms)' offset 0, 2, 0
set grid
set key left
plot 'avg-time-sae' u 1:2 t 'avg. time to split \& encrypt file' w linespoints
