10 SCREEN 1,,0
20 COLOR 15,1
30 KEYOFF
40 A=ASC("q")*8+BASE(7)
50 FOR I=0 TO (8*5)-1
60 READ D$
70 VPOKE A+I,VAL("&B"+D$)
80 NEXT I
90 WIDTH 32
100 FOR I=0 TO 23
110 READ M$
120 LOCATE 0,I,0
130 PRINT M$;
140 NEXT I
150 D=0
160 DIM PX(2)
170 DIM PY(2)
180 DIM ST(2)
190 PX(0)=15:PY(0)=9:ST(0)=1
200 PX(1)=1:PY(1)=10:ST(1)=1
210 PX(2)=23:PY(2)=19:ST(2)=1
220 FOR I=0 TO 2
230 LOCATE PX(I),PY(I):PRINT CHR$(ASC("r")+I);
240 NEXT I
250 A$=INKEY$
260 IF A$="T" THEN END
270 FOR I=0 TO 2
280 IF STICK(I)=1 THEN X=0:Y=-1:P=I:GOSUB 600
290 IF STICK(I)=3 THEN X=1:Y=0:P=I:GOSUB 600
300 IF STICK(I)=5 THEN X=0:Y=1:P=I:GOSUB 600
310 IF STICK(I)=7 THEN X=-1:Y=0:P=I:GOSUB 600
320 IF I=0 AND STRIG(0)=-1 THEN GOSUB 540
330 IF I=1 AND STRIG(1)=-1 THEN X=-1:GOSUB 480
340 IF I=1 AND STRIG(3)=-1 THEN X=1:GOSUB 480
350 IF I=2 AND STRIG(2)=-1 THEN X=-1:GOSUB 420
360 IF I=2 AND STRIG(4)=-1 THEN X=1:GOSUB 420
370 NEXT I
380 IF D=40 THEN GOSUB 400
390 GOTO 250
400 LOCATE 31,22:PRINT " ";
410 RETURN
420 IF ST(2)=0 THEN RETURN
430 X=X+PX(2):Y=PY(2)
440 IF X=PX(0) AND Y=PY(0) THEN RETURN
450 GOSUB 580
460 IF R$=" " THEN LOCATE X,Y:PRINT "q";:RETURN
470 RETURN
480 IF ST(1)=0 THEN RETURN
490 X=X+PX(1):Y=PY(1)
500 IF X=0 OR X=31 THEN RETURN
510 GOSUB 580
520 IF R$="q" THEN LOCATE X,Y:PRINT " ";:RETURN
530 RETURN
540 IF ST(0)=1 THEN ST(0)=2 ELSE ST(0)=1
550 LOCATE PX(0),PY(0)
560 IF ST(0)=1 THEN PRINT "r"; ELSE PRINT " ";
570 RETURN
580 R$=CHR$(VPEEK(BASE(5)+X+Y*32))
590 RETURN
600 X=X+PX(P):Y=Y+PY(P)
610 GOSUB 580
620 IF ST(P)=0 THEN RETURN
630 IF R$="q" THEN RETURN
640 IF P=0 THEN 770
650 IF X=PX(0) AND Y=PY(0) THEN RETURN
660 IF R$="u" THEN D=D+1
670 IF R$="s" AND P=2 THEN RETURN
680 IF R$="t" AND P=1 THEN RETURN
690 LOCATE PX(P),PY(P):PRINT " ";
700 PX(P)=X:PY(P)=Y
710 LOCATE PX(P),PY(P):PRINT CHR$(ASC("r")+P);
720 IF X=31 AND Y=22 THEN 740
730 RETURN
740 CLS
750 LOCATE 11,11:PRINT "SUCESSO!";
760 END
770 IF R$="s" THEN ST(1)=0
780 IF R$="t" THEN ST(2)=0
790 IF ST(1)=0 AND ST(2)=0 THEN 860
800 IF R$="u" THEN RETURN
810 IF ST(0)=2 THEN BEEP
820 LOCATE PX(P),PY(P):PRINT " ";
830 PX(0)=X:PY(0)=Y
840 IF ST(0)=1 THEN LOCATE PX(0),PY(0):PRINT "r";
850 RETURN
860 CLS
870 LOCATE 11,11:PRINT "FRACASSO!";
880 END
890  DATA 11111111
900  DATA 10000000
910  DATA 10000000
920  DATA 10000000
930  DATA 11111111
940  DATA 00001000
950  DATA 00001000
960  DATA 00001000
970  DATA 00000000
980  DATA 00000110
990  DATA 00001011
1000 DATA 00001110
1010 DATA 00011100
1020 DATA 10111110
1030 DATA 01111110
1040 DATA 10111101
1050 DATA 00111000
1060 DATA 00111000
1070 DATA 00011000
1080 DATA 00111100
1090 DATA 01011010
1100 DATA 00011000
1110 DATA 00100100
1120 DATA 01100110
1130 DATA 00011100
1140 DATA 00011100
1150 DATA 00011000
1160 DATA 00111100
1170 DATA 01011010
1180 DATA 00011000
1190 DATA 00100100
1200 DATA 01100110
1210 DATA 00111100
1220 DATA 01000010
1230 DATA 10100101
1240 DATA 01011010
1250 DATA 01000010
1260 DATA 00100100
1270 DATA 00100100
1280 DATA 00011000
1290 DATA "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq"
1300 DATA "quuu q   u    q     uu   q  uuuq"
1310 DATA "q    q qq qqq q   q    q q qqqqq"
1320 DATA "qqqq q q      q qqqqq  q q q  uq"
1330 DATA "q uq     qq q       q    q   quq"
1340 DATA "q qqqqqqqqu qqq qqq qqqq qqqqqqq"
1350 DATA "q  q        qu  quq  q         q"
1360 DATA "qq q q qqqqqqqqqq q  q q qqq q q"
1370 DATA "q  q q          q q  q q     q q"
1380 DATA "q qq qqqqq qq          q q qqq q"
1390 DATA "q      q   qq q qqqqqqqq q qq  q"
1400 DATA "q qqqq q      q             q qq"
1410 DATA "q q    q qqqqqq qqqqq qqqqq q qq"
1420 DATA "q q u qq q         uq q       qq"
1430 DATA "q q      q qqqq q q q q qqqqqqqq"
1440 DATA "q qqqq qqq q    q  uq q        q"
1450 DATA "q            qqqq qqqqqqqqqqqq q"
1460 DATA "q qqqqqq qqq   uq q       quuq q"
1470 DATA "q quuuuq q   qqqq q qqqqq q  q q"
1480 DATA "q qu  uqqq qqq          q qu q q"
1490 DATA "q quuuuq    uq qqq qqqqqq qq q q"
1500 DATA "q qqqqqq qqqqq qqq   uq      quq"
1510 DATA "q                  quuq qquququq"
1520 DATA "qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq"
