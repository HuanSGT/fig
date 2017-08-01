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
	drawG  (coor + 0dxs, 1,0,0,0,1,0,0,0,1);
	label.bot(btex $3\beta_n^1 + 3$ etex scaled eq_scale, coor + dz + 0dxs);
	drawG  (coor + 1dxs, 1,1,0,0,1,0,0,0,1);
	label.bot(btex $2\beta_n^1 + \beta_n^2 + 2$ etex scaled eq_scale, coor + dz + 1dxs);
	drawG  (coor + 2dxs, 1,0,1,0,1,0,0,0,1);
	label.bot(btex $2\beta_n^1 + \beta_n^2 + 2$ etex scaled eq_scale, coor + dz + 2dxs);
	drawG  (coor + 3dxs, 1,0,0,0,1,1,0,0,1);
	label.bot(btex $2\beta_n^1 + \beta_n^2 + 2$ etex scaled eq_scale, coor + dz + 3dxs);
	drawG  (coor + 4dxs, 1,0,0,0,1,0,0,1,1);
	label.bot(btex $2\beta_n^1 + \beta_n^2 + 2$ etex scaled eq_scale, coor + dz + 4dxs);
	drawG  (coor + 5dxs, 1,0,0,0,1,0,1,0,1);
	label.bot(btex $2\beta_n^1 + \beta_n^2 + 2$ etex scaled eq_scale, coor + dz + 5dxs);
	drawG  (coor + 6dxs, 1,0,0,1,1,0,0,0,1);
	label.bot(btex $2\beta_n^1 + \beta_n^2 + 2$ etex scaled eq_scale, coor + dz + 6dxs);
	drawG  (coor + 7dxs, 1,1,1,0,1,0,0,0,1);
	label.bot(btex $2\beta_n^1 + \beta_n^3 + 1$ etex scaled eq_scale, coor + dz + 7dxs);
	coor := coor + dy;
	drawG  (coor + 0dxs, 1,0,0,1,1,1,0,0,1);
	label.bot(btex $2\beta_n^1 + \beta_n^3 + 1$ etex scaled eq_scale, coor + dz + 0dxs);
	drawG  (coor + 1dxs, 1,0,0,0,1,0,1,1,1);
	label.bot(btex $2\beta_n^1 + \beta_n^3 + 1$ etex scaled eq_scale, coor + dz + 1dxs);
	drawG  (coor + 2dxs, 1,0,0,0,1,1,0,1,1);
	label.bot(btex $\beta_n^1 + 2\beta_n^2 + 2$ etex scaled eq_scale, coor + dz + 2dxs);
	drawG  (coor + 3dxs, 1,0,1,0,1,0,1,0,1);
	label.bot(btex $\beta_n^1 + 2\beta_n^2 + 2$ etex scaled eq_scale, coor + dz + 3dxs);
	drawG  (coor + 4dxs, 1,1,0,1,1,0,0,0,1);
	label.bot(btex $\beta_n^1 + 2\beta_n^2 + 2$ etex scaled eq_scale, coor + dz + 4dxs);
	drawG  (coor + 5dxs, 1,1,1,0,1,0,1,0,1);
	label.bot(btex $\beta_n^1 + \beta_n^2 + \beta_n^3 + 1$ etex scaled eq_scale, coor + dz + 5dxs);
	drawG  (coor + 6dxs, 1,1,1,1,1,0,0,0,1);
	label.bot(btex $\beta_n^1 + \beta_n^2 + \beta_n^3 + 1$ etex scaled eq_scale, coor + dz + 6dxs);
	drawG  (coor + 7dxs, 1,1,0,1,1,1,0,0,1);
	label.bot(btex $\beta_n^1 + \beta_n^2 + \beta_n^3 + 1$ etex scaled eq_scale, coor + dz + 7dxs);
	coor := coor + dy;
	drawG  (coor + 0dxs, 1,0,1,0,1,0,1,1,1);
	label.bot(btex $\beta_n^1 + \beta_n^2 + \beta_n^3 + 1$ etex scaled eq_scale, coor + dz + 0dxs);
	drawG  (coor + 1dxs, 1,0,0,0,1,1,1,1,1);
	label.bot(btex $\beta_n^1 + \beta_n^2 + \beta_n^3 + 1$ etex scaled eq_scale, coor + dz + 1dxs);
	drawG  (coor + 2dxs, 1,0,0,1,1,1,0,1,1);
	label.bot(btex $\beta_n^1 + \beta_n^2 + \beta_n^3 + 1$ etex scaled eq_scale, coor + dz + 2dxs);
	drawG  (coor + 3dxs, 1,0,0,1,1,1,1,1,1);
	label.bot(btex $\beta_n^1 + 2\beta_n^3$ etex scaled eq_scale, coor + dz + 3dxs);
	drawG  (coor + 4dxs, 1,1,1,0,1,0,1,1,1);
	label.bot(btex $\beta_n^1 + 2\beta_n^3$ etex scaled eq_scale, coor + dz + 4dxs);
	drawG  (coor + 5dxs, 1,1,1,1,1,1,0,0,1);
	label.bot(btex $\beta_n^1 + 2\beta_n^3$ etex scaled eq_scale, coor + dz + 5dxs);
	drawG  (coor + 6dxs, 1,1,0,0,1,1,0,1,1);
	label.bot(btex $3\beta_n^2 + 1$ etex scaled eq_scale, coor + dz + 6dxs);
	drawG  (coor + 7dxs, 1,0,1,0,1,1,0,1,1);
	label.bot(btex $3\beta_n^2 + 1$ etex scaled eq_scale, coor + dz + 7dxs);
	coor := coor + dy;
	drawG  (coor + 0dxs, 1,0,1,0,1,1,1,0,1);
	label.bot(btex $3\beta_n^2 + 1$ etex scaled eq_scale, coor + dz + 0dxs);
	drawG  (coor + 1dxs, 1,1,0,1,1,0,0,1,1);
	label.bot(btex $3\beta_n^2 + 1$ etex scaled eq_scale, coor + dz + 1dxs);
	drawG  (coor + 2dxs, 1,1,0,1,1,0,1,0,1);
	label.bot(btex $3\beta_n^2 + 1$ etex scaled eq_scale, coor + dz + 2dxs);
	drawG  (coor + 3dxs, 1,0,1,1,1,0,1,0,1);
	label.bot(btex $3\beta_n^2 + 1$ etex scaled eq_scale, coor + dz + 3dxs);
	drawG  (coor + 4dxs, 1,1,1,1,1,0,1,0,1);
	label.bot(btex $2\beta_n^2 + \beta_n^3 + 1$ etex scaled eq_scale, coor + dz + 4dxs);
	drawG  (coor + 5dxs, 1,1,0,1,1,1,0,1,1);
	label.bot(btex $2\beta_n^2 + \beta_n^3 + 1$ etex scaled eq_scale, coor + dz + 5dxs);
	drawG  (coor + 6dxs, 1,0,1,0,1,1,1,1,1);
	label.bot(btex $2\beta_n^2 + \beta_n^3 + 1$ etex scaled eq_scale, coor + dz + 6dxs);
	drawG  (coor + 7dxs, 1,1,0,1,1,1,1,1,1);
	label.bot(btex $\beta_n^2 + 2\beta_n^3$ etex scaled eq_scale, coor + dz + 7dxs);
	coor := coor + dy;
	drawG  (coor + 0dxs, 1,0,1,1,1,1,1,1,1);
	label.bot(btex $\beta_n^2 + 2\beta_n^3$ etex scaled eq_scale, coor + dz + 0dxs);
	drawG  (coor + 1dxs, 1,1,1,0,1,1,1,1,1);
	label.bot(btex $\beta_n^2 + 2\beta_n^3$ etex scaled eq_scale, coor + dz + 1dxs);
	drawG  (coor + 2dxs, 1,1,1,1,1,1,0,1,1);
	label.bot(btex $\beta_n^2 + 2\beta_n^3$ etex scaled eq_scale, coor + dz + 2dxs);
	drawG  (coor + 3dxs, 1,1,1,1,1,1,1,0,1);
	label.bot(btex $\beta_n^2 + 2\beta_n^3$ etex scaled eq_scale, coor + dz + 3dxs);
	drawG  (coor + 4dxs, 1,1,1,1,1,0,1,1,1);
	label.bot(btex $\beta_n^2 + 2\beta_n^3$ etex scaled eq_scale, coor + dz + 4dxs);
	drawG  (coor + 5dxs, 1,1,1,1,1,1,1,1,1);
	label.bot(btex $3\beta_n^3$ etex scaled eq_scale, coor + dz + 5dxs);

endfig;

end;
