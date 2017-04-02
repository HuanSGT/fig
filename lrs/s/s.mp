verbatimtex
%&LaTeX
\documentclass{article}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{pifont}
\newcommand{\xmark}{\text{\ding{53}}}%
\begin{document}
etex

prologues := 3; %加入字体
%filenametemplate "%j_%c.eps";

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

dfts := 1.0;
qs0  := 2.2;
qs1  := 3.5;
qs2  := 2.0;
qs   := 1.0;
qstt := 1.4;
qss  := 1.2;
cirs := 2.5;

vardef drawCircle(expr loc, interCol, outlineCol, diameter) =
    pen prepen;
    prepen := currentpen;
    pickup pencircle scaled cirs;

    fill fullcircle scaled diameter shifted loc withcolor interCol;
    draw fullcircle scaled diameter shifted loc withcolor outlineCol;

    pickup prepen;
enddef;

vardef drawXmark(expr loc, xcolor, diameter) =
    fill fullcircle scaled diameter shifted loc withcolor white;
    label(btex $\xmark$ etex scaled qss, loc) withcolor xcolor;
enddef;

u := 1mm;

di := 5u;
dix := di * cosd 60;
diy := di * sind 60;

gap := 0.8di;
gapx := gap * cosd 60;
gapy := gap * sind 60;

len := 4di;
lenx := len * cosd 60;
leny := len * sind 60;

width := len + 3di;

widthG  := 2lenx + 2dix + 2gapx + len + 3di;
heightG := leny + diy + gapy + leny + 5di;

widthGG  := widthG - 2dix - 2gapx + 5di;
heightGG := heightG - diy - gapy;

lmargin := -4di;
halfh   := leny + 0.5di;

pair dx, dy, dxx, dnum;

dx  := (widthG, 0);
dy  := (0, -heightG);
dxx := (-widthGG, 0);
dnum := (-di, leny);

vardef drawT(expr locc, colour, cola,colb,colc) =
    pair lcc[];
    lcc0 := locc;
    lcc1 := locc + (lenx, leny);
    lcc2 := locc + (len, 0);

    draw lcc0 .. lcc1 withcolor colour;
    draw lcc0 .. lcc2 withcolor colour;
    draw lcc1 .. lcc2 withcolor colour;

    numeric cols[];
    cols0 := cola; cols1 := colb; cols2 := colc;
    for i=0 upto 2:
        if     cols[i] = 0:
            drawCircle(lcc[i], white,  colour, di);
        elseif cols[i] = 1:
            drawCircle(lcc[i], colour, colour, di);
        elseif cols[i] = 2:
            drawXmark (lcc[i], colour, di);
        fi
    endfor;
enddef;

vardef drawTT(expr locc, colour, cola,colb,colc, num, posa,posb,posc, lb) =
    pair lcc[];
    lcc0 := locc;
    lcc1 := locc + (lenx, leny);
    lcc2 := locc + (len, 0);

    draw lcc0 .. lcc1 withcolor colour;
    draw lcc0 .. lcc2 withcolor colour;
    draw lcc1 .. lcc2 withcolor colour;

    numeric cols[];
    cols0 := cola; cols1 := colb; cols2 := colc;
    for i=0 upto 2:
        if     cols[i] = 0:
            drawCircle(lcc[i], white,  colour, di);
        elseif cols[i] = 1:
            drawCircle(lcc[i], colour, colour, di);
        elseif cols[i] = 2:
            drawXmark (lcc[i], colour, di);
        fi
    endfor;

    lcc3 := 0.33333[0.43[lcc1,lcc2],lcc0];
    draw thelabel(lb,lcc3) withcolor colour;

    %label.bot(btex $A_n$ etex scaled qs, lcc0 - (0,0.6di));
    %label.top (btex $B_n$ etex scaled qs, lcc1 + (0,0.6di));
    %label.bot (btex $C_n$ etex scaled qs, lcc2 + (0, -0.6di));

    picture lbs[][], lbl;
    lbs[0][0] := btex $B_n^{(1)}$ etex scaled qss;
    lbs[0][1] := btex $B_n^{(2)}$ etex scaled qss;
    lbs[0][2] := btex $B_n^{(3)}$ etex scaled qss;
    lbs[0][3] := btex $B_{n+1}$ etex scaled qss;
    lbs[1][0] := btex $A_n^{(1)}$ etex scaled qss;
    lbs[1][1] := btex $A_n^{(2)}$ etex scaled qss;
    lbs[1][2] := btex $A_n^{(3)}$ etex scaled qss;
    lbs[1][3] := btex $A_{n+1}$ etex scaled qss;
    lbs[2][0] := btex $C_n^{(1)}$ etex scaled qss;
    lbs[2][1] := btex $C_n^{(2)}$ etex scaled qss;
    lbs[2][2] := btex $C_n^{(3)}$ etex scaled qss;
    lbs[2][3] := btex $C_{n+1}$ etex scaled qss;

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

