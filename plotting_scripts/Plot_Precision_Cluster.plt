names = "ECM29"

do for [file in names]{ 
reset

set terminal pdfcairo enhanced color font "Arial-Bold, 40" size 10,10
set border lw 5 lc rgb "#484848"

set xr [0:125]
set yr [0:1.1]

set xtics 0, 25, 125 tc rgb "#484848"
set ytics 0,0.25,1 tc rgb "#484848"
set format y "%.2f"

set encoding iso_8859_1 
set xlabel "Threshold ({\305})" tc rgb "#484848" font "Arial-Bold, 57"
set ylabel "Convergence Criteria" tc rgb "#484848" font "Arial-Bold, 57"

set key above width -2 vertical maxrows 3 tc rgb "#484848"

set linetype 5 dashtype 2 lw 10
set arrow nohead from 0,0.05 to 125,0.05 lt 5 lw 10 lc rgb "#FF4500" back filled
set arrow nohead from 0,0.10 to 125,0.10 lt 5 lw 10 lc rgb "#5B6FB5" back filled
set arrow nohead from 0,0.80 to 125,0.80 lt 5 lw 10 lc rgb "#61B329" back filled
set arrow nohead from 55.92,0 to 55.92,1.1 lt 5 lw 10 lc rgb "#484848" back filled

set output sprintf("%s_Precision.pdf" , file)
plot "Clustering_Results.txt"	      usi 1:3 w p pt 7 ps 1.5 lc rgb "#FF4500" title "{/Symbol c}^2-test p-value", \
     "" 	            	      usi 1:4 w p pt 5 ps 1.5 lc rgb "#5B6FB5" title "Cramer's V", \
     ""				      usi 1:($2/100) w p pt 9 ps 1.5 lc rgb "#61B329" title "Clustered population"

set output
}