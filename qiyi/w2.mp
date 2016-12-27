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
l := 15u;
lx := l * cosd(60);
ly := l * sind(60);

theta := 30;
eta   := (60 - theta) / 2;

% Pencil Scales
numeric line[], cirs[], lbs[];
dfts := 1.0;
line[1] := 3.0;
line[2] := 2.0;
line[3] := 1.0;
line[4] := 1.0;

cirs[1] := 2.5;
cirs[2] := 1.5;
cirs[3] := 1.0;
cirs[4] := 1.0;

lbs[1] := 2.5;
lbs[2] := 2;
lbs[3] := 1.5;

color col[];
col[1] := red;
col[2] := blue;
col[4] := green;
col[3] := (1,1,0); % yellow

numeric l[], diam[];
l[1] := l;
l[2] := l[1] / 2;
l[3] := l[2] / 2;
l[4] := l / 4;

diam[1] := 2u; 
diam[2] := 1.5u;
diam[3] := 1u;
diam[4] := 1u;

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

vardef drawTT(expr pi, pj) =
    pair pk;
    pk := pi + ((pj - pi) rotated 60);
    draw pi .. pj withpen pencircle scaled line[3];
    draw pi .. pk withpen pencircle scaled line[3];
    draw pj .. pk withpen pencircle scaled line[3];

    drawCircle(pj, col[3], black, diam[3], cirs[3]);
    drawCircle(pk, col[3], black, diam[3], cirs[3]);
enddef;

vardef drawT(expr px, py) = 
    pair pz;
    pz := px + ((py - px) rotated 60);

    draw px .. py withpen pencircle scaled line[2];
    draw px .. pz withpen pencircle scaled line[2];
    draw py .. pz withpen pencircle scaled line[2];

    lbline(py, px, btex $\pmb{2}$ etex, lbs[2], 0.1);
    lbline(pz, py, btex $\pmb{2}$ etex, lbs[2], 0.1);
    lbline(px, pz, btex $\pmb{2}$ etex, lbs[2], 0.1);

    drawTT(pz, pz + (pz - px) / 2);
    drawTT(py, py + (py - pz) / 2);

    drawCircle(py, col[2], black, diam[2], cirs[2]);
    drawCircle(pz, col[2], black, diam[2], cirs[2]);
enddef;

vardef drawDD(expr pi, pj) =
    pair pk;
    pk := pi + ((pj - pi) rotated theta);
    
    draw pi .. pj withpen pencircle scaled line[4];
    draw pi .. pk withpen pencircle scaled line[4];
    draw pj .. pk withpen pencircle scaled line[4];

    drawCircle(pj, col[4], black, diam[4], cirs[4]);
    drawCircle(pk, col[4], black, diam[4], cirs[4]);
enddef;

vardef drawD(expr px, py) =
    drawDD(px, px + ((py - px) rotated eta));
    drawDD(px, px + ((py - px) rotated (eta + 90)));
    drawDD(px, px + ((py - px) rotated (eta - 90)));
enddef;

beginfig(1)
    pickup pencircle scaled dfts;

    drawT(p[1], p[1] + (-l,0)   / 2);
    drawT(p[2], p[2] + (lx,ly)  / 2);
    drawT(p[3], p[3] + (lx,-ly) / 2);

    drawD(p[1], p[1] + (l,0)     / 3);
    drawD(p[2], p[2] + (-lx,-ly) / 3);
    drawD(p[3], p[3] + (-lx,ly)  / 3);

    lbline(p[1], p[2], btex $\pmb{4}$ etex, lbs[1], 0.06);
    lbline(p[2], p[3], btex $\pmb{4}$ etex, lbs[1], 0.06);
    lbline(p[3], p[1], btex $\pmb{4}$ etex, lbs[1], 0.06);

    for i = 1 upto 3:
        for j = i + 1 upto 3:
            draw p[i] .. p[j] withpen pencircle scaled line[1];
        endfor;
        drawCircle(p[i], col[1], black, diam[1], cirs[1]);
    endfor;
endfig;

end;