vardef drawG(expr loc, a,b,c,d,e,f,g,h,i, lb) =
    pair lc[];
    lc0 := loc;
    %lc1 := loc + (di + lenx, di + leny);
    %lc2 := loc + (2di + len, 0);
    lc1 := loc + (lenx + dix + gapx, leny + diy + gapy);
    lc2 := lc1 + (lenx + dix + gapx, - (leny + diy + gapy));
    drawT(lc0, black, a,b,c);
    drawT(lc1, black, d,e,f);
    drawT(lc2, black, g,h,i);
    label.bot(lb, loc + (di + len, 0) + (0, -di));
enddef;

vardef drawGG(expr loc, a,b,c,d,e,f,g,h,i) =
    pair lc[];
    lc0 := loc;
    lc1 := loc + (lenx , leny);
    lc2 := lc1 + (lenx , - (leny));
    drawT(lc0, black, a,b,c);
    drawT(lc1, black, d,e,f);
    drawT(lc2, black, g,h,i);

    draw thelabel(btex $:$ etex scaled 5, lc0 + (2len + 3di, 0.23heightG));
% withcolor (0.8,0.8,0.8);
enddef;

beginfig(1)
    pickup pencircle scaled dfts;
    pair coor[], dx, dy;
    dx := (1.0widthG, 0);
    dy := (0, -heightGG);

    coor0 := (0,0);
    coor1 := coor0 + (lenx + dix + gapx, leny + diy + gapy);
    coor2 := coor1 + (lenx + dix + gapx, - (leny + diy + gapy));

    coor3 := coor0 + 1.4dx;
    coor4 := coor3 + (lenx , leny);
    coor5 := coor4 + (lenx , - (leny));

    drawTT(coor0, black, 0,0,0, 1, 2,0,2, btex $\mathcal{S}_n^{(2)}$ etex scaled qstt);
    drawTT(coor1, black, 0,0,0, 0, 6,3,5, btex $\mathcal{S}_n^{(1)}$ etex scaled qstt);
    drawTT(coor2, black, 0,0,0, 2, 2,1,2, btex $\mathcal{S}_n^{(3)}$ etex scaled qstt);

    drawTT(coor3, black, 0,0,0, 3, 0,8,8, btex $$ etex scaled qstt);
    drawTT(coor4, black, 0,0,0, 3, 8,3,8, btex $$ etex scaled qstt);
    drawTT(coor5, black, 0,0,0, 3, 8,8,1, btex $$ etex scaled qstt);

    label(btex $\mathcal{S}_{n+1}$ etex scaled 1.3, coor3 + (len,0.62leny));

    draw thelabel(btex $\Rightarrow$ etex xscaled 4.5 yscaled 7.5, coor[0] + (1.08widthG, 0.29heightG)) withcolor (0.6,0.6,0.6);
    %coor[0] := (0,0);

    %drawG(coor[0],0,0,0,0,0,0,0,0,0, btex $$ etex);
    %drawG(coor[0] + dx,0,0,0,0,1,0,0,0,0);
    %drawGG(coor[0] + 1.3dx,0,0,0,0,0,0,0,0,0);
endfig;
