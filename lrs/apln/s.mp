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
vs = 1.0; 
gen_scale = 1.5;

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
        elseif cols[i] = 2:
            drawCircle(loccT[i], red,  black, di);
        elseif cols[i] = 3:
            drawCircle(loccT[i], green,  black, di);
        elseif cols[i] = 4:
            drawCircle(loccT[i], blue,  black, di);
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
   
widthA_one := widthT;
heightA_one := 3 * heightT;

vardef drawA_one(expr locTT) =
    pair loccTT[];
    loccTT0 := locTT;
    loccTT1 := loccTT0 + (- gapx, gapy);
    loccTT2 := loccTT0 + (gapx, gapy);

    drawT(loccTT0, 0, 0,0,0);
    drawT(loccTT0, 240, 0,0,0);
    drawT(loccTT0, 120, 0,0,0);
enddef;

Tlr := 1.5;
   
vardef drawTl(expr locT, rot_angle, la,lb,lc, lt) = 
    pair loccT[];
    loccT0 := locT;
    loccT1 := loccT0 + (-lenx, -leny);
    loccT2 := loccT0 + (lenx, -leny);

    lgapx := 6u; lgapy := 6u; ratio := 0.75;
    loccT3 := loccT0 + (0, -lgapy);
    loccT4 := loccT1 + (-ratio * lgapx,-ratio * lgapy);
    loccT5 := loccT2 + (ratio * lgapx,-ratio * lgapy);

    loccT6 := Tlr[loccT0, 0.5[loccT1, loccT2]];

    for i=1 upto 6:
        loccT[i] := loccT[0] + ((loccT[i] - loccT[0]) rotated rot_angle);
    endfor;

    draw loccT0 .. loccT1;%withcolor colour;
    draw loccT0 .. loccT2;% withcolor colour;
    draw loccT1 .. loccT2;% withcolor colour;

    numeric cols[];
    cols0 := cola; cols1 := colb; cols2 := colc;
    for i=0 upto 2:
        drawCircle(loccT[i], white,  black, di);
    endfor;

    label(la, loccT3);
    label(lb, loccT4);
    label(lc, loccT5);
    label(lt, loccT6);
enddef;

vardef drawGl(expr locTT, a,b,c, ta, d,e,f, tb, g,h,i, tc) =
    pair loccTT[];
    loccTT0 := locTT;
    loccTT1 := loccTT0 + (- gapx, gapy);
    loccTT2 := loccTT0 + (gapx, gapy);

    drawTl(loccTT0, 0, a,b,c, ta);
    drawTl(loccTT1, 240, d,e,f, tb);
    drawTl(loccTT2, 120, g,h,i, tc);
enddef;
   
beginfig(1)
    pickup pencircle scaled default_scale;
    
    drawGl((0,0), btex $X_3$ etex scaled vs,
                     btex $Y_3$ etex scaled vs,
                     btex $Z_3$ etex scaled vs,
                     btex $\mathcal{A}_n^3$ etex scaled gen_scale,
                     btex $X_1$ etex scaled vs,
                     btex $Y_1$ etex scaled vs,
                     btex $Z_1$ etex scaled vs,
                     btex $\mathcal{A}_n^1$ etex scaled gen_scale,
                     btex $X_2$ etex scaled vs,
                     btex $Y_2$ etex scaled vs,
                     btex $Z_2$ etex scaled vs,
                     btex $\mathcal{A}_n^2$ etex scaled gen_scale);

    label(btex $\Rightarrow$ etex xscaled 3.5 yscaled 5, (1.15widthT, 0.5heightT));

    %gapx := 0; gapy := 0;
    drawGl((2.2widthT,0), btex $O$ etex scaled vs,
                     btex $Y$ etex scaled vs,
                     btex $Z$ etex scaled vs,
                     btex $\mathcal{A}_n^3$ etex scaled gen_scale,
                     btex $$ etex scaled vs,
                     btex $$ etex scaled vs,
                     btex $$ etex scaled vs,
                     btex $\mathcal{A}_n^1$ etex scaled gen_scale,
                     btex $$ etex scaled vs,
                     btex $$ etex scaled vs,
                     btex $$ etex scaled vs,
                     btex $\mathcal{A}_n^2$ etex scaled gen_scale);
    label(btex $X$ etex scaled vs, (2.2widthT, 2heightT + 1.15di));
endfig;
