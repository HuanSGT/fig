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

def tand(expr x) = sind(x)/cosd(x); enddef;

beginfig(1)

    pickup pencircle scaled 1.5; %缩放画笔

%    drawAxis(16,16);

    l=15u;
    r=2u;

    a2=20;
    a3=25;
    a4=40;

    y2=50u;
    y3=37u;

    x2=55u;
    x1 := x2 - 3 * l;

    rhs=50u;

    arx=4;
    ary=3;
    arbias=0.37u*1.5;

    qxbias=3u;
    qs=1.6;

    gap := r/2 * 1;
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% q=3
    draw (x1,y3)--(x1+l,y3);
    drawCircle((x1,y3), black,black, r);
    drawCircle((x1+l,y3), black,black, r);

    dif := l/6;
    y4 := y3 - l/2 - dif;
    y5 := y3 + l/2 + dif;
    draw (x2+l/2,y4)--(x2,y3);
    draw (x2+l/2,y4)--(x2+l,y3);

    draw (x2+l/2,y5)--(x2,y3);
    draw (x2+l/2,y5)--(x2+l,y3);

    %draw (x2+l/2,y3-l/2)--(x2+l,y3-l/2);
    %draw (x2,y3+l/2)--(x2+l,y3+l/2);

    drawCircle((x2+l/2,y4), black, black, r);
    drawCircle((x2+l/2,y5), black, black, r);

    drawCircle((x2,y3), black, black,r);
    drawCircle((x2+l,y3), black, black,r);

    %tmp:=l*tand(a3);
    %draw (rhs-l, y3)--(rhs, y3+tmp)--(rhs+l, y3)--(rhs, y3-tmp)--(rhs-l,y3)--(rhs+l,y3);

    %drawCircle((rhs,y3+tmp),green);
    %drawCircle((rhs,y3),green);
    %drawCircle((rhs,y3-tmp),green);

    %drawCircle((rhs-l,y3), (1,1,0));
    %drawCircle((rhs+l,y3), red);

    %label.top(btex $q=3$ etex scaled qs, ((10u+rhs)/2-qxbias,y3));
    %label(btex $\Rightarrow$ etex xscaled arx yscaled ary, ((20u+rhs)/2,y3-arbias));

    %label.llft(btex $v_i$ etex scaled qs, (10u - gap,y3 - gap));
    %label.lrt(btex $v_j$ etex scaled qs, (10u+l + gap,y3 - gap));
    %label.llft(btex $v_i$ etex scaled qs, (x2 - gap,y3 - l/2 - gap));
    %label.lrt(btex $v_j$ etex scaled qs, (x2 + l + gap,y3 - l/2 - gap));

    label.bot(btex $\pmb{v}_i$ etex scaled qs,(x1,y3-gap));
    label.bot(btex $\pmb{v}_j$ etex scaled qs,(x1+l,y3-gap));

    label.llft(btex $\pmb{v}_i$ etex scaled qs,(x2,y3));
    label.lrt(btex $\pmb{v}_j$ etex scaled qs,(x2+l+gap,y3));

    draw thelabel(btex $\Rightarrow$ etex xscaled arx yscaled ary, (x2-l,y3-arbias)) withcolor (0.5,0.5,0.5);

endfig;

end;
