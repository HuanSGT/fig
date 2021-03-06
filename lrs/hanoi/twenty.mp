verbatimtex
%&LaTeX
\documentclass{article}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{MnSymbol}
\begin{document}
etex

prologues := 3;

%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%
input s;

hs := 1.75;

vardef drawllC(expr locC, col, l) =
    if (col = 1) or (col = 2):
        drawCircle(locC, white,  black, di);
    else:
        drawCircle(locC, white,  white, di);
    fi
    if col = 1:
        draw thelabel(l, locC) withcolor black;
    elseif col = 2:
        draw thelabel(l, locC) withcolor blue;
    elseif col = 0:
        draw thelabel(l, locC) withcolor black;
    fi
enddef;

vardef drawllT(expr locT, cola, colb, colc, la,lb,lc) = 
    pair loccT[];
    loccT0 := locT;
    loccT1 := loccT0 + (-lenx, -leny);
    loccT2 := loccT0 + (lenx, -leny);

    draw loccT0 .. loccT1;%withcolor colour;
    draw loccT0 .. loccT2;% withcolor colour;
    draw loccT1 .. loccT2;% withcolor colour;

    drawllC(loccT0, cola, la);
    drawllC(loccT1, colb, lb);
    drawllC(loccT2, colc, lc);

enddef;

vardef drawllG(expr locTT, a,b,c, d,e,f, g,h,i, la,lb,lc, ld,le,lf, lg,lh,li) =
    pair loccTT[];
    loccTT0 := locTT;
    loccTT1 := loccTT0 + (- linex - lenx, - liney - leny);
    loccTT2 := loccTT0 + (linex +  lenx, - liney - leny);

    drawLine(loccTT0 + (- lenx, - leny), loccTT1, b,d);
    drawLine(loccTT0 + (lenx, - leny), loccTT2, c,g);
    drawLine(loccTT1 + (lenx, -leny), loccTT2 + (-lenx,-leny), f,h);

    drawllT(loccTT0, a,b,c, la,lb,lc);
    drawllT(loccTT1, d,e,f, ld,le,lf);
    drawllT(loccTT2, g,h,i, lg,lh,li);
enddef;

vardef drawllH(expr locH,
    a,b,c,   d,e,f,   g,h,i,
    a_,b_,c_,   d_,e_,f_,   g_,h_,i_,
    a__,b__,c__,   d__,e__,f__,   g__,h__,i__,   j,
    la,lb,lc,   ld,le,lf,   lg,lh,li,
    la_,lb_,lc_,   ld_,le_,lf_,   lg_,lh_,li_,
    la__,lb__,lc__,   ld__,le__,lf__,   lg__,lh__,li__
    ) =

    label(btex $\mathcal{H}_{n + 2}$ etex scaled 2.5,locH + (0, -heightG));
    pair loccH[];
    loccH0 := locH;
    loccH1 := loccH0 + (- llinex - linex - len, - lliney - liney - 2 * leny);
    loccH2 := loccH0 + (  llinex + linex + len, - lliney - liney - 2 * leny);

    drawLine(loccH0 + (- len, - 2 * leny), loccH1, 1,1);
    drawLine(loccH0 + (len, - 2 * leny), loccH2, 1,1);
    drawLine(loccH1 + (len + linex, - 2 * leny - liney), loccH2 + (-len - linex,- 2 * leny - liney), 1,1);

    drawllG(loccH0, a,b,c,   d,e,f,   g,h,i,
            la,lb,lc,   ld,le,lf,   lg,lh,li);

    drawllG(loccH1, a_,b_,c_,   d_,e_,f_,   g_,h_,i_,
            la_,lb_,lc_,   ld_,le_,lf_,   lg_,lh_,li_);

    drawllG(loccH2, a__,b__,c__,   d__,e__,f__,   g__,h__,i__,
            la__,lb__,lc__,   ld__,le__,lf__,   lg__,lh__,li__);

enddef;

as := 1.5;

