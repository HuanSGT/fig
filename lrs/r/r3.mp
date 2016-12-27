verbatimtex
%&LaTeX
\documentclass{article}
\usepackage{amsmath}
\usepackage{amssymb}
\begin{document}
etex

prologues := 3; %加入字体
filenametemplate "%j_%c.eps";

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

input r;

beginfig(1)
    pickup pencircle scaled dfts;

    pair coor[], dx, dy;
    dx := (width, 0);
    dy := (0, -height);

    coor[0] := (0,0);

	coor[1] := coor[0] + dy;
    label.lft(btex $(a)$ etex scaled qs0, coor[1] + (lmargin, halfh));
	for i=2 upto 1:
		coor[i] := coor[i - 1] + dx;
	endfor;
	drawG(coor[1],1,0,1,1,1,0,0,1,1);

	coor[2] := coor[1] + dy;
    label.lft(btex $(b)$ etex scaled qs0, coor[2] + (lmargin, halfh));
	for i=3 upto 4:
		coor[i] := coor[i - 1] + dx;
	endfor;
	drawG(coor[2],1,0,1,1,1,0,1,1,1);
	drawG(coor[3],1,1,1,1,1,0,0,1,1);
	drawG(coor[4],1,0,1,1,1,1,0,1,1);

	coor[5] := coor[2] + dy;
    label.lft(btex $(c)$ etex scaled qs0, coor[5] + (lmargin, halfh));
	for i=6 upto 7:
		coor[i] := coor[i - 1] + dx;
	endfor;
	drawG(coor[5],1,1,1,1,1,1,0,1,1);
	drawG(coor[6],1,1,1,1,1,0,1,1,1);
	drawG(coor[7],1,0,1,1,1,1,1,1,1);

	coor[8] := coor[5] + dy;
    label.lft(btex $(d)$ etex scaled qs0, coor[8] + (lmargin, halfh));
	for i=9 upto 8:
		coor[i] := coor[i - 1] + dx;
	endfor;
	drawG(coor[8],1,1,1,1,1,1,1,1,1);
endfig;

end;
