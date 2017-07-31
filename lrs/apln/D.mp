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
	drawG  (coor + 0dx, 0,1,1,0,1,0,0,0,0);
	label.bot(btex $\beta_n^0 + \beta_n^1 + \beta_n^2$ etex scaled eq_scale, coor + dz + 0dx);
	label.rt(btex $\times 6$ etex scaled eq_scale, coor + dzz + 0dx);
	drawG  (coor + 1dx, 1,1,1,0,1,0,0,0,0);
	label.bot(btex $\beta_n^0 + \beta_n^1 + \beta_n^3$ etex scaled eq_scale, coor + dz + 1dx);
	label.rt(btex $\times 6$ etex scaled eq_scale, coor + dzz + 1dx);
	drawG  (coor + 2dx, 0,0,0,0,1,1,1,0,1);
	label.bot(btex $\beta_n^0 + 2\beta_n^2$ etex scaled eq_scale, coor + dz + 2dx);
	label.rt(btex $\times 6$ etex scaled eq_scale, coor + dzz + 2dx);
	drawG  (coor + 3dx, 0,1,0,0,1,0,0,0,1);
	label.bot(btex $3\beta_n^1$ etex scaled eq_scale, coor + dz + 3dx);
	label.rt(btex $\times 2$ etex scaled eq_scale, coor + dzz + 3dx);
	drawG  (coor + 4dx, 0,1,1,1,0,0,0,1,0);
	label.bot(btex $2\beta_n^1 + \beta_n^2$ etex scaled eq_scale, coor + dz + 4dx);
	label.rt(btex $\times 6$ etex scaled eq_scale, coor + dzz + 4dx);
	drawG  (coor + 5dx, 1,1,0,0,1,0,0,0,1);
	label.bot(btex $2\beta_n^1 + \beta_n^2$ etex scaled eq_scale, coor + dz + 5dx);
	label.rt(btex $\times 6$ etex scaled eq_scale, coor + dzz + 5dx);

endfig;

end;
