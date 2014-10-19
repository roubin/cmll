#SET LINE STYLE
set style line 1 lt 1 lw 4 pt 2 pi 0 ps 0.4 lc rgb "#0060ad" #--blue
set style line 2 lt 3 lw 4 pt 2 pi 0 ps 0.4 lc rgb "#dd181f" #--red
set style line 3 lt 6 lw 4 pt 2 pi 0 ps 0.4 lc rgb "#008800" #--green
set style line 4 lt 1 lw 4 pt 2 pi 0 ps 0.4 lc rgb "#00aabb" #--blue light
set style line 5 lt 1 lw 4 pt 2 pi 0 ps 0.4 lc rgb "#ff5500" #--orange
set style line 6 lt 1 lw 4 pt 2 pi 0 ps 0.4 lc rgb "#bb0088" #--purple
set style line 7 lt 1 lw 4 pt 2 pi 0 ps 0.4 lc rgb "#346D3D" #--purple

set style fill solid noborder
set boxwidth 0.8 relative

set key t r
set xzeroaxis
set yzeroaxis

set ylabel "Time [s]"
set xlabel "cmll"
set xtics nomirror
set ytics nomirror



aa="0.0"
ab="0.1"
ac="0.2"

ba="1.0"
bb="1.1"
bc="1.2"
bd="1.3"
be="1.4"
bf="1.5"

ca="2.0"
cb="2.1"
cc="2.2"
cd="2.3"
ce="2.4"
cf="2.5"

da="3.0"
db="3.1"
dc="3.2"
dd="3.3"
de="3.4"
df="3.5"

ea="4.0"
eb="4.1"
ec="4.2"
ed="4.3"
ee="4.4"
ef="4.5"

fa="5.0"
fb="5.1"
fc="5.2"
fd="5.3"
fe="5.4"
ff="5.5"

ga="6.0"
gb="6.1"
gc="6.2"
gd="6.3"

filename(str,ext)="datas/solvingtimes.".str.".".ext

