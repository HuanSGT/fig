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

def tand(expr x) = sind(x)/cosd(x); enddef;

vardef drawNodes(expr interCol,outlineCol,radius) =
    drawCircle((x1,y1),interCol,outlineCol,radius);
    drawCircle((x2,y2),interCol,outlineCol,radius);
    drawCircle((x3,y3),interCol,outlineCol,radius);
    drawCircle((x4,y4),interCol,outlineCol,radius);
    drawCircle((x5,y5),interCol,outlineCol,radius);
    drawCircle((x6,y6),interCol,outlineCol,radius);
    drawCircle((x7,y7),interCol,outlineCol,radius);
    drawCircle((x8,y8),interCol,outlineCol,radius);
    drawCircle((x9,y9),interCol,outlineCol,radius);
    drawCircle((x10,y10),interCol,outlineCol,radius);
    drawCircle((x11,y11),interCol,outlineCol,radius);
    drawCircle((x12,y12),interCol,outlineCol,radius);
    drawCircle((x13,y13),interCol,outlineCol,radius);
    drawCircle((x14,y14),interCol,outlineCol,radius);
    drawCircle((x15,y15),interCol,outlineCol,radius);
    drawCircle((x16,y16),interCol,outlineCol,radius);
    drawCircle((x17,y17),interCol,outlineCol,radius);
    drawCircle((x18,y18),interCol,outlineCol,radius);
    drawCircle((x19,y19),interCol,outlineCol,radius);
    drawCircle((x20,y20),interCol,outlineCol,radius);
    drawCircle((x21,y21),interCol,outlineCol,radius);
    drawCircle((x22,y22),interCol,outlineCol,radius);
    drawCircle((x23,y23),interCol,outlineCol,radius);
    drawCircle((x24,y24),interCol,outlineCol,radius);
    drawCircle((x25,y25),interCol,outlineCol,radius);
    drawCircle((x26,y26),interCol,outlineCol,radius);
    drawCircle((x27,y27),interCol,outlineCol,radius);
    drawCircle((x28,y28),interCol,outlineCol,radius);
    drawCircle((x29,y29),interCol,outlineCol,radius);
    drawCircle((x30,y30),interCol,outlineCol,radius);
    drawCircle((x31,y31),interCol,outlineCol,radius);
    drawCircle((x32,y32),interCol,outlineCol,radius);
    drawCircle((x33,y33),interCol,outlineCol,radius);
    drawCircle((x34,y34),interCol,outlineCol,radius);
    drawCircle((x35,y35),interCol,outlineCol,radius);
    drawCircle((x36,y36),interCol,outlineCol,radius);
enddef;

