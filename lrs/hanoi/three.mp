verbatimtex
%&LaTeX
\documentclass{article}
\usepackage{amsmath}
\usepackage{amssymb}
\begin{document}
etex

prologues := 3;

%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%
input s;

lls := 2.75;

beginfig(1)
    pickup pencircle scaled default_scale;

    pair loc[];
    loc2 := (0,0);
    loc1 := loc2 + (0, 3.5heightT);
    loc3 := loc2 + (widthG * 1.75, heightG - 5u);

    drawlT(loc1,
            0,0,0,
            btex 0 etex scaled ls, btex 1 etex scaled ls, btex 2 etex scaled ls, 
            0,1,3);
    label(btex $n=1$ etex scaled lls, loc1 + (0, -1.8heightT));

    drawlG(loc2,
            9,9,9,  9,9,9,  9,9,9,
            btex 00 etex scaled ls, btex 20 etex scaled ls, btex 10 etex scaled ls, 
            btex 21 etex scaled ls, btex 11 etex scaled ls, btex 01 etex scaled ls, 
            btex 12 etex scaled ls, btex 02 etex scaled ls, btex 22 etex scaled ls, 
            0,1,3,  1,1,2,  3,2,3);
    label(btex $n=2$ etex scaled lls, loc2 + (0, -4heightT));

    drawH(loc3,
            9,9,9,  9,9,9,  9,9,9,
            9,9,9,  9,9,9,  9,9,9,
            9,9,9,  9,9,9,  9,9,9,  3,
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
    label(btex $n=3$ etex scaled lls, loc2 + (widthG*1.75, -4heightT));

endfig;

end;
