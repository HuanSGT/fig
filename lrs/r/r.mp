verbatimtex
%&LaTeX
\documentclass{article}
\usepackage{amsmath}
\usepackage{amssymb}
\begin{document}
etex

prologues := 3; %加入字体
filenametemplate "%j_%c.eps";

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vardef drawCircle(expr loc, interCol, outlineCol, diameter) =
    pen prepen;
    prepen:=currentpen;
    pickup pencircle scaled 2.5;

    fill fullcircle scaled diameter shifted loc withcolor interCol;
    draw fullcircle scaled diameter shifted loc withcolor outlineCol;

    pickup prepen;
enddef;

u := 1mm;

dfts := 1.0;
qs0  := 3.5;
qs   := 1.6;
qss  := 1.3;

di := 5u;

gap := di;%0u;%di + 0.5di;
crev := di + di;

len := 4di;
lenx := len * cosd 60;
leny := len * sind 60;

width  := 2lenx + 7di + len;
height := 2leny + 6di;

lmargin := -4di;
halfh   := leny + 0.5di;

vardef drawT(expr locc, col_node, colour, cola,colb,colc, num, posa,posb,posc, lb) =
    pair lcc[];
    lcc0 := locc + (0.5len, 0);
    lcc1 := locc + (0,leny);
    lcc2 := locc + (len, leny);

    draw lcc0 .. lcc1 withcolor colour;
    draw lcc0 .. lcc2 withcolor colour;
    draw lcc1 .. lcc2 withcolor colour;

    color cols[],colors[];
    colors[0] := white; colors[1] := col_node;
    cols0 := colors[cola]; cols1 := colors[colb]; cols2 := colors[colc];
    for i=0 upto 2:
        drawCircle(lcc[i],cols[i],col_node,di);
    endfor;

    lcc3 := 0.33333[0.57[lcc1,lcc2],lcc0];
    draw thelabel(lb,lcc3) withcolor colour;

    picture lbs[][], lbl;
    lbs[0][0] := btex $A_n^{(1)}$ etex scaled qss;
    lbs[0][1] := btex $A_n^{(2)}$ etex scaled qss;
    lbs[0][2] := btex $A_n^{(3)}$ etex scaled qss;
    lbs[1][0] := btex $B_n^{(1)}$ etex scaled qss;
    lbs[1][1] := btex $B_n^{(2)}$ etex scaled qss;
    lbs[1][2] := btex $B_n^{(3)}$ etex scaled qss;
    lbs[2][0] := btex $C_n^{(1)}$ etex scaled qss;
    lbs[2][1] := btex $C_n^{(2)}$ etex scaled qss;
    lbs[2][2] := btex $C_n^{(3)}$ etex scaled qss;

    numeric poses[];
    poses[0] := posa;
    poses[1] := posb;
    poses[2] := posc;

    for i=0 upto 2:
        lbl := lbs[i][num];
        if      poses[i] = 0:
            label.lft (lbl,lcc[i] - (0.5di,0)) withcolor colour;
        elseif poses[i] = 1:
            label.rt  (lbl,lcc[i] + (0.5di,0)) withcolor colour;
        elseif poses[i] = 2:
            label.bot (lbl,lcc[i] - (0,0.5di)) withcolor colour;
        elseif poses[i] = 3:
            label.top (lbl,lcc[i] + (0,0.5di)) withcolor colour;
        elseif poses[i] = 4:
            label.llft(lbl,lcc[i] - (0.3di, 0.3di)) withcolor colour;
        elseif poses[i] = 5:
            label.urt (lbl,lcc[i] + (0.3di, 0.3di)) withcolor colour;
        elseif poses[i] = 6:
            label.ulft(lbl,lcc[i] - (0.2di,-0.2di)) withcolor colour;
        elseif poses[i] = 7:
            label.lrt (lbl,lcc[i] + (0.2di,-0.2di)) withcolor colour;
        fi
    endfor;
enddef;

vardef drawG(expr loc, a,b,c,d,e,f,g,h,i) =
    pair lc[];
    lc0 := loc + (0, leny + di);
    lc1 := loc + (2di + len, leny + di);
    lc2 := loc + (lenx + di, 0);
    drawT(lc0, black, black, a,b,c, 0, 0,6,3, btex $\mathcal{G}_n^{(1)}$ etex scaled qs);
    drawT(lc1, blue, blue,  d,e,f, 1, 1,3,5, btex $\mathcal{G}_n^{(2)}$ etex scaled qs);
    drawT(lc2, red, red,   g,h,i, 2, 2,4,7, btex $\mathcal{G}_n^{(3)}$ etex scaled qs);
enddef;

vardef drawGG(expr loc, a,b,c,d,e,f,g,h,i) =
    pair lc[];
    lc0 := loc + (0, leny);
    lc1 := loc + (len, leny);
    lc2 := loc + (lenx, 0);
    drawT(lc0, black, black, a,b,c, 0, 8,8,8, btex $\mathcal{G}_n^{(1)}$ etex scaled qs);
    drawT(lc1, black, blue, d,e,f, 1, 8,8,8, btex $\mathcal{G}_n^{(2)}$ etex scaled qs);
    drawT(lc2, black, red,  g,h,i, 2, 8,8,8, btex $\mathcal{G}_n^{(3)}$ etex scaled qs);
    label.lft(btex $A_{n+1}$ etex scaled qss, 0.3[lc0,lc1]);
    label.rt (btex $C_{n+1}$ etex scaled qss, 0.7[lc0+(len,0),lc1+(len,0)]);
    label.top(btex $B_{n+1}$ etex scaled qss, lc0 + (len,leny + 0.2leny));
    label.bot(btex $\mathcal{G}_{n+1}$ etex scaled qs, lc0 + (len,-1.2leny));
enddef;
