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
	drawG  (coor + 0dxs, 0,1,1,0,0,1,0,0,1);
	label.bot(btex $\gamma_n^2 + 2\gamma_n^1 - 2$ etex scaled eq_scale, coor + dz + 0dxs);
	drawG  (coor + 1dxs, 0,1,0,0,1,1,0,1,0);
	label.bot(btex $\gamma_n^2 + 2\gamma_n^1 - 2$ etex scaled eq_scale, coor + dz + 1dxs);
	drawG  (coor + 2dxs, 0,0,1,0,1,0,0,1,1);
	label.bot(btex $\gamma_n^2 + 2\gamma_n^1 - 2$ etex scaled eq_scale, coor + dz + 2dxs);
	drawG  (coor + 3dxs, 1,1,1,1,0,1,1,0,1);
	label.bot(btex $\gamma_n^3 + 2\gamma_n^2 - 4$ etex scaled eq_scale, coor + dz + 3dxs);
	drawG  (coor + 4dxs, 1,1,0,1,1,1,1,1,0);
	label.bot(btex $\gamma_n^3 + 2\gamma_n^2 - 4$ etex scaled eq_scale, coor + dz + 4dxs);
	drawG  (coor + 5dxs, 1,0,1,1,1,0,1,1,1);
	label.bot(btex $\gamma_n^3 + 2\gamma_n^2 - 4$ etex scaled eq_scale, coor + dz + 5dxs);

endfig;

end;
