verbatimtex
%&LaTeX
\documentclass{article}
\usepackage{amsmath}
\usepackage{amssymb}
\begin{document}
etex

prologues := 3; %加入字体
filenametemplate "%j_%c.eps";

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

input r;

beginfig(1)
    pickup pencircle scaled dfts;

    pair coor[], dx, dy;
    dx := (width, 0);
    dy := (0, -height);
    coor[0] := (0,0);
    label.lft(btex $(a)$ etex scaled qs0, coor[0] + (lmargin, halfh));

    coor[1] := coor[0] + dy;
    label.lft(btex $(b)$ etex scaled qs0, coor[1] + (lmargin, halfh));
    for i=2 upto 3:
        coor[i] := coor[i - 1] + dx;
    endfor;

    coor[4] := coor[1] + dy;
    label.lft(btex $(c)$ etex scaled qs0, coor[4] + (lmargin, halfh));
    for i=5 upto 6:
        coor[i] := coor[i - 1] + dx;
    endfor;

    coor[7] := coor[4] + dy;
    label.lft(btex $(d)$ etex scaled qs0, coor[7] + (lmargin, halfh));

    drawG(coor[0],0,0,0,0,0,0,0,0,0);

    drawG(coor[1],0,0,0,0,0,0,1,0,0);
    drawG(coor[2],0,1,0,0,0,0,0,0,0);
    drawG(coor[3],0,0,0,0,0,1,0,0,0);

    drawG(coor[4],0,1,0,0,0,0,1,0,0);
    drawG(coor[5],0,1,0,0,0,1,0,0,0);
    drawG(coor[6],0,0,0,0,0,1,1,0,0);

    drawG(coor[7],0,1,0,0,0,1,1,0,0);
endfig;

end;