di := di * 1.5;

ls := 1.6;

circle_scale := 1.5;

beginfig(1)
    pickup pencircle scaled default_scale;
    
    drawllH((0,0),
            2,0,1,  1,1,1,  1,1,1,
            1,1,1,  1,2,1,  1,1,1,
            1,1,1,  1,1,1,  1,1,2, 1,
            btex \textbf{I} etex scaled ls, btex $\bigstar$ etex scaled 2.5, btex etex scaled ls, 
            btex \textbf{C} etex scaled ls, btex \textbf{C} etex scaled ls, btex \textbf{C} etex scaled ls, 
            btex  etex scaled ls, btex  etex scaled ls, btex  etex scaled ls, 
            btex \textbf{I} etex scaled ls, btex \textbf{D} etex scaled ls, btex \textbf{D} etex scaled ls, 
            btex \textbf{D} etex scaled ls, btex \textbf{I} etex scaled ls, btex \textbf{D} etex scaled ls, 
            btex etex scaled ls, btex etex scaled ls, btex etex scaled ls, 
            btex  etex scaled ls, btex  etex scaled ls, btex  etex scaled ls, 
            btex etex scaled ls, btex etex scaled ls, btex etex scaled ls, 
            btex  etex scaled ls, btex  etex scaled ls, btex \textbf{C} etex scaled ls
            );
    ahlength := 3u; ahangle := 60;
    %drawarrow (-0.6widthG,-1.75heightG) -- (-0.25widthG,-1.75heightG) withpen pencircle scaled 2.5;
    pair ax,ay,az, deltax;
    ax := (-0.58widthG,-1.62heightG);
    ay := (-0.23widthG,-1.62heightG);
    az := (-0.78widthG,-1.62heightG);
    ax := az + ((ax - az) rotated 60);
    ay := az + ((ay - az) rotated 60);
    deltax := (-0.5widthT,0.15heightT);
    drawarrow  (ax + deltax) -- (ay + deltax) withpen pencircle scaled 2.5;
endfig;

