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
	label.lft(btex $3\gamma_n^0:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 0,0,0,0,0,0,0,0,0);

	coor := coor + dy;
	label.lft(btex $2\gamma_n^0 + \gamma_n^1:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 0,0,0,1,0,0,0,0,0);
	drawG  (coor + 1dx, 0,0,0,0,0,0,1,0,0);
	drawG  (coor + 2dx, 1,0,0,0,0,0,0,0,0);

	coor := coor + dy;
	label.lft(btex $\gamma_n^0 + 2\gamma_n^1 - 1:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 0,0,0,1,0,0,1,0,0);
	drawG  (coor + 1dx, 1,0,0,0,0,0,1,0,0);
	drawG  (coor + 2dx, 1,0,0,1,0,0,0,0,0);

	coor := coor + dy;
	label.lft(btex $3\gamma_n^1 - 2:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 1,0,0,1,0,0,1,0,0);

	coor := coor + dy;

endfig;

end;
