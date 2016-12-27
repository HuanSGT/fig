verbatimtex
%&LaTeX
\documentclass{article}
\usepackage{amsmath}
\usepackage{amssymb}
\begin{document}
etex

prologues := 3;
filenametemplate "STheta3.eps";

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

input s;

beginfig(1)
    pickup pencircle scaled dfts;
	pair coor; %, dx, dy, dxx;
	%dx  := (widthG, 0);
	%dy  := (0, -heightG);
    %dxx := (-widthGG, 0);

    coor := (0,0);
	drawGG (coor + dxx, 1,0,0,0,1,0,0,0,1);
	label.lft(btex $(a)$ etex scaled qs1, coor + dxx + dnum);
	drawG  (coor + 0dx, 1,2,2,0,1,0,0,2,1, btex $\gamma_n^1+\phi_n^1+\xi_n^1$ etex scaled qs0);
	drawG  (coor + 1dx, 1,2,0,0,1,2,2,0,1, btex $3\phi_n^1$ etex scaled qs0);
	drawG  (coor + 2dx, 1,2,2,0,1,0,0,0,1, btex $2\gamma_n^1+\xi_n^1$ etex scaled qs0);
	drawG  (coor + 3dx, 1,0,2,0,1,0,0,2,1, btex $\gamma_n^1+2\phi_n^1$ etex scaled qs0);
	drawG  (coor + 4dx, 1,0,2,0,1,0,0,0,1, btex $2\gamma_n^1+\phi_n^1$ etex scaled qs0);
	drawG  (coor + 5dx, 1,0,0,0,1,0,0,0,1, btex $3\gamma_n^1$ etex scaled qs0);
	coor := coor + dy;
	drawGG (coor + dxx, 1,0,0,0,1,1,0,1,1);
	label.lft(btex $(b)$ etex scaled qs1, coor + dxx + dnum);
	drawG  (coor + 0dx, 1,2,2,0,1,1,0,1,1, btex $2\gamma_n^2+\xi_n^1-1$ etex scaled qs0);
	drawG  (coor + 1dx, 1,0,0,2,1,1,2,1,1, btex $\gamma_n^1+2\phi_n^2-1$ etex scaled qs0);
	drawG  (coor + 2dx, 1,2,0,0,1,1,2,1,1, btex $\gamma_n^2+\phi_n^2+\phi_n^1-1$ etex scaled qs0);
	drawG  (coor + 3dx, 1,0,2,0,1,1,0,1,1, btex $2\gamma_n^2+\phi_n^1-1$ etex scaled qs0);
	drawG  (coor + 4dx, 1,0,0,0,1,1,2,1,1, btex $\gamma_n^2+\gamma_n^1+\phi_n^2-1$ etex scaled qs0);
	drawG  (coor + 5dx, 1,0,0,0,1,1,0,1,1, btex $2\gamma_n^2+\gamma_n^1-1$ etex scaled qs0);
	coor := coor + dy;
	drawGG (coor + dxx, 1,0,1,0,1,1,1,1,1);
	label.lft(btex $(c)$ etex scaled qs1, coor + dxx + dnum);
	drawG  (coor + 0dx, 1,0,1,2,1,1,1,1,1, btex $\gamma_n^3+\gamma_n^2+\phi_n^2-2$ etex scaled qs0);
	drawG  (coor + 1dx, 1,0,1,0,1,1,1,1,1, btex $\gamma_n^3+2\gamma_n^2-2$ etex scaled qs0);
	coor := coor + dy;
	drawGG (coor + dxx, 1,1,1,1,1,1,1,1,1);
	label.lft(btex $(d)$ etex scaled qs1, coor + dxx + dnum);
	drawG  (coor + 0dx, 1,1,1,1,1,1,1,1,1, btex $3\gamma_n^3-3$ etex scaled qs0);
	coor := coor + dy;

endfig;

end;
