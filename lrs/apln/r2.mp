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
	label.lft(btex $\gamma_n^2 + 2\gamma_n^1 - 2:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 0,1,1,0,0,1,0,0,1);
	drawG  (coor + 1dx, 0,1,0,0,1,1,0,1,0);
	drawG  (coor + 2dx, 0,0,1,0,1,0,0,1,1);

	coor := coor + dy;
	label.lft(btex $\gamma_n^3 + 2\gamma_n^2 - 4:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 1,1,1,1,0,1,1,0,1);
	drawG  (coor + 1dx, 1,1,0,1,1,1,1,1,0);
	drawG  (coor + 2dx, 1,0,1,1,1,0,1,1,1);

	coor := coor + dy;

endfig;

end;
