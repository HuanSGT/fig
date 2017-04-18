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
	label.lft(btex $3\gamma_n^2  - 3:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 0,1,1,0,1,1,0,1,1);

	coor := coor + dy;
	label.lft(btex $3\gamma_n^3 - 5:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 1,1,1,1,1,1,1,1,1);

	coor := coor + dy;

endfig;

end;
