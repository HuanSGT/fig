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
ls = 1.5;

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

color yellow;
yellow := (1,1,0);

vardef drawC(expr locC, col) =
    if (col = 0) or (col = 9):
        drawCircle(locC, white,  black, di);
    elseif col = 1:
        drawCircle(locC, black,  black, di);
    elseif col = 2:
        drawCircle(locC, red, black, di);
    elseif col = 3:
        drawCircle(locC, green, black, di);
    elseif col = 4:
        drawCircle(locC, blue, black, di);
    elseif col = 5:
        drawCircle(locC, yellow, black, di);
    fi
enddef;

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
        drawC(loccT[i], cols[i]);
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

vardef drawLine(expr x, y, a,b) =
    draw x .. y;
    if (a = 0) and (b = 0):
        draw x .. y withcolor red withpen pencircle scaled matched_scale;
    fi
enddef;

vardef drawG(expr locTT, a,b,c, d,e,f, g,h,i) =
    pair loccTT[];
    loccTT0 := locTT;
    loccTT1 := loccTT0 + (- linex - lenx, - liney - leny);
    loccTT2 := loccTT0 + (linex +  lenx, - liney - leny);

    drawLine(loccTT0 + (- lenx, - leny), loccTT1, b,d);
    drawLine(loccTT0 + (lenx, - leny), loccTT2, c,g);
    drawLine(loccTT1 + (lenx, -leny), loccTT2 + (-lenx,-leny), f,h);

    drawT(loccTT0, a,b,c);
    drawT(loccTT1, d,e,f);
    drawT(loccTT2, g,h,i);
enddef;

vardef drawGNL(expr locTT, a,b,c, d,e,f, g,h,i) =
    pair loccTT[];
    loccTT0 := locTT;
    loccTT1 := loccTT0 + (- linex - lenx, - liney - leny);
    loccTT2 := loccTT0 + (linex +  lenx, - liney - leny);

    %drawLine(loccTT0 + (- lenx, - leny), loccTT1, b,d);
    %drawLine(loccTT0 + (lenx, - leny), loccTT2, c,g);
    %drawLine(loccTT1 + (lenx, -leny), loccTT2 + (-lenx,-leny), f,h);

    drawT(loccTT0, a,b,c);
    drawT(loccTT1, d,e,f);
    drawT(loccTT2, g,h,i);
enddef;

lgap := 0.7 * di;

vardef drawlC(expr locC, col, l, q) =
    drawC(locC, col);
    if q = 0:
        label.top(l, locC + (0, lgap));
    elseif q = 1:
        label.lft(l, locC + (-lgap, 0));
    elseif q = 2:
        label.bot(l, locC + (0, -lgap));
    elseif q = 3:
        label.rt(l, locC + (lgap, 0));
    fi
enddef;

vardef drawlT(expr locT, cola, colb, colc, la,lb,lc, qa,qb,qc) = 
    pair loccT[];
    loccT0 := locT;
    loccT1 := loccT0 + (-lenx, -leny);
    loccT2 := loccT0 + (lenx, -leny);

    draw loccT0 .. loccT1;%withcolor colour;
    draw loccT0 .. loccT2;% withcolor colour;
    draw loccT1 .. loccT2;% withcolor colour;

    drawlC(loccT0, cola, la, qa);
    drawlC(loccT1, colb, lb, qb);
    drawlC(loccT2, colc, lc, qc);

enddef;

vardef drawlG(expr locTT, a,b,c, d,e,f, g,h,i, la,lb,lc, ld,le,lf, lg,lh,li, qa,qb,qc, qd,qe,qf, qg,qh,qi) =
    pair loccTT[];
    loccTT0 := locTT;
    loccTT1 := loccTT0 + (- linex - lenx, - liney - leny);
    loccTT2 := loccTT0 + (linex +  lenx, - liney - leny);

    drawLine(loccTT0 + (- lenx, - leny), loccTT1, b,d);
    drawLine(loccTT0 + (lenx, - leny), loccTT2, c,g);
    drawLine(loccTT1 + (lenx, -leny), loccTT2 + (-lenx,-leny), f,h);

    drawlT(loccTT0, a,b,c, la,lb,lc, qa,qb,qc);
    drawlT(loccTT1, d,e,f, ld,le,lf, qd,qe,qf);
    drawlT(loccTT2, g,h,i, lg,lh,li, qg,qh,qi);
enddef;

