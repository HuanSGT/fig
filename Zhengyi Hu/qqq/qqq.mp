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

    ahlength := alen; ahangle := agl;
    %ahlength := 4; ahangle := 55;

    %pickup pencircle scaled 1; %缩放画笔
    draw (xl,yl) -- (xr,yr) withcolor col withpen pencircle scaled scale;
    draw (xm,ym) -- (xr,yr) withcolor col withpen pencircle scaled scale;
    %drawarrow (xl,yl) -- (xm,ym) withcolor col withpen pencircle scaled scale;

    pickup open;
enddef;

vardef drawCircles(expr x, y, interCol, outlineCol, radius)=
    drawCircle((x,y),interCol,outlineCol,radius);
    drawCircle((-x,y),interCol,outlineCol,radius);
    drawCircle((x,-y),interCol,outlineCol,radius);
    drawCircle((-x,-y),interCol,outlineCol,radius);
enddef;

vardef drawEdges(expr xl,yl,xr,yr,scale,alen,agl)=
    drawEdge(xl,yl,xr,yr,(r4,g4,b4),scale,alen,agl);
    drawEdge(-xl,yl,-xr,yr,(r3,g3,b3),scale,alen,agl);
    drawEdge(xl,-yl,xr,-yr,(r1,g1,b1),scale,alen,agl);
    drawEdge(-xl,-yl,-xr,-yr,(r2,g2,b2),scale,alen,agl);
enddef;

vardef drawEdges_one(expr col,scale,alen,agl) =
    drawEdge(x4,y4,x6,y6,col,scale,alen,agl);
    drawEdge(x9,y9,x11,y11,col,scale,alen,agl);
    drawEdge(x11,y11,x13,y13,col,scale,alen,agl);
    drawEdge(x9,y9,x12,y12,col,scale,alen,agl);
    drawEdge(x12,y12,x13,y13,col,scale,alen,agl);
enddef;

vardef drawEdges_two(expr col,scale,alen,agl) =
    drawEdge(x5,y5,x6,y6,col,scale,alen,agl);
    drawEdge(x13,y13,x14,y14,col,scale,alen,agl);
    drawEdge(x13,y13,x15,y15,col,scale,alen,agl);
    drawEdge(x14,y14,x16,y16,col,scale,alen,agl);
    drawEdge(x15,y15,x16,y16,col,scale,alen,agl);
enddef;

vardef drawEdges_three(expr col,scale,alen,agl) =
    drawEdge(x3,y3,x5,y5,col,scale,alen,agl);
    drawEdge(x7,y7,x17,y17,col,scale,alen,agl);
    drawEdge(x17,y17,x16,y16,col,scale,alen,agl);
    drawEdge(x16,y16,x18,y18,col,scale,alen,agl);
    drawEdge(x18,y18,x7,y7,col,scale,alen,agl);
enddef;

vardef drawEdges_four(expr col,scale,alen,agl) =
    drawEdge(x3,y3,x4,y4,col,scale,alen,agl);
    drawEdge(x9,y9,x8,y8,col,scale,alen,agl);
    drawEdge(x9,y9,x10,y10,col,scale,alen,agl);
    drawEdge(x8,y8,x7,y7,col,scale,alen,agl);
    drawEdge(x10,y10,x7,y7,col,scale,alen,agl);
    %drawEdge(x1,y1,x2,y2,col,scale,alen,agl);
enddef;

vardef drawEdgess(expr scale,alen,agl) =
    drawEdges(x20,y20,x21,y21,scale,alen,agl);
    drawEdges(x20,y20,x22,y22,scale,alen,agl);
    drawEdges(x20,y20,x33,y33,scale,alen,agl);
    drawEdges(x20,y20,x34,y34,scale,alen,agl);
    drawEdges(x21,y21,x23,y23,scale,alen,agl);
    drawEdges(x22,y22,x23,y23,scale,alen,agl);
    drawEdges(x33,y33,x35,y35,scale,alen,agl);
    drawEdges(x34,y34,x35,y35,scale,alen,agl);
    drawEdges(x23,y23,x24,y24,scale,alen,agl);
    drawEdges(x23,y23,x25,y25,scale,alen,agl);
    drawEdges(x35,y35,x36,y36,scale,alen,agl);
    drawEdges(x35,y35,x37,y37,scale,alen,agl);
    drawEdges(x24,y24,x26,y26,scale,alen,agl);
    drawEdges(x25,y25,x26,y26,scale,alen,agl);
    drawEdges(x36,y36,x26,y26,scale,alen,agl);
    drawEdges(x37,y37,x26,y26,scale,alen,agl);
enddef;

vardef drawNodes_one(expr interCol,outlineCol,radius) =
enddef;

vardef drawNodes_two(expr interCol,outlineCol,radius) =
    drawCircle((x9,y9),interCol,outlineCol,radius);
    drawCircle((x13,y13),interCol,outlineCol,radius);
    drawCircle((x16,y16),interCol,outlineCol,radius);
    drawCircle((x7,y7),interCol,outlineCol,radius);
enddef;

vardef drawNodes_three(expr interCol,outlineCol,radius) =
    %drawCircle((x1,y1),interCol,outlineCol,radius);
    %drawCircle((x2,y2),interCol,outlineCol,radius);
    drawCircle((x3,y3),interCol,outlineCol,radius);
    drawCircle((x4,y4),interCol,outlineCol,radius);
    drawCircle((x5,y5),interCol,outlineCol,radius);
    drawCircle((x6,y6),interCol,outlineCol,radius);
    drawCircle((x8,y8),interCol,outlineCol,radius);
    drawCircle((x10,y10),interCol,outlineCol,radius);
    drawCircle((x11,y11),interCol,outlineCol,radius);
    drawCircle((x12,y12),interCol,outlineCol,radius);
    drawCircle((x14,y14),interCol,outlineCol,radius);
    drawCircle((x15,y15),interCol,outlineCol,radius);
    drawCircle((x17,y17),interCol,outlineCol,radius);
    drawCircle((x18,y18),interCol,outlineCol,radius);
