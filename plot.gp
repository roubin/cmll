set style fill solid noborder
set boxwidth 0.8 relative

set key t r
set xzeroaxis
set yzeroaxis

set ylabel "Time [s]"
set xlabel "iteration"
set xtics nomirror
set ytics nomirror

cmlls="0.0 0.1 0.2 \
       1.0 1.1 1.2 1.3 1.4 1.5 \
       2.0 2.1 2.2 2.3 2.4 2.5 \
       3.0 3.1 3.2 3.3 3.4 3.5 \
       4.0 4.1 4.2 4.3 4.4 4.5 \
       5.0 5.1 5.2 5.3 5.4 5.5 \
       6.0 6.1 6.2 6.3 6.4 6.5 \
       7.0 7.1 7.2 7.3"
names="W-W W-Y W-J \
       AS-L AS-R AS-F AS-B AS-C AS-X \
       S-L S-R S-F S-B S-C S-X \
       BT-L BT-B BT-X BT-F BT-C BT-R \
       H-BP H-FP H-FS H-BS H-C H-X \
       Bl-LP Bl-RP Bl-Ro Bl-Co BL-BP Bl-FP \
       Br-L Br-R Br-B Br-F Br-C Br-X \
       DH-C DH-R DH-F DH-R"

colors="#00060ad #00060ad #00060ad \
	#dd181f #dd181f #dd181f #dd181f #dd181f #dd181f \
	#008800 #008800 #008800 #008800 #008800 #008800 \
	#00aabb #00aabb #00aabb #00aabb #00aabb #00aabb \
	#ff5500 #ff5500 #ff5500 #ff5500 #ff5500 #ff5500 \
	#bb0088 #bb0088 #bb0088 #bb0088 #bb0088 #bb0088 \
	#346D3D #346D3D #346D3D #346D3D #346D3D #346D3D \
	#652397 #652397 #652397 #652397"


filename(str,ext)="datas/solvingtimes.".str.".".ext

set term postscrip eps color;

file_exists(file) = system("[ -f '".file."' ] && echo '1' || echo '0'") + 0


set key hor outside
set output "timeVSiter.eps"
plot for [i=1:words(cmlls)] filename(word(cmlls, i), "txt") u 0:1 title word(names, i) w lp


f(x)=a*x+b;
max_avg=1.0;
avg_tot=0.0;
n_avg=0;

do for [i=1:words(cmlls)] {
   if (file_exists(filename(word(cmlls,i), "txt"))) {
     stats filename(word(cmlls,i), "txt") u 0:1
     #set output filename(word(cmlls, i), "eps"); plot filename(word(cmlls, i), "txt") u 0:1 title word(names, i) w lp lw 6 lc rgb "#00060ad"
     avg=STATS_sum_y/STATS_records
     set object rect from i-0.9,0 to sprintf("%f", i-0.1) ,avg fc rgb word(colors,i)
     if (max_avg<avg) { max_avg=avg; avg_tot=avg_tot+avg; n_avg=n_avg+1; }
   }
}

set xrange [0:43]
set xlabel "cmll"
set yrange [0:max_avg*(1.1)]
set xtics (word(names,1) 0.5); do for [i=2:words(names)] { set xtics add (word(names,i) i-0.5) } 
set xtics rotate by 90 right
set grid ytics

#set ytics .5

set output "timeVScmll.eps"; plot avg_tot/n_avg notitle w l lw 2




set output
