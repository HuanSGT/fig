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
u := 5mm; % Unit Length
l := 10u;
lx := l * cosd(60);
ly := l * sind(60);

% Pencil Scales
numeric line[], cirs[], lbs[];
dfts := 1.0;
line[1] := 3.0;
line[2] := 2.0;
line[3] := 1.0;

cirs[1] := 2.5;
cirs[2] := 1.5;
cirs[3] := 1.0;

lbs[1] := 2;
lbs[2] := 1.5;
lbs[3] := 1.0;

color col[];
col[1] := red;
col[2] := blue;
col[3] := (1,1,0); % yellow

numeric l[], diam[];
l[1] := l;
l[2] := l[1] / 2;
l[3] := l[2] / 2;

diam[1] := 2u; 
diam[2] := 1.5u;
diam[3] := 1.0u;

pair p[];
p[1] = (0,0);
p[2] = p[1] + (lx,ly);
p[3] = p[1] + (l,0);

vardef drawCircle(expr loc, interCol, outlineCol, diameter, cirs) =
    pen prepen;
    prepen := currentpen;
    pickup pencircle scaled cirs;

    fill fullcircle scaled diameter shifted loc withcolor interCol;
    draw fullcircle scaled diameter shifted loc withcolor outlineCol;

    pickup prepen;
enddef;

vardef lbline(expr px, py, lb, lbs, gap) =
    pair pl;
    pl := (px + py) / 2.0;
    pl := pl + ((py - px) rotated 90 scaled gap);
    label(lb scaled lbs,pl);
enddef;

beginfig(1)
    pickup pencircle scaled dfts;

    for i = 1 upto 3:
        for j = i + 1 upto 3:
            draw p[i] .. p[j] withpen pencircle scaled line[1];
            lbline(p[i], p[j], btex $\pmb{4}$ etex, lbs[1], 0.08);
        endfor;
        drawCircle(p[i],col[1],black,diam[1],cirs[1]);
    endfor;
endfig;

end;
