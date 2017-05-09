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

    pair dely;
    dely := (0, -0.65heightT);

    pair loc[];

    loc1 := (1widthG,0);
    drawG(loc1, 9,9,9,   9,9,9,  9,9,9);

    label(btex $\mathcal{H}_n^1$ etex scaled hs, loc1 + dely);
    label(btex $\mathcal{H}_n^2$ etex scaled hs, loc1 + (- linex - lenx, - liney - leny) + dely);
    label(btex $\mathcal{H}_n^3$ etex scaled hs, loc1 + (linex +  lenx, - liney - leny) + dely);
    label(btex $\mathcal{H}_{n+1}$ etex scaled hs, loc1 + (0,-0.45heightG));

    label(btex $\Rightarrow$ etex xscaled 3.5 yscaled 5, (0.5widthG, -0.4heightG));

    line := line * 0.6;
    linex := line * cosd 60;
    liney := line * sind 60;

    loc2 := (0,-liney / 0.6 * 0.4);
    drawGNL(loc2, 0,0,0,   0,0,0,  0,0,0);

    label(btex $\mathcal{H}_n^1$ etex scaled hs, loc2 + dely);
    label(btex $\mathcal{H}_n^2$ etex scaled hs, loc2 + (- linex - lenx, - liney - leny) + dely);
    label(btex $\mathcal{H}_n^3$ etex scaled hs, loc2 + (linex +  lenx, - liney - leny) + dely);

endfig;

end;

