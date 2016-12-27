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

vardef drawCircle(expr loc, interCol)=
    pen prepen;
    prepen:=currentpen;

    pickup pencircle scaled 1.1; %缩放画笔
    fill fullcircle scaled r shifted loc withcolor interCol;
    draw fullcircle scaled r shifted loc withcolor black;
    pickup prepen;
enddef;

vardef drawEdge(expr xl,yl,xr,yr)=
    pen open;
    open:=currentpen;

    k := 0.43;
    xm := xl*k+(1-k)*xr;
    ym := yl*k+(1-k)*yr;

    pickup pencircle scaled 0.2; %缩放画笔
    draw (xl,yl) -- (xr,yr);
    draw (xm,ym) -- (xr,yr);
    drawarrow (xl,yl) -- (xm,ym);
    drawCircle((xl,yl),black);
    drawCircle((xr,yr),black);

    pickup open;
enddef;

def tand(expr x) = sind(x)/cosd(x); enddef;

beginfig(1)

    pickup pencircle scaled 1; %缩放画笔

%    drawAxis(16,16);

    l:=20u;
    r:=1.5u;

    rhs:=50u;

    x1 := 0u; y1 := 0u;
    x2 := x1 + l; y2 := y1;

    x3 := x5 := x2 + l;
    x4 := x6 := x5 + l;
    y5 := y6 := y2;
    y3 := y4 := y5 + l;

    x14 := x13 := x1;
    x15 := x9 := x7 := x11 := x14 + l;
    x16 := x10 := x8 := x12 := x15 + l;
    x18 := x17 := x16 + l;

    y11 := y12 := y1 - l;
    y13 := y7 := y8  := y17 := y11-l;
    y14 := y9 := y10 := y18 := y13-l;
    y15 := y16 := y9 - l;

    width  := l*5/12;
    height := l/6;
    
    x44 := x45 := x6 + l;
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

    y28 := y29 := y3 - l + height;
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
    gap:=0.8u;

    qxbias:=3u;
    qs:=1.2;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% lhs
    
    drawEdge(x1,y1,x2,y2);

    drawEdge(x5,y5,x6,y6);
    drawEdge(x5,y5,x3,y3);
    drawEdge(x3,y3,x4,y4);
    drawEdge(x4,y4,x6,y6);

    drawEdge(x9,y9,x10,y10);
    drawEdge(x9,y9,x7,y7);
    drawEdge(x7,y7,x8,y8);
    drawEdge(x8,y8,x10,y10);

    drawEdge(x7,y7,x11,y11);
    drawEdge(x11,y11,x12,y12);
    drawEdge(x12,y12,x8,y8);
    drawEdge(x9,y9,x14,y14);
    drawEdge(x14,y14,x13,y13);
    drawEdge(x13,y13,x7,y7);
    drawEdge(x9,y9,x15,y15);
    drawEdge(x15,y15,x16,y16);
    drawEdge(x16,y16,x10,y10);
    drawEdge(x8,y8,x17,y17);
    drawEdge(x17,y17,x18,y18);
    drawEdge(x18,y18,x10,y10);

    drawEdge(x22,y22,x23,y23);
    drawEdge(x22,y22,x20,y20);
    drawEdge(x20,y20,x21,y21);
    drawEdge(x21,y21,x23,y23);
    drawEdge(x22,y22,x40,y40);
    drawEdge(x40,y40,x41,y41);
    drawEdge(x41,y41,x20,y20);
    drawEdge(x20,y20,x24,y24);
    drawEdge(x24,y24,x25,y25);
    drawEdge(x25,y25,x21,y21);
    drawEdge(x21,y21,x60,y60);
    drawEdge(x60,y60,x61,y61);
    drawEdge(x61,y61,x23,y23);
    drawEdge(x22,y22,x58,y58);
    drawEdge(x58,y58,x59,y59);
    drawEdge(x59,y59,x23,y23);
    drawEdge(x22,y22,x52,y52);
    drawEdge(x52,y52,x53,y53);
    drawEdge(x53,y53,x50,y50);
    drawEdge(x50,y50,x54,y54);
    drawEdge(x54,y54,x55,y55);
    drawEdge(x55,y55,x51,y51);
    drawEdge(x51,y51,x56,y56);
    drawEdge(x56,y56,x57,y57);
    drawEdge(x57,y57,x23,y23);
    drawEdge(x22,y22,x42,y42);
    drawEdge(x42,y42,x43,y43);
    drawEdge(x43,y43,x40,y40);
    drawEdge(x40,y40,x44,y44);
    drawEdge(x44,y44,x45,y45);
    drawEdge(x45,y45,x41,y41);
    drawEdge(x22,y22,x46,y46);
    drawEdge(x46,y46,x47,y47);
    drawEdge(x47,y47,x20,y20);
    drawEdge(x41,y41,x48,y48);
    drawEdge(x48,y48,x49,y49);
    drawEdge(x49,y49,x20,y20);
    drawEdge(x21,y21,x62,y62);
    drawEdge(x62,y62,x63,y63);
    drawEdge(x63,y63,x60,y60);
    drawEdge(x60,y60,x64,y64);
    drawEdge(x64,y64,x65,y65);
    drawEdge(x65,y65,x61,y61);
    drawEdge(x61,y61,x66,y66);
    drawEdge(x66,y66,x67,y67);
    drawEdge(x67,y67,x23,y23);
    drawEdge(x21,y21,x68,y68);
    drawEdge(x68,y68,x69,y69);
    drawEdge(x69,y69,x23,y23);
    drawEdge(x20,y20,x32,y32);
    drawEdge(x32,y32,x33,y33);
    drawEdge(x33,y33,x21,y21);
    drawEdge(x20,y20,x26,y26);
    drawEdge(x26,y26,x27,y27);
    drawEdge(x27,y27,x24,y24);
    drawEdge(x24,y24,x28,y28);
    drawEdge(x28,y28,x29,y29);
    drawEdge(x29,y29,x25,y25);
    drawEdge(x25,y25,x31,y31);
    drawEdge(x31,y31,x30,y30);
    drawEdge(x30,y30,x21,y21);
    drawEdge(x22,y22,x50,y50);
    drawEdge(x50,y50,x51,y51);
    drawEdge(x51,y51,x23,y23);

    label(btex $t=0$ etex scaled qs,((x1+x2)/2,y1+l/2));
    label(btex $t=1$ etex scaled qs,((x3+x6)/2,(y3+y6)/2));
    label(btex $t=2$ etex scaled qs,((x7+x10)/2,(y7+y10)/2));
    label(btex $t=3$ etex scaled qs,((x21+x22)/2,(y21+y22)/2));

endfig;

end;