set term postscrip eps color;
set output filename(aa, "eps"); plot filename(aa, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(ab, "eps"); plot filename(ab, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(ac, "eps"); plot filename(ac, "txt") u 0:1 notitle w l ls 1 lw 1

set output filename(ba, "eps"); plot filename(ba, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(bb, "eps"); plot filename(bb, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(bc, "eps"); plot filename(bc, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(bd, "eps"); plot filename(bd, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(be, "eps"); plot filename(be, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(bf, "eps"); plot filename(bf, "txt") u 0:1 notitle w l ls 1 lw 1

set output filename(ca, "eps"); plot filename(ca, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(cb, "eps"); plot filename(cb, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(cc, "eps"); plot filename(cc, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(cd, "eps"); plot filename(cd, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(ce, "eps"); plot filename(ce, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(cf, "eps"); plot filename(cf, "txt") u 0:1 notitle w l ls 1 lw 1

set output filename(da, "eps"); plot filename(da, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(db, "eps"); plot filename(db, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(dc, "eps"); plot filename(dc, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(dd, "eps"); plot filename(dd, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(de, "eps"); plot filename(de, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(df, "eps"); plot filename(df, "txt") u 0:1 notitle w l ls 1 lw 1

set output filename(ea, "eps"); plot filename(ea, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(eb, "eps"); plot filename(eb, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(ec, "eps"); plot filename(ec, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(ed, "eps"); plot filename(ed, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(ee, "eps"); plot filename(ee, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(ef, "eps"); plot filename(ef, "txt") u 0:1 notitle w l ls 1 lw 1

set output filename(fa, "eps"); plot filename(fa, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(fb, "eps"); plot filename(fb, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(fc, "eps"); plot filename(fc, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(fd, "eps"); plot filename(fd, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(fe, "eps"); plot filename(fe, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(ff, "eps"); plot filename(ff, "txt") u 0:1 notitle w l ls 1 lw 1

set output filename(ga, "eps"); plot filename(ga, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(gb, "eps"); plot filename(gb, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(gc, "eps"); plot filename(gc, "txt") u 0:1 notitle w l ls 1 lw 1
set output filename(gd, "eps"); plot filename(gd, "txt") u 0:1 notitle w l ls 1 lw 1



f(x)=a*x+b;

fit f(x) filename(aa, "txt") u 0:1 via a,b; maa=f(0);
fit f(x) filename(ab, "txt") u 0:1 via a,b; mab=f(0);
fit f(x) filename(ac, "txt") u 0:1 via a,b; mac=f(0);

fit f(x) filename(ba, "txt") u 0:1 via a,b; mba=f(0);
fit f(x) filename(bb, "txt") u 0:1 via a,b; mbb=f(0);
fit f(x) filename(bc, "txt") u 0:1 via a,b; mbc=f(0);
fit f(x) filename(bd, "txt") u 0:1 via a,b; mbd=f(0);
fit f(x) filename(be, "txt") u 0:1 via a,b; mbe=f(0);
fit f(x) filename(bf, "txt") u 0:1 via a,b; mbf=f(0);

fit f(x) filename(ca, "txt") u 0:1 via a,b; mca=f(0);
fit f(x) filename(cb, "txt") u 0:1 via a,b; mcb=f(0);
fit f(x) filename(cc, "txt") u 0:1 via a,b; mcc=f(0);
fit f(x) filename(cd, "txt") u 0:1 via a,b; mcd=f(0);
fit f(x) filename(ce, "txt") u 0:1 via a,b; mce=f(0);
fit f(x) filename(cf, "txt") u 0:1 via a,b; mcf=f(0);

fit f(x) filename(da, "txt") u 0:1 via a,b; mda=f(0);
fit f(x) filename(db, "txt") u 0:1 via a,b; mdb=f(0);
fit f(x) filename(dc, "txt") u 0:1 via a,b; mdc=f(0);
fit f(x) filename(dd, "txt") u 0:1 via a,b; mdd=f(0);
fit f(x) filename(de, "txt") u 0:1 via a,b; mde=f(0);
fit f(x) filename(df, "txt") u 0:1 via a,b; mdf=f(0);

fit f(x) filename(ea, "txt") u 0:1 via a,b; mea=f(0);
fit f(x) filename(eb, "txt") u 0:1 via a,b; meb=f(0);
fit f(x) filename(ec, "txt") u 0:1 via a,b; mec=f(0);
fit f(x) filename(ed, "txt") u 0:1 via a,b; med=f(0);
fit f(x) filename(ee, "txt") u 0:1 via a,b; mee=f(0);
fit f(x) filename(ef, "txt") u 0:1 via a,b; mef=f(0);

fit f(x) filename(fa, "txt") u 0:1 via a,b; mfa=f(0);
fit f(x) filename(fb, "txt") u 0:1 via a,b; mfb=f(0);
fit f(x) filename(fc, "txt") u 0:1 via a,b; mfc=f(0);
fit f(x) filename(fd, "txt") u 0:1 via a,b; mfd=f(0);
fit f(x) filename(fe, "txt") u 0:1 via a,b; mfe=f(0);
fit f(x) filename(ff, "txt") u 0:1 via a,b; mff=f(0);

fit f(x) filename(ga, "txt") u 0:1 via a,b; mga=f(0);
fit f(x) filename(gb, "txt") u 0:1 via a,b; mgb=f(0);
fit f(x) filename(gc, "txt") u 0:1 via a,b; mgc=f(0);
fit f(x) filename(gd, "txt") u 0:1 via a,b; mgd=f(0);


set xrange [0:37]
set yrange [0:5]
set xtics (aa 0.4, ab 1.4, ac 2.4,\
    	   ba 3.4, bb 4.4, bc 5.4, bd 6.4, be 7.4, bf 8.4,\
    	   ca 9.4, cb 10.4, cc 11.4, cd 12.4, ce 13.4, cf 14.4,\
    	   da 15.4, db 16.4, dc 17.4, dd 18.4, de 19.4, df 20.4,\
    	   ba 21.4, eb 22.4, ec 23.4, ed 24.4, ee 25.4, ef 26.4,\
    	   fa 27.4, fb 28.4, fc 29.4, fd 30.4, fe 31.4, ff 32.4,\
    	   ga 33.4, gb 34.4, gc 35.4, gd 36.4\
	  ) rotate by 90 right 

set output "plot.eps";

set object rect from 0,0 to 0.9,maa fc ls 1
set object rect from 1,0 to 1.9,mab fc ls 1
set object rect from 2,0 to 2.9,mac fc ls 1

set object rect from 3,0 to 3.9,mba fc ls 2
set object rect from 4,0 to 4.9,mbb fc ls 2
set object rect from 5,0 to 5.9,mbc fc ls 2
set object rect from 6,0 to 6.9,mbd fc ls 2
set object rect from 7,0 to 7.9,mbe fc ls 2
set object rect from 8,0 to 8.9,mbf fc ls 2

set object rect from 9,0 to 9.9,mca fc ls 3
set object rect from 10,0 to 10.9,mcb fc ls 3
set object rect from 11,0 to 11.9,mcc fc ls 3
set object rect from 12,0 to 12.9,mcd fc ls 3
set object rect from 13,0 to 13.9,mce fc ls 3
set object rect from 14,0 to 14.9,mcf fc ls 3

set object rect from 15,0 to 15.9,mda fc ls 4
set object rect from 16,0 to 16.9,mdb fc ls 4
set object rect from 17,0 to 17.9,mdc fc ls 4
set object rect from 18,0 to 18.9,mdd fc ls 4
set object rect from 19,0 to 19.9,mde fc ls 4
set object rect from 20,0 to 20.9,mdf fc ls 4

set object rect from 21,0 to 21.9,mea fc ls 5
set object rect from 22,0 to 22.9,meb fc ls 5
set object rect from 23,0 to 23.9,mec fc ls 5
set object rect from 24,0 to 24.9,med fc ls 5
set object rect from 25,0 to 25.9,mee fc ls 5
set object rect from 26,0 to 26.9,mef fc ls 5

set object rect from 27,0 to 27.9,mfa fc ls 6
set object rect from 28,0 to 28.9,mfb fc ls 6
set object rect from 29,0 to 29.9,mfc fc ls 6
set object rect from 30,0 to 30.9,mfd fc ls 6
set object rect from 31,0 to 31.9,mfe fc ls 6
set object rect from 32,0 to 32.9,mff fc ls 6

set object rect from 33,0 to 33.9,mga fc ls 7
set object rect from 34,0 to 34.9,mgb fc ls 7
set object rect from 35,0 to 35.9,mgc fc ls 7
set object rect from 36,0 to 36.9,mgd fc ls 7

plot 0 notitle w l



set output