beginfig(0)
    pickup pencircle scaled default_scale;
    
    widthH := 1.80 * widthG;
    heightH := 2 * heightG;

    drawllH((0,0),
            1,1,1,  1,1,1,  1,1,1,
            1,1,1,  1,1,1,  1,1,1,
            1,1,1,  1,1,1,  1,1,1, 1,
            btex \textbf{I} etex scaled ls, btex \textbf{D} etex scaled ls, btex \textbf{D} etex scaled ls, 
            btex \textbf{D} etex scaled ls, btex \textbf{I} etex scaled ls, btex \textbf{D} etex scaled ls, 
            btex \textbf{D} etex scaled ls, btex \textbf{D} etex scaled ls, btex \textbf{I} etex scaled ls, 
            btex \textbf{C} etex scaled ls, btex \textbf{C} etex scaled ls, btex \textbf{C} etex scaled ls, 
            btex \textbf{I} etex scaled ls, btex \textbf{D} etex scaled ls, btex \textbf{D} etex scaled ls, 
            btex \textbf{I} etex scaled ls, btex \textbf{D} etex scaled ls, btex \textbf{D} etex scaled ls, 
            btex \textbf{C} etex scaled ls, btex \textbf{C} etex scaled ls, btex \textbf{C} etex scaled ls, 
            btex \textbf{I} etex scaled ls, btex \textbf{D} etex scaled ls, btex \textbf{D} etex scaled ls, 
            btex \textbf{I} etex scaled ls, btex \textbf{D} etex scaled ls, btex \textbf{D} etex scaled ls);

    drawllH((widthH,0),
            1,1,1,  1,1,1,  1,1,1,
            1,1,1,  1,1,1,  1,1,1,
            1,1,1,  1,1,1,  1,1,1, 1,
            btex \textbf{D} etex scaled ls, btex \textbf{I} etex scaled ls, btex \textbf{D} etex scaled ls, 
            btex \textbf{C} etex scaled ls, btex \textbf{C} etex scaled ls, btex \textbf{C} etex scaled ls, 
            btex \textbf{D} etex scaled ls, btex \textbf{I} etex scaled ls, btex \textbf{D} etex scaled ls, 
            btex \textbf{I} etex scaled ls, btex \textbf{D} etex scaled ls, btex \textbf{D} etex scaled ls, 
            btex \textbf{D} etex scaled ls, btex \textbf{I} etex scaled ls, btex \textbf{D} etex scaled ls, 
            btex \textbf{D} etex scaled ls, btex \textbf{D} etex scaled ls, btex \textbf{I} etex scaled ls, 
            btex \textbf{D} etex scaled ls, btex \textbf{I} etex scaled ls, btex \textbf{D} etex scaled ls, 
            btex \textbf{C} etex scaled ls, btex \textbf{C} etex scaled ls, btex \textbf{C} etex scaled ls, 
            btex \textbf{D} etex scaled ls, btex \textbf{I} etex scaled ls, btex \textbf{D} etex scaled ls);

    drawllH((0,-heightH),
            1,1,1,  1,1,1,  1,1,1,
            1,1,1,  1,1,1,  1,1,1,
            1,1,1,  1,1,1,  1,1,1, 1,
            btex \textbf{D} etex scaled ls, btex \textbf{D} etex scaled ls, btex \textbf{I} etex scaled ls, 
            btex \textbf{D} etex scaled ls, btex \textbf{D} etex scaled ls, btex \textbf{I} etex scaled ls, 
            btex \textbf{C} etex scaled ls, btex \textbf{C} etex scaled ls, btex \textbf{C} etex scaled ls, 
            btex \textbf{D} etex scaled ls, btex \textbf{D} etex scaled ls, btex \textbf{I} etex scaled ls, 
            btex \textbf{D} etex scaled ls, btex \textbf{D} etex scaled ls, btex \textbf{I} etex scaled ls, 
            btex \textbf{C} etex scaled ls, btex \textbf{C} etex scaled ls, btex \textbf{C} etex scaled ls, 
            btex \textbf{I} etex scaled ls, btex \textbf{D} etex scaled ls, btex \textbf{D} etex scaled ls, 
            btex \textbf{D} etex scaled ls, btex \textbf{I} etex scaled ls, btex \textbf{D} etex scaled ls, 
            btex \textbf{D} etex scaled ls, btex \textbf{D} etex scaled ls, btex \textbf{I} etex scaled ls);

    drawllH((widthH,-heightH),
            1,1,1,  1,1,1,  1,1,1,
            1,1,1,  1,1,1,  1,1,1,
            1,1,1,  1,1,1,  1,1,1, 1,
            btex \textbf{C} etex scaled ls, btex \textbf{C} etex scaled ls, btex \textbf{C} etex scaled ls, 
            btex \textbf{I} etex scaled ls, btex \textbf{D} etex scaled ls, btex \textbf{D} etex scaled ls, 
            btex \textbf{I} etex scaled ls, btex \textbf{D} etex scaled ls, btex \textbf{D} etex scaled ls, 
            btex \textbf{D} etex scaled ls, btex \textbf{I} etex scaled ls, btex \textbf{D} etex scaled ls, 
            btex \textbf{C} etex scaled ls, btex \textbf{C} etex scaled ls, btex \textbf{C} etex scaled ls, 
            btex \textbf{D} etex scaled ls, btex \textbf{I} etex scaled ls, btex \textbf{D} etex scaled ls, 
            btex \textbf{D} etex scaled ls, btex \textbf{D} etex scaled ls, btex \textbf{I} etex scaled ls, 
            btex \textbf{D} etex scaled ls, btex \textbf{D} etex scaled ls, btex \textbf{I} etex scaled ls, 
            btex \textbf{C} etex scaled ls, btex \textbf{C} etex scaled ls, btex \textbf{C} etex scaled ls);
endfig;
end;
