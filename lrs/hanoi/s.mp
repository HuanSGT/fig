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
matched_scale = 7.5;
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

di := 5.5u;

len := 20u;
lenx := len * cosd 60;
leny := len * sind 60;

line = len * 0.7;
linex := line * cosd 60;
liney := line * sind 60;

widthT  := 2 * lenx;
heightT := leny;

vardef drawT(expr locT, cola, colb, colc) = 
    pair loccT[];
    loccT0 := locT;
    loccT1 := loccT0 + (-lenx, -leny);
    loccT2 := loccT0 + (lenx, -leny);

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

widthG = 2 * len + line + 25u;
heightG = 2 * leny + liney + 20u;

pair dx, dy, dxx, dyy;
dx  := (widthG, 0);
dy  := (0, -heightG - 7.5u);
dyy := (0, -heightG + 2.5u);
dxx := (- lenx - 35u, - 0.45heightG);

%         0
%       1   2
%    [9]      [10]
%   3           6
% 4   5 [11]  7   8
%

vardef drawLine(expr x, y, matched) =
    draw x .. y;
    if matched = 1:
        draw x .. y withcolor red withpen pencircle scaled matched_scale;
    fi
enddef;

vardef drawG(expr locTT, a,b,c, d,e,f, g,h,i, x,y,z) =
    pair loccTT[];
    loccTT0 := locTT;
    loccTT1 := loccTT0 + (- linex - lenx, - liney - leny);
    loccTT2 := loccTT0 + (linex +  lenx, - liney - leny);

    drawLine(loccTT0 + (- lenx, - leny), loccTT1, x);
    drawLine(loccTT0 + (lenx, - leny), loccTT2, y);
    drawLine(loccTT1 + (lenx, -leny), loccTT2 + (-lenx,-leny), z);

    drawT(loccTT0, a,b,c);
    drawT(loccTT1, d,e,f);
    drawT(loccTT2, g,h,i);
enddef;
   
beginfig(1)
    pickup pencircle scaled default_scale;

    %drawG((-widthG,heightG), 1,0,0, 0,1,0, 0,0,1, 0,1,0);
    %drawG((0,heightG), 1,0,0, 0,1,0, 0,0,1, 1,0,1);
    drawG((0,0), 1,0,0, 0,1,0, 0,0,1, 1,1,1);
    drawG((widthG,0), 1,0,0, 0,1,0, 0,0,1, 0,0,0);
    drawG((widthG,-heightG), 1,0,0, 0,1,0, 0,0,1, 0,1,0);
    drawG((0,-heightG), 1,0,0, 0,1,0, 0,0,1, 1,0,1);

endfig;
