%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
verbatimtex
%&LaTeX
\documentclass{article}
\usepackage{amsmath}
\usepackage{amssymb}
\begin{document}
etex

u=1mm;
prologues:=3; %加入字体
filenametemplate "%j_%c.eps";
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vardef drawAxis(expr XL,YL)=    %绘制直角坐标系
    drawarrow (0,0)--(5u*XL, 0) withcolor green;
    drawarrow (0,0)--(0, 5u*YL) withcolor green;

    for i=1 upto XL:
        draw(5u*i, 0)--(5u*i, 5u*YL) withcolor green;
        dotlabel.bot(decimal(5i), (5u*i, 0));
    endfor;

    for i=1 upto YL:
        draw(0, 5u*i)--(5u*XL, 5u*i) withcolor green;
        dotlabel.lft(decimal(5i), (0, 5u*i));
    endfor;
enddef;

vardef setImage(text command)=
begingroup
    save setImageIntVariablePicA, setImageIntVariablePicB;

    picture setImageIntVariablePicA, setImageIntVariablePicB;
    setImageIntVariablePicA:=currentpicture;
    currentpicture:=nullpicture;

    command;

    setImageIntVariablePicB:=currentpicture;
    currentpicture:=setImageIntVariablePicA;

    setImageIntVariablePicB
endgroup
enddef;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

vardef drawCircle(expr loc, interCol, outlineCol, radius, lbl)=

    fill fullcircle scaled radius shifted loc withcolor interCol;
    draw fullcircle scaled radius shifted loc withcolor outlineCol;

    draw thelabel(lbl,loc) withcolor outlineCol;
enddef;

vardef drawDircle(expr loc, interCol, outlineCol, radius, lbl)=

    fill fullcircle scaled radius shifted loc withcolor interCol;
    draw fullcircle scaled radius shifted loc withcolor outlineCol dashed evenly;

    draw thelabel(lbl,loc) withcolor outlineCol;
enddef;

vardef drawEdge(expr xl,yl,xr,yr,col,lbl)=

    xc := (xl + xr) / 2.0; yc := (yl + yr) / 2.0;
    dx := xr - xc; dy := yr - yc;
    xx := -dy; yy := dx;
    ratio := 0.35;
    xx := xx * ratio; yy := yy * ratio;
    xt := xc + xx; yt := yc + yy;
    xs := xc - xx; ys := yc - yy;

    draw (xl,yl) .. (xt,yt) .. (xr,yr) withcolor col;
    draw (xl,yl) .. (xs,ys) .. (xr,yr) withcolor col;
    draw thelabel(lbl,(xc,yc)) withcolor col;

enddef;

vardef drawleft(expr x,y,r,col) =
    fill (x,y-r) .. (x-r,y) .. (x,y+r) .. cycle withcolor white;
    draw (x,y-r) .. (x-r,y) .. (x,y+r) withcolor col;
enddef;

vardef drawright(expr x,y,r,col) =
    fill (x,y-r) .. (x+r,y) .. (x,y+r) .. cycle withcolor white;
    draw (x,y-r) .. (x+r,y) .. (x,y+r) withcolor col;
enddef;

vardef drawup(expr x,y,r,col) =
    fill (x-r,y) .. (x,y+r) .. (x+r,y) .. cycle withcolor white;
    draw (x-r,y) .. (x,y+r) .. (x+r,y) withcolor col;
enddef;

vardef drawdown(expr x,y,r,col) =
    fill (x-r,y) .. (x,y-r) .. (x+r,y) .. cycle withcolor white;
    draw (x-r,y) .. (x,y-r) .. (x+r,y) withcolor col;
enddef;

vardef draw_one(expr col) =
    drawEdge(x9,y9,x10,y10,col,btex $\pmb{F}_{g}^{\scriptscriptstyle (1)}$ etex scaled qss);
    %drawleft(x9,y9,r_,col);
    %drawdown(x10,y10,r_,col);
enddef;

vardef draw_two(expr col) =
    drawEdge(x10,y10,x11,y11,col,btex $\pmb{F}_{g}^{\scriptscriptstyle (2)}$ etex scaled qss);
    %drawup(x10,y10,r_,col);
    %drawleft(x11,y11,r_,col);
enddef;

vardef draw_three(expr col) =
    drawEdge(x11,y11,x12,y12,col,btex $\pmb{F}_{g}^{\scriptscriptstyle (3)}$ etex scaled qss);
    %drawright(x11,y11,r_,col);
    %drawup(x12,y12,r_,col);
