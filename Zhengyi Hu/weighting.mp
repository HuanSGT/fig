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

vardef joinx(expr xl,xr,y,la,lb) =
    k := 0.52;
    xm := xl*k+(1-k)*xr;
    xmm := xl*(1-k)+k*xr;
    gap := 0.8u;
    drawarrow (xl + r/2.0 + gap,y+gap) -- (xr - r/2.0 - gap,y+gap) withcolor black;% scaled scale;
    drawarrow (xr - r/2.0 - gap,y-gap) -- (xl + r/2.0 + gap,y-gap) withcolor black;% scaled scale;
    label.top(la,(xm,y + gapp));
    label.bot(lb,(xmm,y - gapp));
enddef;

vardef joinxx(expr xl,xr,y,la,lb) =
    k := 0.52;
    xm := xl*k+(1-k)*xr;
    xmm := xl*(1-k)+k*xr;
    gap := 0.8u;
    drawarrow (xl + r/2.0 + gap,y-gap) -- (xr - r/2.0 - gap,y-gap) withcolor black;% scaled scale;
    drawarrow (xr - r/2.0 - gap,y+gap) -- (xl + r/2.0 + gap,y+gap) withcolor black;% scaled scale;
    label.top(lb,(xmm,y + gapp));
    label.bot(la,(xm,y - gapp));
enddef;

vardef joiny(expr x,yl,yr,la,lb) =
    k := 0.52;
    ym := yl*k+(1-k)*yr;
    ymm := yl*(1-k)+k*yr;
    gap := 0.8u;
    drawarrow (x+gap,yl + r/2.0 + gap) -- (x+gap,yr - r/2.0 - gap) withcolor black;% scaled scale;
    drawarrow (x-gap,yr - r/2.0 - gap) -- (x-gap,yl + r/2.0 + gap) withcolor black;% scaled scale;
    label.rt(la,(x + gapp,ym));
    label.lft(lb,(x - gapp,ymm));
enddef;

vardef joinyy(expr x,yl,yr,la,lb) =
    k := 0.52;
    ym := yl*k+(1-k)*yr;
    ymm := yl*(1-k)+k*yr;
    gap := 0.8u;
    drawarrow (x-gap,yl + r/2.0 + gap) -- (x-gap,yr - r/2.0 - gap) withcolor black;% scaled scale;
    drawarrow (x+gap,yr - r/2.0 - gap) -- (x+gap,yl + r/2.0 + gap) withcolor black;% scaled scale;
    label.rt(lb,(x + gapp,ymm));
    label.lft(la,(x - gapp,ym));
enddef;

def tand(expr x) = sind(x)/cosd(x); enddef;

beginfig(1)

    pickup pencircle scaled 1; %缩放画笔

%    drawAxis(16,16);

    l:=20u;
    r:=8u;
    radius0 := 2u;
    radius1 := 2u;
    radius2 := 1.5u;
    radius3 := 1u;

    gapp := 1.2u;

    arx:=4;
    ary:=2.3;

    qxbias:=3u;
    qs:=1.5;
    qss:=1.5;

    gap := r/2;% + 0.37u;

    r1 := 1; g1 := 0; b1 := 0;
    r2 := 0; g2 := 0.8; b2 := 0;
    r3 := 0; g3 := 0; b3 := 1;
    r4 := r1; g4 := 0; b4 := b3;

    ahlength := 5; ahangle := 40;
    scalea := 1.5; lena := 5; anga := 62;
    scaleb := 1; lenb := 3.3; angb := 55;
    rhs:=50u;

    len := 20u;

    yu := 0;
    yuu := yu + len * 1.2;
    yd := yu - len * 1.2;
    ydd := yd - len;
    x := 0;
    uu := x;
    w := uu + len;
    v := w + len;
    y := v;
    a := (uu + w) / 2.0;
    b := (w + v) / 2.0;
    drawCircle((a,yuu),white,blue,r);
    drawCircle((b,yuu),white,red,r);

    drawCircle((a,yu),white,blue,r);
    drawCircle((b,yu),white,red,r);

    drawCircle((uu,yd),white,blue,r);
    drawCircle((w,yd),white,(0.5,0.5,0.5),r);
    drawCircle((v,yd),white,red,r);

    drawCircle((x,ydd),white,blue,r);
    drawCircle((y,ydd),white,red,r);

    joinx(a,b,yuu,btex $1$ etex scaled qss,btex $1$ etex scaled qss);
    joinx(a,b,yu,btex $W_{uv}$ etex scaled qss,btex $W_{vu}$ etex scaled qss);
    joinx(uu,w,yd,btex $W_{uv}$ etex scaled qss,btex $1$ etex scaled qss);
    joinxx(w,v,yd,btex $1$ etex scaled qss,btex $W_{vu}$ etex scaled qss);
    joiny(x,ydd,yd,btex $1$ etex scaled qss,btex $\theta W_{uv}$ etex scaled qss);
    joinyy(y,ydd,yd,btex $1$ etex scaled qss,btex $\theta W_{vu}$ etex scaled qss);

    label(btex $g = 0$   etex scaled qss,((a+b)/2.0,yuu-len/2.0));

    label(btex $\pmb{a}$ etex scaled qs,(a,yuu));
    label(btex $\pmb{b}$ etex scaled qs,(b,yuu));
    label(btex $\pmb{u}$ etex scaled qs,(a,yu));
    label(btex $\pmb{v}$ etex scaled qs,(b,yu));
    label(btex $\pmb{u}$ etex scaled qs,(uu,yd));
    label(btex $\pmb{w}$ etex scaled qs,(w,yd));
    label(btex $\pmb{v}$ etex scaled qs,(v,yd));
    label(btex $\pmb{x}$ etex scaled qs,(x,ydd));
    label(btex $\pmb{y}$ etex scaled qs,(y,ydd));

    draw thelabel(btex $\Rightarrow$ etex rotated 270 xscaled arx yscaled ary, (w,(yu + yd)/2.0)) withcolor (0,1,0);
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% lhs


endfig;

end;