lline = line * 1.2;
llinex := lline * cosd 60;
lliney := lline * sind 60;

vardef drawH(expr locH,
    a,b,c,   d,e,f,   g,h,i,
    a_,b_,c_,   d_,e_,f_,   g_,h_,i_,
    a__,b__,c__,   d__,e__,f__,   g__,h__,i__,   j,
    la,lb,lc,   ld,le,lf,   lg,lh,li,
    la_,lb_,lc_,   ld_,le_,lf_,   lg_,lh_,li_,
    la__,lb__,lc__,   ld__,le__,lf__,   lg__,lh__,li__,
    qa,qb,qc,   qd,qe,qf,   qg,qh,qi,
    qa_,qb_,qc_,   qd_,qe_,qf_,   qg_,qh_,qi_,
    qa__,qb__,qc__,   qd__,qe__,qf__,   qg__,qh__,qi__
    ) =

    pair loccH[];
    loccH0 := locH;
    loccH1 := loccH0 + (- llinex - linex - len, - lliney - liney - 2 * leny);
    loccH2 := loccH0 + (  llinex + linex + len, - lliney - liney - 2 * leny);
    loccH3 := 0.5[loccH1,loccH2] + (0, -liney - 2*leny - 2*leny - liney);

    drawLine(loccH0 + (- len, - 2 * leny), loccH1, 1,1);
    drawLine(loccH0 + (len, - 2 * leny), loccH2, 1,1);
    drawLine(loccH1 + (len + linex, - 2 * leny - liney), loccH2 + (-len - linex,- 2 * leny - liney), 1,1);

    %drawLine(loccH0, loccH3, 1,1);
    %drawLine(loccH1 + (- len - linex, - 2 * leny - liney), loccH3, 1,1);
    %drawLine(loccH2 + (len + linex,- 2 * leny - liney), loccH3, 1,1);

    %drawC(loccH3, 3);

    drawlG(loccH0, a,b,c,   d,e,f,   g,h,i,
            la,lb,lc,   ld,le,lf,   lg,lh,li,
            qa,qb,qc,   qd,qe,qf,   qg,qh,qi);

    drawlG(loccH1, a_,b_,c_,   d_,e_,f_,   g_,h_,i_,
            la_,lb_,lc_,   ld_,le_,lf_,   lg_,lh_,li_,
            qa_,qb_,qc_,   qd_,qe_,qf_,   qg__,qh_,qi_);

    drawlG(loccH2, a__,b__,c__,   d__,e__,f__,   g__,h__,i__,
            la__,lb__,lc__,   ld__,le__,lf__,   lg__,lh__,li__,
            qa__,qb__,qc__,   qd__,qe__,qf__,   qg__,qh__,qi__);

enddef;
   
% r g b y
% 2 3 4 5
%
beginfig(1)
    pickup pencircle scaled default_scale;

    %drawG((-widthG,heightG), 1,0,0, 0,1,0, 0,0,1, 0,1,0);
    %drawG((0,heightG), 1,0,0, 0,1,0, 0,0,1, 1,0,1);
    %drawG((0,0), 0,1,2,3,4,5,0,1,2);
    drawH((widthG,0),
            4,5,2,  3,4,2,  3,5,4,
            5,3,2,  4,5,2,  4,3,5,
            2,5,3,  4,2,3,  4,5,2,  3,
            btex 000 etex scaled ls, btex 100 etex scaled ls, btex 200 etex scaled ls, 
            btex 120 etex scaled ls, btex 220 etex scaled ls, btex 020 etex scaled ls, 
            btex 210 etex scaled ls, btex 010 etex scaled ls, btex 110 etex scaled ls, 
            btex 221 etex scaled ls, btex 021 etex scaled ls, btex 121 etex scaled ls, 
            btex 011 etex scaled ls, btex 111 etex scaled ls, btex 211 etex scaled ls, 
            btex 101 etex scaled ls, btex 201 etex scaled ls, btex 001 etex scaled ls, 
            btex 112 etex scaled ls, btex 212 etex scaled ls, btex 012 etex scaled ls, 
            btex 202 etex scaled ls, btex 002 etex scaled ls, btex 102 etex scaled ls, 
            btex 022 etex scaled ls, btex 122 etex scaled ls, btex 222 etex scaled ls, 
            0,1,3,  1,1,2,  3,2,3,
            1,1,3,  1,1,2,  3,2,2,
            3,1,3,  1,2,2,  3,2,3
            );
    

endfig;
