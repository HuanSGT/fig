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


% Line Lengths
u := 1mm; % Unit Length
l := 10u;

% Pencil Scales
dfts := 1.0;
cirs := 1.0;

color col[];
col[1] := red;
col[2] := blue;
col[3] := (1,1,0); % yellow

numeric l[], diam[];
l[1] := l;
l[2] := l[1] / 2;
l[3] := l[2] / 2;

pair p[][];
p[1][1] = (0,0);
p[2][1] = (2,0);

vardef drawCircle(expr loc, interCol, outlineCol, diameter) =
    pen prepen;
    prepen := currentpen;
    pickup pencircle scaled cirs;

    fill fullcircle scaled diameter shifted loc withcolor interCol;
    draw fullcircle scaled diameter shifted loc withcolor outlineCol;

    pickup prepen;
enddef;

beginfig(1)
    pickup pencircle scaled dfts;
    drawCircle(p[1][1],col[3],black,l[2]);
    drawCircle(p[2][1],col[1],black,10u);
endfig;

end;
