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
filenametemplate "%j_%c.eps";

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

default_scale = 1.5;
circle_scale = 2.5;
eq_scale = 2.5;

vardef drawCircle(expr loc, interCol, outlineCol, diameter) =
    pen prepen;
    prepen := currentpen;
    pickup pencircle scaled circle_scale;

    fill fullcircle scaled diameter shifted loc withcolor interCol;
    draw fullcircle scaled diameter shifted loc withcolor outlineCol;

    pickup prepen;
enddef;

u := 1mm;

di := 5u;

len := 25u;
lenx := len * cosd 30;
leny := len * sind 30;

widthT  := 2 * lenx;
heightT := leny;

vardef drawT(expr locT, rot_angle, cola, colb, colc) = 
    pair loccT[];
    loccT0 := locT;
    loccT1 := loccT0 + (-lenx, -leny);
    loccT2 := loccT0 + (lenx, -leny);

    for i=1 upto 2:
        loccT[i] := loccT[0] + ((loccT[i] - loccT[0]) rotated rot_angle);
    endfor;

    draw loccT0 .. loccT1;%withcolor colour;
    draw loccT0 .. loccT2;% withcolor colour;
    draw loccT1 .. loccT2;% withcolor colour;

    numeric cols[];
    cols0 := cola; cols1 := colb; cols2 := colc;
    for i=0 upto 2:
        if cols[i] = 0:
            drawCircle(loccT[i], white,  black, di);
        else:
            drawCircle(loccT[i], black,  black, di);
        fi
    endfor;
enddef;

gapx := di;% - 1u;
gapy := di;% + 1u;

widthG = widthT + 25u;
heightG = widthT + 20u;

pair dx, dy, dxx, dyy;
dx  := (widthG, 0);
dy  := (0, -heightG - 5u);
dyy := (0, -heightG + 7.5u);
dxx := (- lenx - 20u, 0);

vardef drawG(expr locTT, a,b,c, d,e,f, g,h,i) =
    pair loccTT[];
    loccTT0 := locTT;
    loccTT1 := loccTT0 + (- gapx, gapy);
    loccTT2 := loccTT0 + (gapx, gapy);

    drawT(loccTT0, 0, a,b,c);
    drawT(loccTT1, 240, d,e,f);
    drawT(loccTT2, 120, g,i,h);
enddef;
   
beginfig(1)
    pickup pencircle scaled default_scale;
    drawG((0,0), 1,0,0, 0,1,0, 0,0,1);
    drawG((widthG,0), 1,0,0, 0,1,0, 0,0,1);
    drawG((widthG,-heightG), 1,0,0, 0,1,0, 0,0,1);
    drawG((0,-heightG), 1,0,0, 0,1,0, 0,0,1);

endfig;
