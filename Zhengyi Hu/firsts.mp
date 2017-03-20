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

vardef drawEdges_onea(expr col,scale,alen,agl) =
    drawEdge(x5,y5,x3,y3,col,scale,alen,agl);
    drawEdge(x9,y9,x7,y7,col,scale,alen,agl);
    drawEdge(x9,y9,x14,y14,col,scale,alen,agl);
    drawEdge(x14,y14,x13,y13,col,scale,alen,agl);
    drawEdge(x13,y13,x7,y7,col,scale,alen,agl);
    drawEdge(x22,y22,x20,y20,col,scale,alen,agl);
    drawEdge(x22,y22,x40,y40,col,scale,alen,agl);
    drawEdge(x40,y40,x41,y41,col,scale,alen,agl);
    drawEdge(x41,y41,x20,y20,col,scale,alen,agl);
enddef;

vardef drawEdges_oneb(expr col,scale,alen,agl) =
    drawEdge(x22,y22,x46,y46,col,scale,alen,agl);
    drawEdge(x46,y46,x47,y47,col,scale,alen,agl);
    drawEdge(x47,y47,x20,y20,col,scale,alen,agl);
    drawEdge(x22,y22,x42,y42,col,scale,alen,agl);
    drawEdge(x42,y42,x43,y43,col,scale,alen,agl);
    drawEdge(x43,y43,x40,y40,col,scale,alen,agl);
    drawEdge(x40,y40,x44,y44,col,scale,alen,agl);
    drawEdge(x44,y44,x45,y45,col,scale,alen,agl);
    drawEdge(x45,y45,x41,y41,col,scale,alen,agl);
    drawEdge(x41,y41,x48,y48,col,scale,alen,agl);
    drawEdge(x48,y48,x49,y49,col,scale,alen,agl);
    drawEdge(x49,y49,x20,y20,col,scale,alen,agl);
enddef;

vardef drawEdges_twoa(expr col,scale,alen,agl) =
    drawEdge(x3,y3,x4,y4,col,scale,alen,agl);
    drawEdge(x7,y7,x8,y8,col,scale,alen,agl);
    drawEdge(x7,y7,x11,y11,col,scale,alen,agl);
    drawEdge(x11,y11,x12,y12,col,scale,alen,agl);
    drawEdge(x12,y12,x8,y8,col,scale,alen,agl);
    drawEdge(x20,y20,x21,y21,col,scale,alen,agl);
    drawEdge(x20,y20,x24,y24,col,scale,alen,agl);
    drawEdge(x24,y24,x25,y25,col,scale,alen,agl);
    drawEdge(x25,y25,x21,y21,col,scale,alen,agl);
enddef;

vardef drawEdges_twob(expr col,scale,alen,agl) =
    drawEdge(x20,y20,x32,y32,col,scale,alen,agl);
    drawEdge(x32,y32,x33,y33,col,scale,alen,agl);
    drawEdge(x33,y33,x21,y21,col,scale,alen,agl);
    drawEdge(x20,y20,x26,y26,col,scale,alen,agl);
    drawEdge(x26,y26,x27,y27,col,scale,alen,agl);
    drawEdge(x27,y27,x24,y24,col,scale,alen,agl);
    drawEdge(x24,y24,x28,y28,col,scale,alen,agl);
    drawEdge(x28,y28,x29,y29,col,scale,alen,agl);
    drawEdge(x29,y29,x25,y25,col,scale,alen,agl);
    drawEdge(x25,y25,x31,y31,col,scale,alen,agl);
    drawEdge(x31,y31,x30,y30,col,scale,alen,agl);
    drawEdge(x30,y30,x21,y21,col,scale,alen,agl);
enddef;

vardef drawEdges_threea(expr col,scale,alen,agl) =
    drawEdge(x4,y4,x6,y6,col,scale,alen,agl);
    drawEdge(x8,y8,x10,y10,col,scale,alen,agl);
    drawEdge(x8,y8,x17,y17,col,scale,alen,agl);
    drawEdge(x17,y17,x18,y18,col,scale,alen,agl);
    drawEdge(x18,y18,x10,y10,col,scale,alen,agl);
    drawEdge(x21,y21,x23,y23,col,scale,alen,agl);
    drawEdge(x21,y21,x60,y60,col,scale,alen,agl);
    drawEdge(x60,y60,x61,y61,col,scale,alen,agl);
    drawEdge(x61,y61,x23,y23,col,scale,alen,agl);
enddef;