vardef drawEdges(expr col,scale,alen,agl) =
    drawEdge(x1,y1,x2,y2,col,scale,alen,agl);
    drawEdge(x1,y1,x3,y3,col,scale,alen,agl);
    drawEdge(x2,y2,x3,y3,col,scale,alen,agl);
    drawEdge(x4,y4,x5,y5,col,scale,alen,agl);
    drawEdge(x4,y4,x6,y6,col,scale,alen,agl);
    drawEdge(x5,y5,x6,y6,col,scale,alen,agl);
    drawEdge(x7,y7,x8,y8,col,scale,alen,agl);
    drawEdge(x7,y7,x9,y9,col,scale,alen,agl);
    drawEdge(x8,y8,x9,y9,col,scale,alen,agl);
    drawEdge(x2,y2,x4,y4,col,scale,alen,agl);
    drawEdge(x3,y3,x7,y7,col,scale,alen,agl);
    drawEdge(x6,y6,x8,y8,col,scale,alen,agl);
    drawEdge(x10,y10,x11,y11,col,scale,alen,agl);
    drawEdge(x10,y10,x12,y12,col,scale,alen,agl);
    drawEdge(x11,y11,x12,y12,col,scale,alen,agl);
    drawEdge(x13,y13,x14,y14,col,scale,alen,agl);
    drawEdge(x13,y13,x15,y15,col,scale,alen,agl);
    drawEdge(x14,y14,x15,y15,col,scale,alen,agl);
    drawEdge(x16,y16,x17,y17,col,scale,alen,agl);
    drawEdge(x16,y16,x18,y18,col,scale,alen,agl);
    drawEdge(x17,y17,x18,y18,col,scale,alen,agl);
    drawEdge(x11,y11,x13,y13,col,scale,alen,agl);
    drawEdge(x12,y12,x16,y16,col,scale,alen,agl);
    drawEdge(x15,y15,x17,y17,col,scale,alen,agl);
    drawEdge(x19,y19,x20,y20,col,scale,alen,agl);
    drawEdge(x19,y19,x21,y21,col,scale,alen,agl);
    drawEdge(x20,y20,x21,y21,col,scale,alen,agl);
    drawEdge(x22,y22,x23,y23,col,scale,alen,agl);
    drawEdge(x22,y22,x24,y24,col,scale,alen,agl);
    drawEdge(x23,y23,x24,y24,col,scale,alen,agl);
    drawEdge(x25,y25,x26,y26,col,scale,alen,agl);
    drawEdge(x25,y25,x27,y27,col,scale,alen,agl);
    drawEdge(x26,y26,x27,y27,col,scale,alen,agl);
    drawEdge(x20,y20,x22,y22,col,scale,alen,agl);
    drawEdge(x21,y21,x25,y25,col,scale,alen,agl);
    drawEdge(x24,y24,x26,y26,col,scale,alen,agl);
    drawEdge(x28,y28,x29,y29,col,scale,alen,agl);
    drawEdge(x28,y28,x30,y30,col,scale,alen,agl);
    drawEdge(x29,y29,x30,y30,col,scale,alen,agl);
    drawEdge(x31,y31,x32,y32,col,scale,alen,agl);
    drawEdge(x31,y31,x33,y33,col,scale,alen,agl);
    drawEdge(x32,y32,x33,y33,col,scale,alen,agl);
    drawEdge(x34,y34,x35,y35,col,scale,alen,agl);
    drawEdge(x34,y34,x36,y36,col,scale,alen,agl);
    drawEdge(x35,y35,x36,y36,col,scale,alen,agl);
    drawEdge(x29,y29,x31,y31,col,scale,alen,agl);
    drawEdge(x30,y30,x34,y34,col,scale,alen,agl);
    drawEdge(x33,y33,x35,y35,col,scale,alen,agl);
    drawEdge(x5,y5,x10,y10,col,scale,alen,agl);
    drawEdge(x9,y9,x19,y19,col,scale,alen,agl);
    drawEdge(x18,y18,x23,y23,col,scale,alen,agl);
    drawEdge(x1,y1,x28,y28,col,scale,alen,agl);
    drawEdge(x14,y14,x32,y32,col,scale,alen,agl);
    drawEdge(x27,y27,x36,y36,col,scale,alen,agl);
enddef;

beginfig(1)

    pickup pencircle scaled 1.5; %缩放画笔

%    drawAxis(16,16);

    l:=20u;
    ll := l / 2.0;
    h:=l*sqrt(3.0)/2.0;
    r:=1.5u;
    radius0 := 2u;
    radius1 := 2u;
    radius2 := 1.5u;
    radius3 := 1u;

    rhs:=50u;

    y1 := 0u;
    y2 := y3 := y1 - h;
    y4 := y7 := y2 - h;
    y5 := y6 := y8 := y9 = y4 - h;
    y10 := y19 := y5 - h;
    y11 := y12 := y20 := y21 := y10 - h;
    y13 := y16 := y22 := y25 := y11 - h;
    y14 := y15 := y17 := y18 := y23 := y24 := y26 := y27 := y13 - h;
    y28 := y14 - h;
    y29 := y30 := y28 - h;
    y31 := y34 := y29 - h;
    y32 := y33 := y35 := y36 = y31 - h;

    x14 := 0u;
    x13 := x14 + ll;
    x15 := x11 := x13 + ll;
    x10 := x15 + ll;
    x32 := x17 := x12 := x5 := x10 + ll;
    x31 := x16 := x4 := x32 + ll;
    x33 := x29 := x18 := x6 := x2 := x31 + ll;
    x28 := x1 := x33 + ll;
    x35 := x30 := x23 := x8 := x3 = x28 + ll;
    x34 := x22 := x7 := x35 + ll;
    x36 := x24 := x20 := x9 := x34 + ll;
    x19 := x36 + ll;
    x26 := x21 := x19 + ll;
    x25 := x26 + ll;
    x27 := x25 + ll;
    
    arx:=5;
    ary:=3;

    qxbias:=3u;
    qs:=1.6;
    qss:=2.5;

    gap := r/2;% + 0.37u;

    r1 := 1; g1 := 0; b1 := 0;
    r2 := 0; g2 := 0.8; b2 := 0;
    r3 := 0; g3 := 0; b3 := 1;
    r4 := r1; g4 := 0; b4 := b3;

    scalea := 1.5; lena := 5; anga := 62;
    scaleb := 1; lenb := 3.3; angb := 55;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% lhs
    drawEdges(black,scalea,lena,anga);
    drawNodes(black,black,4u);


endfig;

end;
