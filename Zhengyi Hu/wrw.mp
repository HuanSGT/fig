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

vardef drawCircle(expr loc, interCol, outlineCol, radius)=
    pen prepen;
    prepen:=currentpen;

    %pickup pencircle scaled 1.1; %缩放画笔
    fill fullcircle scaled radius shifted loc withcolor interCol;
    draw fullcircle scaled radius shifted loc withcolor outlineCol;
    pickup prepen;
enddef;

vardef drawEdge(expr xl,yl,xr,yr,col,scale,alen,agl)=
    pen open;
    open:=currentpen;

    k := 0.43;
    xm := xl*k+(1-k)*xr;
    ym := yl*k+(1-k)*yr;

    %ahlength := 5; ahangle := 62;
    %ahlength := 4; ahangle := 55;

    %pickup pencircle scaled 1; %缩放画笔
    draw (xl,yl) -- (xr,yr) withcolor col withpen pencircle;% scaled scale;
    draw (xm,ym) -- (xr,yr) withcolor col withpen pencircle;% scaled scale;
    %drawarrow (xl,yl) -- (xm,ym) withcolor col withpen pencircle scaled scale;

    pickup open;
enddef;

vardef join(expr xl,xr,y,la,lb) =
    k := 0.52;
    xm := xl*k+(1-k)*xr;
    xmm := xl*(1-k)+k*xr;
    ahlength := 5; ahangle := 62;
    gap := 0.04u;
    drawarrow (xl + r/2.0 + gap,y+gap) -- (xr - r/2.0 - gap,y+gap) withcolor black;% scaled scale;
    drawarrow (xr - r/2.0 - gap,y-gap) -- (xl + r/2.0 + gap,y-gap) withcolor black;% scaled scale;
    label.top(la,(xm,y + gap));
    label.bot(lb,(xmm,y - gap));
enddef;

def tand(expr x) = sind(x)/cosd(x); enddef;

beginfig(1)

    pickup pencircle scaled 1; %缩放画笔

%    drawAxis(16,16);

    l:=20u;
    r:=5u;
    radius0 := 2u;
    radius1 := 2u;
    radius2 := 1.5u;
    radius3 := 1u;

    arx:=5;
    ary:=3;

    qxbias:=3u;
    qs:=1.0;
    qss:=1.0;

    gap := 0.33u;% + 0.37u;

    r1 := 1; g1 := 0; b1 := 0;
    r2 := 0; g2 := 0.8; b2 := 0;
    r3 := 0; g3 := 0; b3 := 1;
    r4 := r1; g4 := 0; b4 := b3;

    scalea := 1.5; lena := 5; anga := 62;
    scaleb := 1; lenb := 3.3; angb := 55;
    rhs:=50u;

    len := 25u;

    xi := 0; yi := 0;
    xj := xi + len; yj := yi;
    xk := xi; yk := yi + len;

    kk := 0.52;

    ahlength := 5; ahangle := 40;
    drawarrow (xi + r/2.0 + gap,yi) -- (xj - r/2.0 - gap,yi) withcolor black;% scaled scale;
    drawarrow (xi,yi + r/2.0 + gap) -- (xi,yk - r/2.0 - gap) withcolor black;% scaled scale;
    label.llft(btex $2$ etex scaled qss,(xi,yi*kk+yk*(1-kk)));
    label.bot(btex $1$ etex scaled qss,(xi*kk+xj*(1-kk),yi));

    drawCircle((xi,yi),white,(0.5,0.5,0.5),r);
    drawCircle((xj,yj),white,blue,r);
    drawCircle((xk,yk),white,red,r);

    label(btex $\pmb{i}$ etex scaled qs,(xi,yi));
    label(btex $\pmb{j}$ etex scaled qs,(xj,yj));
    label(btex $\pmb{k}$ etex scaled qs,(xk,yk));

    xm := (xi + xj) / 2.0;
    ym := (yi + yk) / 2.0;
    label.top(btex $p(j|i) = \frac{1}{3}$ etex scaled qss,(xm,ym));
    label.bot(btex $p(k|i) = \frac{2}{3}$ etex scaled qss,(xm,ym));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% lhs


endfig;

end;

