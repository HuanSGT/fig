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

beginfig(1)
    pickup pencircle scaled default_scale;

	pair coor;

    coor := (0,0);
	drawG  (coor + 0dx, 0,0,0,0,0,0,0,0,0);
	label.bot(btex $3\gamma_n^0$ etex scaled eq_scale, coor + dz + 0dx);
	label.rt(btex $\times 1$ etex scaled eq_scale, coor + dzz + 0dx);
	drawG  (coor + 1dx, 1,0,0,1,0,0,1,0,0);
	label.bot(btex $3\gamma_n^1 - 2$ etex scaled eq_scale, coor + dz + 1dx);
	label.rt(btex $\times 1$ etex scaled eq_scale, coor + dzz + 1dx);

endfig;

end;
