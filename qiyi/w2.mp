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

u := 1mm;

dfts := 1.0;
cirs := 1.0;

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
    drawCircle((0,0),green,black,10u);
endfig;

end;