vardef drawEdges_threeb(expr col,scale,alen,agl) =
    drawEdge(x21,y21,x68,y68,col,scale,alen,agl);
    drawEdge(x68,y68,x69,y69,col,scale,alen,agl);
    drawEdge(x69,y69,x23,y23,col,scale,alen,agl);
    drawEdge(x21,y21,x62,y62,col,scale,alen,agl);
    drawEdge(x62,y62,x63,y63,col,scale,alen,agl);
    drawEdge(x63,y63,x60,y60,col,scale,alen,agl);
    drawEdge(x60,y60,x64,y64,col,scale,alen,agl);
    drawEdge(x64,y64,x65,y65,col,scale,alen,agl);
    drawEdge(x65,y65,x61,y61,col,scale,alen,agl);
    drawEdge(x61,y61,x66,y66,col,scale,alen,agl);
    drawEdge(x66,y66,x67,y67,col,scale,alen,agl);
    drawEdge(x67,y67,x23,y23,col,scale,alen,agl);
enddef;

vardef drawEdges_foura(expr col,scale,alen,agl) =
    drawEdge(x5,y5,x6,y6,col,scale,alen,agl);
    drawEdge(x9,y9,x10,y10,col,scale,alen,agl);
    drawEdge(x9,y9,x15,y15,col,scale,alen,agl);
    drawEdge(x15,y15,x16,y16,col,scale,alen,agl);
    drawEdge(x16,y16,x10,y10,col,scale,alen,agl);
    drawEdge(x22,y22,x23,y23,col,scale,alen,agl);
    drawEdge(x22,y22,x50,y50,col,scale,alen,agl);
    drawEdge(x50,y50,x51,y51,col,scale,alen,agl);
    drawEdge(x51,y51,x23,y23,col,scale,alen,agl);
    %drawEdge(x1,y1,x2,y2,col,scale,alen,agl);
enddef;

vardef drawEdges_fourb(expr col,scale,alen,agl) =
    drawEdge(x22,y22,x58,y58,col,scale,alen,agl);
    drawEdge(x58,y58,x59,y59,col,scale,alen,agl);
    drawEdge(x59,y59,x23,y23,col,scale,alen,agl);
    drawEdge(x22,y22,x52,y52,col,scale,alen,agl);
    drawEdge(x52,y52,x53,y53,col,scale,alen,agl);
    drawEdge(x53,y53,x50,y50,col,scale,alen,agl);
    drawEdge(x50,y50,x54,y54,col,scale,alen,agl);
    drawEdge(x54,y54,x55,y55,col,scale,alen,agl);
    drawEdge(x55,y55,x51,y51,col,scale,alen,agl);
    drawEdge(x51,y51,x56,y56,col,scale,alen,agl);
    drawEdge(x56,y56,x57,y57,col,scale,alen,agl);
    drawEdge(x57,y57,x23,y23,col,scale,alen,agl);
enddef;

vardef drawNodes_zero(expr interCol,outlineCol,radius) =
    %drawCircle((x1,y1),interCol,outlineCol,radius);
    %drawCircle((x2,y2),interCol,outlineCol,radius);
    drawCircle((x5,y5),interCol,outlineCol,radius);
    drawCircle((x6,y6),interCol,outlineCol,radius);
    drawCircle((x9,y9),interCol,outlineCol,radius);
    drawCircle((x10,y10),interCol,outlineCol,radius);
    drawCircle((x22,y22),interCol,outlineCol,radius);
    drawCircle((x23,y23),interCol,outlineCol,radius);
enddef;

vardef drawNodes_one(expr interCol,outlineCol,radius) =
    drawCircle((x3,y3),interCol,outlineCol,radius);
    drawCircle((x4,y4),interCol,outlineCol,radius);
    drawCircle((x7,y7),interCol,outlineCol,radius);
    drawCircle((x8,y8),interCol,outlineCol,radius);
    drawCircle((x20,y20),interCol,outlineCol,radius);
    drawCircle((x21,y21),interCol,outlineCol,radius);
enddef;

vardef drawNodes_two(expr interCol,outlineCol,radius) =
    drawCircle((x11,y11),interCol,outlineCol,radius);
    drawCircle((x12,y12),interCol,outlineCol,radius);
    drawCircle((x13,y13),interCol,outlineCol,radius);
    drawCircle((x14,y14),interCol,outlineCol,radius);
    drawCircle((x15,y15),interCol,outlineCol,radius);
    drawCircle((x16,y16),interCol,outlineCol,radius);
    drawCircle((x17,y17),interCol,outlineCol,radius);
    drawCircle((x18,y18),interCol,outlineCol,radius);
    drawCircle((x41,y41),interCol,outlineCol,radius);
    drawCircle((x40,y40),interCol,outlineCol,radius);
    drawCircle((x24,y24),interCol,outlineCol,radius);
    drawCircle((x25,y25),interCol,outlineCol,radius);
    drawCircle((x60,y60),interCol,outlineCol,radius);
    drawCircle((x61,y61),interCol,outlineCol,radius);
    drawCircle((x50,y50),interCol,outlineCol,radius);
    drawCircle((x51,y51),interCol,outlineCol,radius);