enddef;

vardef draw_four(expr col) = 
    drawEdge(x12,y12,x9,y9,col,btex $\pmb{F}_{g}^{\scriptscriptstyle (4)}$ etex scaled qss);
    %drawdown(x12,y12,r_,col);
    %drawright(x9,y9,r_,col);
enddef;

vardef rot_one(expr theta) =
    label(theta,(x0,y0)) withcolor (rv1,gv1,bv1);
    sin := sind(45); cos := cosd(45);
    xx := xl1 - cx1; yy := yl1 - cy1;
    xl1 := cos*xx+sin*yy+cx1; yl1 := -sin*xx+cos*yy+cy1;
    xx := xr1 - cx1; yy := yr1 - cy1;
    xr1 := cos*xx+sin*yy+cx1; yr1 := -sin*xx+cos*yy+cy1;
    xx := xl2 - cx1; yy := yl2 - cy1;
    xl2 := cos*xx+sin*yy+cx1; yl2 := -sin*xx+cos*yy+cy1;
    xx := xr2 - cx1; yy := yr2 - cy1;
    xr2 := cos*xx+sin*yy+cx1; yr2 := -sin*xx+cos*yy+cy1;
enddef;

beginfig(1)

    pickup pencircle scaled 1.5; %缩放画笔

%    drawAxis(16,16);

    l=30u;
    r=9u;
    r_ = r / 2.0;
    gap = 1.5u;

    x1 := x4 := 100u;
    x2 := x3 := x1 - l;
    x5 := x8 := x1 + r + gap;
    x6 := x7 := x5 + l;

    y1 := y5 := 0u;
    y2 := y6 := y5 + l;
    y3 := y7 := y2 + r + gap;
    y4 := y8 := y3 + l;

    x10 := x6 + l*1.2;
    x9 := x11 := x10 + l;
    x12 := x9 + l;

    y10 := y12 := (y6 + y7) / 2.0;
    y9 := y10 - l;
    y11 := y10 + l;

    rhs=50u;

    arx=3.3;
    ary=3;
    arbias=0.37u*1.5;

    qxbias=3u;
    qs := 1.4;
    qs_ := 1.6;
    qss := 1.6;

    r1 := 1; g1 := 0; b1 := 0;
    r2 := 0; g2 := 0.8; b2 := 0;
    r3 := 0; g3 := 0; b3 := 1;
    r4 := r1; g4 := 0; b4 := b3;

    kk := 2;
    rv1 := (r1 + r4) / kk; gv1 := (g1 + g4) / kk; bv1 := (b1 + b4) / kk;
    rv4 := (r3 + r4) / kk; gv4 := (g3 + g4) / kk; bv4 := (b3 + b4) / kk;
    rv3 := (r1 + r2) / kk; gv3 := (g1 + g2) / kk; bv3 := (b1 + b2) / kk;
    rv2 := (r2 + r3) / kk; gv2 := (g2 + g3) / kk; bv2 := (b2 + b3) / kk;
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% lhs
    draw_one((r1,g1,b1));
    draw_two((r2,g2,b2));
    draw_three((r3,g3,b3));
    draw_four((r4,g4,b4));
    drawDircle((x9,y9),white,(0.5,0.5,0.5),r,btex $\pmb{v}_1$ etex scaled qss);
    drawCircle((x11,y11),white,(r2,g2,b2),r,btex $\pmb{v}_2$ etex scaled qss);
    drawCircle((x10,y10),white,(r2,g2,b2),r,btex $\pmb{v}_3$ etex scaled qss);
    drawCircle((x12,y12),white,(r3,g3,b3),r,btex $\pmb{v}_4$ etex scaled qss);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% rhs

    label(btex $\pmb{v}_1$ etex scaled qs_,(x9,y9)) withcolor (0.5,0.5,0.5);
    label(btex $\pmb{v}_2$ etex scaled qs_,(x11,y11)) withcolor (r2,g2,b2);
    label(btex $\pmb{v}_3$ etex scaled qs_,(x10,y10)) withcolor (r2,g2,b2);
    label(btex $\pmb{v}_4$ etex scaled qs_,(x12,y12)) withcolor (r3,g3,b3);

    %draw thelabel(btex $\Rightarrow$ etex xscaled arx yscaled ary, ((x6+x10)/2.0,y10-arbias)) withcolor (0.5,0.5,0.5);

endfig;

end;
