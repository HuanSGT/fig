verbatimtex
%&LaTeX
\documentclass{article}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{pifont}
\newcommand{\xmark}{\text{\ding{53}}}%
\begin{document}
etex

prologues := 3; %加入字体
filenametemplate "%j_%c.eps";

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

default_scale = 5.5;
circle_scale = 2.5;
label_scale = 1.2;
w_scale = 0.9;
arrow_scale = 1.0;
eq_scale = 2.5;
vs = 1.0; 
gen_scale = 1.5;

vardef drawCircle(expr loc, interCol, outlineCol, diameter) =
    pen prepen;
    prepen := currentpen;
    pickup pencircle scaled circle_scale;

    fill fullcircle scaled diameter shifted loc withcolor interCol;
    draw fullcircle scaled diameter shifted loc withcolor outlineCol;

    pickup prepen;
enddef;

u := 30mm;
mu := 0.06u;
d := 0.10u;
gap := 2u;

pair ux,uy,dx,dy,dux,duy;
ux := (u * cosd 60, 0);
uy := (0, u * sind 60);
dx := (d, 0);
dy := (0, d);
dux := (d * cosd 60, 0);
duy := (0, d * sind 60);

beginfig(1)
    pickup pencircle scaled default_scale;

    pair a,b;
    a := (0,0); b := (1u,0);

    draw a + 0.8dx -- b - 0.8dx withpen pencircle scaled arrow_scale;
    %drawCircle(a, white, white, d);
    %drawCircle(b, white, white, d);
    label(btex $u$ etex scaled 1.3, a);
    label(btex $v$ etex scaled 1.3, b);

    pair xu[],xv[];
    xu0 := b + (gap, 0) + 0.5uy;
    xu2 := xu0 - ux - uy;
    xu1 := xu0 + ux - uy;

    drawarrow xu0 + dux - duy -- xu1 - dux + duy withpen pencircle scaled arrow_scale;
    drawarrow xu1 - dx -- xu2 + dx withpen pencircle scaled arrow_scale;
    drawarrow xu2 + dux + duy -- xu0 - dux - duy withpen pencircle scaled arrow_scale;

    label(btex $10\,\mathrm{deg}(u)$ etex scaled w_scale rotated 300, 0.55[xu0,xu1] + (mu,mu));
    label.bot(btex $10\,\mathrm{deg}(u)$ etex scaled w_scale, 0.5[xu1,xu2]);
    label(btex $10\,\mathrm{deg}(u)$ etex scaled w_scale rotated 60, 0.55[xu0,xu2] + (-mu, mu));
    
    label(btex $x_0^u$ etex scaled label_scale, xu0);
    label(btex $x_1^u$ etex scaled label_scale, xu1);
    label(btex $x_2^u$ etex scaled label_scale, xu2);

    xv0 := xu0 + (2u, 0);
    xv1 := xv0 - ux - uy;
    xv2 := xv0 + ux - uy;
    
    drawarrow xv0 - dux - duy -- xv1 + dux + duy withpen pencircle scaled arrow_scale;
    drawarrow xv1 + dx -- xv2 - dx withpen pencircle scaled arrow_scale;
    drawarrow xv2 - dux + duy -- xv0 + dux - duy withpen pencircle scaled arrow_scale;
    
    label(btex $10\,\mathrm{deg}(v)$ etex scaled w_scale rotated 60, 0.55[xv0,xv1] + (-mu,mu));
    label.bot(btex $10\,\mathrm{deg}(v)$ etex scaled w_scale, 0.5[xv1,xv2]);
    label(btex $10\,\mathrm{deg}(v)$ etex scaled w_scale rotated 300, 0.55[xv0,xv2] + (mu, mu));

    label(btex $x_0^v$ etex scaled label_scale, xv0);
    label(btex $x_1^v$ etex scaled label_scale, xv1);
    label(btex $x_2^v$ etex scaled label_scale, xv2);

    drawarrow xu0 + dx -- xv0 - dx withpen pencircle scaled arrow_scale;
    drawarrow xu1 + (d * 1.5 / sqrt(3.0), d * \sqrt(3) / 3)  -- xv0 - (d * 1.5 / sqrt(3.0), d * \sqrt(3) / 3) withpen pencircle scaled arrow_scale;

    label.top(btex $1$ etex scaled w_scale, 0.5[xu0,xv0]);
    label(btex $2$ etex scaled w_scale rotated 30, 0.55[xv0,xu1] + (-mu, mu));

    label(btex $\Rightarrow$ etex xscaled 2 yscaled 3, b + 0.35(gap,0));
endfig;

end
