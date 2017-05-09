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

hs := 1.75;

beginfig(1)
    pickup pencircle scaled default_scale;

    drawH((widthG,0),
            9,9,9,  9,9,9,  9,9,9,
            9,9,9,  9,9,9,  9,9,9,
            9,9,9,  9,9,9,  9,9,9,  9,
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

end;
