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
    label.lft(btex $3A_n : $ etex scaled eq_scale, coor + dxx);
    drawG(coor + 0dx, 0,0,0, 0,0,0, 0,0,0);

	coor := coor + dy;
    label.lft(btex $2A_n + B_n :$ etex scaled eq_scale, coor + dxx);
    drawG(coor + 0dx, 1,0,0, 0,0,0, 0,0,0);
    drawG(coor + 1dx, 0,0,0, 1,0,0, 0,0,0);
    drawG(coor + 2dx, 0,0,0, 0,0,0, 1,0,0);
    drawG(coor + 3dx, 1,0,0, 0,0,0, 0,0,0);
    drawG(coor + 4dx, 0,0,0, 1,0,0, 0,0,0);
    drawG(coor + 5dx, 0,0,0, 0,0,0, 1,0,0);

	coor := coor + dyy;
    drawG(coor + 0dx, 1,0,0, 0,0,0, 0,0,0);
    drawG(coor + 1dx, 0,0,0, 1,0,0, 0,0,0);
    drawG(coor + 2dx, 0,0,0, 0,0,0, 1,0,0);
    drawG(coor + 3dx, 1,0,0, 0,0,0, 0,0,0);
    drawG(coor + 4dx, 0,0,0, 1,0,0, 0,0,0);
    drawG(coor + 5dx, 0,0,0, 0,0,0, 1,0,0);

	coor := coor + dy;
    label.lft(btex $2A_n + B_n :$ etex scaled eq_scale, coor + dxx);
    drawG(coor + 0dx, 1,0,0, 0,0,0, 0,0,0);
    drawG(coor + 1dx, 0,0,0, 1,0,0, 0,0,0);
    drawG(coor + 2dx, 0,0,0, 0,0,0, 1,0,0);
    drawG(coor + 3dx, 1,0,0, 0,0,0, 0,0,0);
    drawG(coor + 4dx, 0,0,0, 1,0,0, 0,0,0);
    drawG(coor + 5dx, 0,0,0, 0,0,0, 1,0,0);

endfig;

end;