enddef;

vardef drawNodess_one(expr interCol,outlineCol,radius) =
    drawCircles(x20,y20,interCol,outlineCol,radius);
    drawCircles(x26,y26,interCol,outlineCol,radius);
enddef;

vardef drawNodess_two(expr interCol,outlineCol,radius) =
    drawCircles(x23,y23,interCol,outlineCol,radius);
    drawCircles(x35,y35,interCol,outlineCol,radius);
enddef;

vardef drawNodess_three(expr interCol,outlineCol,radius) =
    drawCircles(x24,y24,interCol,outlineCol,radius);
    drawCircles(x25,y25,interCol,outlineCol,radius);
    drawCircles(x36,y36,interCol,outlineCol,radius);
    drawCircles(x37,y37,interCol,outlineCol,radius);
    drawCircles(x21,y21,interCol,outlineCol,radius);
    drawCircles(x22,y22,interCol,outlineCol,radius);
    drawCircles(x33,y33,interCol,outlineCol,radius);
    drawCircles(x34,y34,interCol,outlineCol,radius);
enddef;

def tand(expr x) = sind(x)/cosd(x); enddef;

beginfig(1)

    pickup pencircle scaled 1.5; %缩放画笔

%    drawAxis(16,16);

    l:=20u;
    r:=1.5u;
    theta := 25;
    x := l * sind(theta) * 2.0 / 3.0;
    y := l * cosd(theta) * 2.0 / 3.0;
    radius0 := 2.2u;
    radius1 := 2.2u;
    radius2 := 1.9u;
    radius3 := 1.4u * 1.0;

    rhs:=50u;

    alpha := 18;
    beta  := 36;
    s1 := c4 := l * sind(alpha) / 1.5;
    s2 := c3 := l * sind(beta) / 1.5;
    s3 := c2 := l * sind(90 - beta) / 1.5;
    s4 := c1 := l * sind(90 - alpha) / 1.5;

    x20 := 0; y26 := 0;

    x21 := x20 - c1; 
    x23 := x21 - c2;
    x22 := x20 - c2;

    x24 := x23 - c3;
    x26 := x24 - c4;
    x25 := x23 - c4;

    x33 := x20 - c3;
    x35 := x33 - c4;
    x34 := x20 - c4;

    x36 := x35 - c1;
    x37 := x35 - c2;

    y37 := y26 - s1;
    y35 := y37 - s2;
    y36 := y26 - s2;

    y34 := y35 - s3;
    y20 := y34 - s4;
    y33 := y35 - s4;

    y25 := y26 - s3;
    y23 := y25 - s4;
    y24 := y26 - s4;

    y22 := y23 - s1;
    y21 := y23 - s2;

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    x1 := x2 := x26 - l * 4.5;
    x3 := x6 := x1 + l*1.5;
    x4 := x3 - l/4;
    x5 := x3 + l/4;

    x7 := x13 := x3 + l * 1.6;%2;
    x10 := x12 := x7 - x;
    x8 := x11 := x7 - y;
    x9 := x8 - x;
    x14 := x17 := x7 + x;
    x15 := x18 := x7 + y;
    x16 := x15 + x;

    y1 := y3 := y7 := y20;%-y20 + l;
    y2 := y1 + l;
    y4 := y5 := y3 + l/2;
    y6 := y4 + l/2;
    y8 := y18 := y7 + x;
    y10 := y17 := y7 + y;
    y9 := y16 := y10 + x;
    y12 := y14 := y9 + x;
    y11 := y15 := y9 + y;
    y13 := y11 + x;

    arx:=5;
    ary:=3;

    qxbias:=3u;
    qs:=1.6;
    qss:=1.875;

    gap := r/2;% + 0.37u;

    r1 := 0; g1 := 0.8; b1 := 0;
    r2 := 0; g2 := 0; b2 := 1;
    r3 := 0.25; g3 := 0.25; b3 := 0.25;
    r4 := 1; g4 := 0; b4 := 0;

    scalea := 1.5; lena := 5; anga := 62;
    scaleb := 1; lenb := 3.3; angb := 55;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% lhs

    drawEdges_one((r1,g1,b1)  ,scalea,lena,anga);
    drawEdges_two((r2,g2,b2)  ,scalea,lena,anga);
    drawEdges_three((r3,g3,b3),scalea,lena,anga);
    drawEdges_four((r4,g4,b4) ,scalea,lena,anga);

    drawEdgess(scalea,lena,anga);
    
    drawNodes_one(black,black,radius1);
    drawNodes_two(black,black,radius2);
    drawNodes_three(black,black,radius3);
    
    drawNodess_one(black,black,radius1);
    drawNodess_two(black,black,radius2);
    drawNodess_three(black,black,radius3);
    
    %label(btex $t=0$ etex scaled qss,((x1+x2)/2,y1+l/2));
    %label(btex $t=1$ etex scaled qss,((x3+x6)/2,(y3+y6)/2));
    %label(btex $t=2$ etex scaled qss,((x7+x10)/2,(y7+y10)/2));
    %label(btex $t=3$ etex scaled qss,((x21+x22)/2,(y21+y22)/2));
    tgap := l/2;
    %label(btex $g=0$ etex scaled qss,(x1,y1-tgap));
    label(btex $g=1$ etex scaled qss,(x3,y3-tgap));
    label(btex $g=2$ etex scaled qss,(x7,y7-tgap));
    label(btex $g=3$ etex scaled qss,(x20,y20-tgap));

endfig;

end;
