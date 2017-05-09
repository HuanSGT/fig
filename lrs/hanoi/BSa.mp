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
	label.lft(btex $2\beta_n^0 + \beta_n^1 + 3:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 1,0,0,0,0,0,0,0,0);
	drawG  (coor + 1dx, 0,0,0,0,1,0,0,0,0);
	drawG  (coor + 2dx, 0,0,0,0,0,0,0,0,1);

	coor := coor + dy;
	label.lft(btex $2\beta_n^0 + \beta_n^2 + 2:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 1,1,0,0,0,0,0,0,0);
	drawG  (coor + 1dx, 1,0,1,0,0,0,0,0,0);
	drawG  (coor + 2dx, 0,0,0,0,1,1,0,0,0);
	drawG  (coor + 3dx, 0,0,0,0,0,0,0,1,1);
	drawG  (coor + 4dx, 0,0,0,0,0,0,1,0,1);
	drawG  (coor + 5dx, 0,0,0,1,1,0,0,0,0);

	coor := coor + dy;
	label.lft(btex $2\beta_n^0 + \beta_n^3 + 1:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 1,1,1,0,0,0,0,0,0);
	drawG  (coor + 1dx, 0,0,0,1,1,1,0,0,0);
	drawG  (coor + 2dx, 0,0,0,0,0,0,1,1,1);

	coor := coor + dy;
	label.lft(btex $\beta_n^0 + 2\beta_n^1 + 2:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 0,0,0,0,1,0,0,1,0);
	drawG  (coor + 1dx, 0,0,0,0,0,1,0,0,1);
	drawG  (coor + 2dx, 0,0,1,0,0,0,0,0,1);
	drawG  (coor + 3dx, 0,1,0,0,1,0,0,0,0);
	drawG  (coor + 4dx, 1,0,0,1,0,0,0,0,0);
	drawG  (coor + 5dx, 1,0,0,0,0,0,1,0,0);

	coor := coor + dy;
	label.lft(btex $\beta_n^0 + \beta_n^1 + \beta_n^2 + 2:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 0,0,0,0,0,1,0,1,1);
	drawG  (coor + 1dx, 0,0,0,0,1,1,0,1,0);
	drawG  (coor + 2dx, 1,0,1,0,0,0,1,0,0);
	drawG  (coor + 3dx, 1,1,0,1,0,0,0,0,0);
	drawG  (coor + 4dx, 0,1,0,1,1,0,0,0,0);
	drawG  (coor + 5dx, 0,0,1,0,0,0,1,0,1);

	coor := coor + dy;
	label.lft(btex $\beta_n^0 + \beta_n^1 + \beta_n^3 + 1:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 0,0,0,0,0,1,1,1,1);
	drawG  (coor + 1dx, 0,0,0,1,1,1,0,1,0);
	drawG  (coor + 2dx, 1,1,1,0,0,0,1,0,0);
	drawG  (coor + 3dx, 1,1,1,1,0,0,0,0,0);
	drawG  (coor + 4dx, 0,1,0,1,1,1,0,0,0);
	drawG  (coor + 5dx, 0,0,1,0,0,0,1,1,1);

	coor := coor + dy;
	label.lft(btex $\beta_n^0 + 2\beta_n^2 + 1:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 0,0,0,0,1,1,1,1,0);
	drawG  (coor + 1dx, 0,0,0,1,0,1,0,1,1);
	drawG  (coor + 2dx, 0,1,1,0,0,0,1,0,1);
	drawG  (coor + 3dx, 0,1,1,1,1,0,0,0,0);
	drawG  (coor + 4dx, 1,1,0,1,0,1,0,0,0);
	drawG  (coor + 5dx, 1,0,1,0,0,0,1,1,0);

	coor := coor + dy;
	label.lft(btex $\beta_n^0 + \beta_n^2 + \beta_n^3:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 0,0,0,1,0,1,1,1,1);
	drawG  (coor + 1dx, 0,0,0,1,1,1,1,1,0);
	drawG  (coor + 2dx, 1,1,1,0,0,0,1,1,0);
	drawG  (coor + 3dx, 1,1,1,1,0,1,0,0,0);
	drawG  (coor + 4dx, 0,1,1,1,1,1,0,0,0);
	drawG  (coor + 5dx, 0,1,1,0,0,0,1,1,1);

	coor := coor + dy;
	label.lft(btex $3\beta_n^1 + 2:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 1,0,0,0,0,1,0,1,0);
	drawG  (coor + 1dx, 0,0,1,0,1,0,1,0,0);
	drawG  (coor + 2dx, 0,1,0,1,0,0,0,0,1);

	coor := coor + dy;

endfig;

end;