enddef;

vardef drawNodes_three(expr interCol,outlineCol,radius) =
    drawCircle((x26,y26),interCol,outlineCol,radius);
    drawCircle((x27,y27),interCol,outlineCol,radius);
    drawCircle((x28,y28),interCol,outlineCol,radius);
    drawCircle((x29,y29),interCol,outlineCol,radius);
    drawCircle((x31,y31),interCol,outlineCol,radius);
    drawCircle((x30,y30),interCol,outlineCol,radius);
    drawCircle((x32,y32),interCol,outlineCol,radius);
    drawCircle((x33,y33),interCol,outlineCol,radius);
    drawCircle((x42,y42),interCol,outlineCol,radius);
    drawCircle((x43,y43),interCol,outlineCol,radius);
    drawCircle((x44,y44),interCol,outlineCol,radius);
    drawCircle((x45,y45),interCol,outlineCol,radius);
    drawCircle((x46,y46),interCol,outlineCol,radius);
    drawCircle((x47,y47),interCol,outlineCol,radius);
    drawCircle((x48,y48),interCol,outlineCol,radius);
    drawCircle((x49,y49),interCol,outlineCol,radius);
    drawCircle((x52,y52),interCol,outlineCol,radius);
    drawCircle((x53,y53),interCol,outlineCol,radius);
    drawCircle((x54,y54),interCol,outlineCol,radius);
    drawCircle((x55,y55),interCol,outlineCol,radius);
    drawCircle((x56,y56),interCol,outlineCol,radius);
    drawCircle((x57,y57),interCol,outlineCol,radius);
    drawCircle((x58,y58),interCol,outlineCol,radius);
    drawCircle((x59,y59),interCol,outlineCol,radius);
    drawCircle((x62,y62),interCol,outlineCol,radius);
    drawCircle((x63,y63),interCol,outlineCol,radius);
    drawCircle((x64,y64),interCol,outlineCol,radius);
    drawCircle((x65,y65),interCol,outlineCol,radius);
    drawCircle((x66,y66),interCol,outlineCol,radius);
    drawCircle((x67,y67),interCol,outlineCol,radius);
    drawCircle((x68,y68),interCol,outlineCol,radius);
    drawCircle((x69,y69),interCol,outlineCol,radius);
enddef;

def tand(expr x) = sind(x)/cosd(x); enddef;

beginfig(1)

    pickup pencircle scaled 1.5; %缩放画笔

