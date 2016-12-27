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

vardef joinx(expr xl,xr,yy,la,lb) =
    k := 0.52;
    xm := xl*k+(1-k)*xr;
    xmm := xl*(1-k)+k*xr;
    ahlength := 5; ahangle := 62;
    gap := 0.04u;
    drawarrow (xl + r/2.0 + gap,yy+gap) -- (xr - r/2.0 - gap,yy+gap) withcolor black;% scaled scale;
    drawarrow (xr - r/2.0 - gap,yy-gap) -- (xl + r/2.0 + gap,yy-gap) withcolor black;% scaled scale;
    label.top(la,(xm,yy + gap));
    label.bot(lb,(xmm,yy - gap));
enddef;

vardef joiny(expr x,yl,yr,la,lb) =
    k := 0.52;
    ym := yl*k+(1-k)*yr;
    ymm := yl*(1-k)+k*yr;
    ahlength := 5; ahangle := 62;
    gap := 0.04u;
    drawarrow (x+gap,yl + r/2.0 + gap) -- (x+gap,yr - r/2.0 - gap) withcolor black;% scaled scale;
    drawarrow (x-gap,yr - r/2.0 - gap) -- (x-gap,yl + r/2.0 + gap) withcolor black;% scaled scale;
    label.lrt(la,(x + gap,ym));
    label.llft(lb,(y - gap,ymm));
enddef;

def tand(expr x) = sind(x)/cosd(x); enddef;

beginfig(1)

    pickup pencircle scaled 1.5; %缩放画笔

%    drawAxis(16,16);

    l:=20u;
    r:=3u;
    radius0 := 2u;
    radius1 := 2u;
    radius2 := 1.5u;
    radius3 := 1u;

    arx:=5;
    ary:=3;

    qxbias:=3u;
    qs:=0.7;
    qss:=0.75;

    gap := r/2;% + 0.37u;

    r1 := 1; g1 := 0; b1 := 0;
    r2 := 0; g2 := 0.8; b2 := 0;
    r3 := 0; g3 := 0; b3 := 1;
    r4 := r1; g4 := 0; b4 := b3;

    scalea := 1.5; lena := 5; anga := 62;
    scaleb := 1; lenb := 3.3; angb := 55;
    rhs:=50u;

    len := 20u;

    yu := 0;
    yd := yu - len;
    x := 10u;
    u := x;
    w := u + len;
    v := w + len;
    y := v + len;
    a := (u + w) / 2.0;
    b := (w + v) / 2.0;
    drawCircle((x,yd),white,blue,r);
    drawCircle((u,yd),white,blue,r);
    drawCircle((w,yd),white,black,r);
    drawCircle((v,yd),white,red,r);
    drawCircle((y,yd),white,red,r);
    drawCircle((a,yu),white,blue,r);
    drawCircle((b,yu),white,red,r);

    joinx(a,b,yu,btex $W_{uv}$ etex scaled qss,btex $W_{vu}$ etex scaled qss);
    %joinx(x,u,yd,btex $1$ etex scaled qss,btex $\theta W_{uv}$ etex scaled qss);
    %joinx(u,w,yd,btex $W_{uv}$ etex scaled qss,btex $1$ etex scaled qss);
    %joinx(w,v,yd,btex $1$ etex scaled qss,btex $W_{vu}$ etex scaled qss);
    %joinx(v,y,yd,btex $\theta W_{vu}$ etex scaled qss,btex $1$ etex scaled qss);

    label(btex $x$ etex scaled qs,(x,yd));
    label(btex $u$ etex scaled qs,(u,yd));
    label(btex $w$ etex scaled qs,(w,yd));
    label(btex $v$ etex scaled qs,(v,yd));
    label(btex $y$ etex scaled qs,(y,yd));
    label(btex $u$ etex scaled qs,(a,yu));
    label(btex $v$ etex scaled qs,(b,yu));
    

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% lhs


endfig;

end;

