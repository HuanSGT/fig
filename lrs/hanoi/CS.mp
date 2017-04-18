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
	label.lft(btex $A_n^* + 2B_n^* + 3:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 0,0,0,0,1,0,0,0,1);
	drawG  (coor + 1dx, 1,0,0,0,0,0,0,0,1);
	drawG  (coor + 2dx, 1,0,0,0,1,0,0,0,0);

	coor := coor + dy;
	label.lft(btex $A_n^* + B_n^* + C_n^* + 2:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 0,0,0,0,1,0,0,1,1);
	drawG  (coor + 1dx, 0,0,0,0,1,1,0,0,1);
	drawG  (coor + 2dx, 1,0,1,0,0,0,0,0,1);
	drawG  (coor + 3dx, 1,1,0,0,1,0,0,0,0);
	drawG  (coor + 4dx, 1,0,0,1,1,0,0,0,0);
	drawG  (coor + 5dx, 1,0,0,0,0,0,1,0,1);

	coor := coor + dy;
	label.lft(btex $A_n^* + B_n^* + D_n^* + 1:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 1,1,1,0,1,0,0,0,0);
	drawG  (coor + 1dx, 1,1,1,0,0,0,0,0,1);
	drawG  (coor + 2dx, 0,0,0,1,1,1,0,0,1);
	drawG  (coor + 3dx, 0,0,0,0,1,0,1,1,1);
	drawG  (coor + 4dx, 1,0,0,0,0,0,1,1,1);
	drawG  (coor + 5dx, 1,0,0,1,1,1,0,0,0);

	coor := coor + dy;
	label.lft(btex $A_n^* + 2C_n^* + 2:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 0,0,0,0,1,1,0,1,1);
	drawG  (coor + 1dx, 1,0,1,0,0,0,1,0,1);
	drawG  (coor + 2dx, 1,1,0,1,1,0,0,0,0);

	coor := coor + dy;
	label.lft(btex $A_n^* + C_n^* + D_n^* + 1:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 1,1,1,1,1,0,0,0,0);
	drawG  (coor + 1dx, 1,1,1,0,0,0,1,0,1);
	drawG  (coor + 2dx, 0,0,0,1,1,1,0,1,1);
	drawG  (coor + 3dx, 0,0,0,0,1,1,1,1,1);
	drawG  (coor + 4dx, 1,0,1,0,0,0,1,1,1);
	drawG  (coor + 5dx, 1,1,0,1,1,1,0,0,0);

	coor := coor + dy;
	label.lft(btex $3B_n^* + 2:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 1,0,0,0,1,0,1,0,0);
	drawG  (coor + 1dx, 1,0,0,1,0,0,0,0,1);
	drawG  (coor + 2dx, 0,1,0,0,1,0,0,0,1);
	drawG  (coor + 3dx, 0,0,1,0,1,0,0,0,1);
	drawG  (coor + 4dx, 1,0,0,0,0,1,0,0,1);
	drawG  (coor + 5dx, 1,0,0,0,1,0,0,1,0);

	coor := coor + dy;
	label.lft(btex $2B_n^* + C_n^* + 2:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 1,1,0,1,0,0,0,0,1);
	drawG  (coor + 1dx, 1,0,1,0,1,0,1,0,0);
	drawG  (coor + 2dx, 1,0,0,0,1,1,0,1,0);
	drawG  (coor + 3dx, 1,0,0,0,0,1,0,1,1);
	drawG  (coor + 4dx, 0,0,1,0,1,0,1,0,1);
	drawG  (coor + 5dx, 0,1,0,1,1,0,0,0,1);

	coor := coor + dy;
	label.lft(btex $2B_n^* + D_n^* + 1:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 1,1,1,0,1,0,1,0,0);
	drawG  (coor + 1dx, 1,1,1,1,0,0,0,0,1);
	drawG  (coor + 2dx, 0,1,0,1,1,1,0,0,1);
	drawG  (coor + 3dx, 0,0,1,0,1,0,1,1,1);
	drawG  (coor + 4dx, 1,0,0,0,0,1,1,1,1);
	drawG  (coor + 5dx, 1,0,0,1,1,1,0,1,0);

	coor := coor + dy;
	label.lft(btex $B_n^* + 2C_n^* + 1:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 1,0,0,0,1,1,1,1,0);
	drawG  (coor + 1dx, 1,0,0,1,0,1,0,1,1);
	drawG  (coor + 2dx, 0,1,1,0,1,0,1,0,1);
	drawG  (coor + 3dx, 0,1,1,1,1,0,0,0,1);
	drawG  (coor + 4dx, 1,1,0,1,0,1,0,0,1);
	drawG  (coor + 5dx, 1,0,1,0,1,0,1,1,0);
	coor := coor + dyy;
	drawG  (coor + 0dx, 0,1,0,0,1,1,0,1,1);
	drawG  (coor + 1dx, 0,0,1,0,1,1,0,1,1);
	drawG  (coor + 2dx, 1,0,1,0,0,1,1,0,1);
	drawG  (coor + 3dx, 1,1,0,1,1,0,0,1,0);
	drawG  (coor + 4dx, 1,1,0,1,1,0,1,0,0);
	drawG  (coor + 5dx, 1,0,1,1,0,0,1,0,1);
	coor := coor + dyy;
	drawG  (coor + 0dx, 0,1,0,1,1,0,1,0,1);
	drawG  (coor + 1dx, 0,0,1,1,1,0,1,0,1);
	drawG  (coor + 2dx, 1,1,0,0,0,1,0,1,1);
	drawG  (coor + 3dx, 1,0,1,0,1,1,0,1,0);
	drawG  (coor + 4dx, 1,0,1,0,1,1,1,0,0);
	drawG  (coor + 5dx, 1,1,0,1,0,0,0,1,1);
	coor := coor + dyy;
	drawG  (coor + 0dx, 0,1,0,1,1,0,0,1,1);
	drawG  (coor + 1dx, 0,0,1,0,1,1,1,0,1);
	drawG  (coor + 2dx, 1,0,1,0,0,1,0,1,1);
	drawG  (coor + 3dx, 1,1,0,0,1,1,0,1,0);
	drawG  (coor + 4dx, 1,0,1,1,1,0,1,0,0);
	drawG  (coor + 5dx, 1,1,0,1,0,0,1,0,1);

	coor := coor + dy;
	label.lft(btex $B_n^* + C_n^* + D_n^* + 1:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 1,1,1,1,1,0,1,0,0);
	drawG  (coor + 1dx, 1,1,1,1,0,0,1,0,1);
	drawG  (coor + 2dx, 0,1,0,1,1,1,0,1,1);
	drawG  (coor + 3dx, 0,0,1,0,1,1,1,1,1);
	drawG  (coor + 4dx, 1,0,1,0,0,1,1,1,1);
	drawG  (coor + 5dx, 1,1,0,1,1,1,0,1,0);

	coor := coor + dy;
	label.lft(btex $B_n^* + 2D_n^*:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 0,1,0,1,1,1,1,1,1);
	drawG  (coor + 1dx, 0,0,1,1,1,1,1,1,1);
	drawG  (coor + 2dx, 1,1,1,0,0,1,1,1,1);
	drawG  (coor + 3dx, 1,1,1,1,1,1,0,1,0);
	drawG  (coor + 4dx, 1,1,1,1,1,1,1,0,0);
	drawG  (coor + 5dx, 1,1,1,1,0,0,1,1,1);

	coor := coor + dy;
	label.lft(btex $3C_n^* + 1:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 0,1,1,1,1,0,1,0,1);
	drawG  (coor + 1dx, 1,1,0,1,0,1,0,1,1);
	drawG  (coor + 2dx, 1,0,1,0,1,1,1,1,0);

	coor := coor + dy;
	label.lft(btex $2C_n^* + D_n^*:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 1,1,1,1,1,0,1,1,0);
	drawG  (coor + 1dx, 1,1,1,1,0,1,1,0,1);
	drawG  (coor + 2dx, 0,1,1,1,1,1,0,1,1);
	drawG  (coor + 3dx, 0,1,1,0,1,1,1,1,1);
	drawG  (coor + 4dx, 1,0,1,1,0,1,1,1,1);
	drawG  (coor + 5dx, 1,1,0,1,1,1,1,1,0);

	coor := coor + dy;
	label.lft(btex $C_n^* + 2D_n^*:$ etex scaled eq_scale, coor + dxx);
	drawG  (coor + 0dx, 0,1,1,1,1,1,1,1,1);
	drawG  (coor + 1dx, 1,1,1,1,0,1,1,1,1);
	drawG  (coor + 2dx, 1,1,1,1,1,1,1,1,0);

	coor := coor + dy;

endfig;

end;