%    drawAxis(16,16);

    l:=20u;
    r:=1.5u;
    radius0 := 2u;
    radius1 := 2u;
    radius2 := 1.5u;
    radius3 := 1u;

    rhs:=50u;

    x1 := 0u; y1 := 0u;
    x2 := x1 + l; y2 := y1;

    x3 := x5 := x2 + l/2;
    x4 := x6 := x5 + l;
    y5 := y6 := y2;
    y3 := y4 := y5 + l;

    x14 := x13 := x6 + l/2;
    x15 := x9 := x7 := x11 := x14 + l/2;
    x16 := x10 := x8 := x12 := x15 + l;
    x18 := x17 := x16 + l/2;

    y11 := y12 := y5 + l*2;
    y13 := y7 := y8  := y17 := y11-l/2;
    y14 := y9 := y10 := y18 := y13-l;
    y15 := y16 := y9 - l/2;

    width  := l*5/12;
    height := l / 6;
    
    x44 := x45 := x18 + height + l/2;
    x40 := x41 := x44 + height;
    x43 := x48 := x40 + (l-width)/2;
    x42 := x49 := x43 + width;
    x53 := x52 := x46 := x47 := x26 := x27 := x40 + l - height;
    x50 := x22 := x20 := x24 := x40 + l;
    x54 := x58 := x32 := x28 := x50 + (l-width)/2;
    x55 := x59 := x33 := x29 := x54 + width;
    x51 := x23 := x21 := x25 := x50 + l;
    x56 := x57 := x69 := x68 := x30 := x31 := x51 + height;
    x67 := x62 := x51 + (l-width)/2;
    x66 := x63 := x67 + width;
    x61 := x60 := x66 + (l-width)/2;
    x65 := x64 := x61 + height;

    tgap := l*1/2;

    y28 := y29 := y1 + l*3 + height*2;% y1 - tgap*2;
    y24 := y25 := y28 - height;
    y27 := y31 := y24 - (l-width)/2;
    y26 := y30 := y27 - width;
    y48 := y49 := y32 := y33 := y62 := y63 := y24 - l + height;
    y41 := y20 := y21 := y60 := y24 - l;
    y45 := y47 := y68 := y64 := y41 - (l-width)/2;
    y44 := y46 := y69 := y65 := y45 - width;
    y40 := y22 := y23 := y61 := y41 - l;
    y43 := y42 := y58 := y59 := y67 := y66 := y40 - height;
    y52 := y57 := y40 - (l-width)/2;
    y53 := y56 := y52 - width;
    y50 := y51 := y53 - (l-width)/2;
    y54 := y55 := y50 - height;

    
    arx:=5;
    ary:=3;

    qxbias:=3u;
    qs:=1.6;
    qss:=2.5;

    gap := r/2;% + 0.37u;

    r1 := 1; g1 := 0; b1 := 0;
    r2 := 0; g2 := 0.8; b2 := 0;
    r3 := 0; g3 := 0; b3 := 1;
    r4 := 0.25; g4 := 0.25; b4 := 0.25;

    scalea := 1.5; lena := 5; anga := 62;
    scaleb := 1; lenb := 3.3; angb := 55;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% lhs

    drawEdges_onea((r1,g1,b1)  ,scalea,lena,anga);
    drawEdges_twoa((r2,g2,b2)  ,scalea,lena,anga);
    drawEdges_threea((r3,g3,b3),scalea,lena,anga);
    drawEdges_foura((r4,g4,b4) ,scalea,lena,anga);

    drawEdges_oneb((r1,g1,b1)  ,scaleb,lenb,angb);
    drawEdges_twob((r2,g2,b2)  ,scaleb,lenb,angb);
    drawEdges_threeb((r3,g3,b3),scaleb,lenb,angb);
    drawEdges_fourb((r4,g4,b4) ,scaleb,lenb,angb);

    %drawNodes1((ra,ga,ba));
    %drawNodes2((rb,gb,bb));
    %drawNodes3((rc,gc,bc));
    %drawNodes4((rd,gd,bd));
    
    drawNodes_zero(black,black,radius0);
    drawNodes_one(black,black,radius1);
    drawNodes_two(black,black,radius2);
    drawNodes_three(black,black,radius3);
    

    %label(btex $t=0$ etex scaled qss,((x1+x2)/2,y1+l/2));
    %label(btex $t=1$ etex scaled qss,((x3+x6)/2,(y3+y6)/2));
    %label(btex $t=2$ etex scaled qss,((x7+x10)/2,(y7+y10)/2));
    %label(btex $t=3$ etex scaled qss,((x21+x22)/2,(y21+y22)/2));
    %label(btex $g=0$ etex scaled qss,(x1+l/2,y1-tgap));
    label(btex $g=1$ etex scaled qss,(x5+l/2,y5-tgap));
    label(btex $g=2$ etex scaled qss,(x15+l/2,y15-tgap));
    label(btex $g=3$ etex scaled qss,(x50+l/2,y54-tgap));

    %label.top(btex $\pmb{v}_1$ etex scaled qs,(x1,y1+gap));
    %label.top(btex $\pmb{v}_2$ etex scaled qs,(x2,y2+gap));

    %label.bot(btex $v1$ etex scaled qs,(x5,y5-gap));
    %label.bot(btex $v2$ etex scaled qs,(x6,y6-gap));
    %label.top(btex $v3$ etex scaled qs,(x3,y3+gap));
    %label.top(btex $v4$ etex scaled qs,(x4,y4+gap));

    label.lrt(btex $\pmb{v}_3$ etex scaled qs,(x3+gap,y3-gap));
    label.llft(btex $\pmb{v}_4$ etex scaled qs,(x4-gap,y4-gap));
    label.urt(btex $\pmb{v}_1$ etex scaled qs,(x5+gap,y5+gap));
    label.ulft(btex $\pmb{v}_2$ etex scaled qs,(x6-gap,y6+gap));

    label.lrt(btex $\pmb{v}_3$ etex scaled qs,(x7+gap,y7-gap));
    label.llft(btex $\pmb{v}_4$ etex scaled qs,(x8-gap,y8-gap));
    label.urt(btex $\pmb{v}_1$ etex scaled qs,(x9+gap,y9+gap));
    label.ulft(btex $\pmb{v}_2$ etex scaled qs,(x10-gap,y10+gap));

    %label.ulft(btex $v3$ etex scaled qs,(x7-gap,y7+gap));
    %label.urt(btex $v4$ etex scaled qs,(x8+gap,y8+gap));
    %label.llft(btex $v1$ etex scaled qs,(x9-gap,y9-gap));
    %label.lrt(btex $v2$ etex scaled qs,(x10+gap,y10-gap));

    label.lrt(btex $\pmb{v}_3$ etex scaled qs,(x20+gap,y20-gap));
    label.llft(btex $\pmb{v}_4$ etex scaled qs,(x21-gap,y21-gap));
    label.urt(btex $\pmb{v}_1$ etex scaled qs,(x22+gap,y22+gap));
    label.ulft(btex $\pmb{v}_2$ etex scaled qs,(x23-gap,y23+gap));

endfig;

end;
