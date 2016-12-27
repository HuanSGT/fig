verbatimtex
%&LaTeX
\documentclass{article}
\usepackage{amsmath}
\usepackage{amssymb}
\begin{document}
etex

prologues := 3;
filenametemplate "%j_%c.eps";

input r;

beginfig(1)
	pickup pencircle scaled dfts;

	pair coor[], dx, dy;
	dx := (width, 0);
	dy := (0, -height);

	coor[0] := (0,0);

	coor[1] := coor[0] + dy;
	label.lft(btex $(a)$ etex scaled qs0, coor[1] + (lmargin, halfh));
	for i=2 upto 3:
		coor[i] := coor[i - 1] + dx;
	endfor;
	drawG(coor[1],1,0,0,1,0,0,0,1,1);
	drawG(coor[2],0,0,1,1,1,0,0,0,1);
	drawG(coor[3],1,0,1,0,1,0,0,1,0);

	coor[4] := coor[1] + dy;
	label.lft(btex $(b)$ etex scaled qs0, coor[4] + (lmargin, halfh));
	for i=5 upto 6:
		coor[i] := coor[i - 1] + dx;
	endfor;
	drawG(coor[4],1,0,0,1,0,0,1,1,1);
	drawG(coor[5],0,0,1,1,1,1,0,0,1);
	drawG(coor[6],1,1,1,0,1,0,0,1,0);

	coor[7] := coor[4] + dy;
	label.lft(btex $(c)$ etex scaled qs0, coor[7] + (lmargin, halfh));
	for i=8 upto 12:
		coor[i] := coor[i - 1] + dx;
	endfor;
	drawG(coor[7],1,1,0,1,0,0,0,1,1);
	drawG(coor[8],1,0,0,1,0,1,0,1,1);
	drawG(coor[9],0,0,1,1,1,0,1,0,1);
	drawG(coor[10],0,1,1,1,1,0,0,0,1);
	drawG(coor[11],1,0,1,0,1,0,1,1,0);
	drawG(coor[12],1,0,1,0,1,1,0,1,0);

	coor[13] := coor[7] + dy;
	label.lft(btex $(d)$ etex scaled qs0, coor[13] + (lmargin, halfh));
	for i=14 upto 18:
		coor[i] := coor[i - 1] + dx;
	endfor;
	drawG(coor[13],1,1,0,1,0,0,1,1,1);
	drawG(coor[14],1,0,0,1,0,1,1,1,1);
	drawG(coor[15],0,0,1,1,1,1,1,0,1);
	drawG(coor[16],0,1,1,1,1,1,0,0,1);
	drawG(coor[17],1,1,1,0,1,0,1,1,0);
	drawG(coor[18],1,1,1,0,1,1,0,1,0);

	coor[19] := coor[13] + dy;
	label.lft(btex $(e)$ etex scaled qs0, coor[19] + (lmargin, halfh));
	for i=20 upto 21:
		coor[i] := coor[i - 1] + dx;
	endfor;
	drawG(coor[19],1,1,0,1,0,1,0,1,1);
	drawG(coor[20],0,1,1,1,1,0,1,0,1);
	drawG(coor[21],1,0,1,0,1,1,1,1,0);

	coor[22] := coor[19] + dy;
	label.lft(btex $(f)$ etex scaled qs0, coor[22] + (lmargin, halfh));
	for i=23 upto 24:
		coor[i] := coor[i - 1] + dx;
	endfor;
	drawG(coor[22],1,1,1,0,1,1,1,1,0);
	drawG(coor[23],0,1,1,1,1,1,1,0,1);
	drawG(coor[24],1,1,1,0,1,1,1,1,0);

endfig;

end;
