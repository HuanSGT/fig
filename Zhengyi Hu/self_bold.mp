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

vardef draw_one(expr col) =
    draw (xl1,yl1) -- (xl1,yr2) withcolor col; 
    draw (xl1,yl1) .. (xl1-l/2,(yl1+yr2)/2) .. (xl1,yr2) withcolor col;
    drawCircle((xl1,yl1),white,col,r);
    drawCircle((xl1,yr2),white,col,r);
    draw thelabel(btex $\pmb{\mathcal{H}}_{g-1}^{\scriptscriptstyle (1)}$ etex scaled qss,(xl1-l/4,(yl1+yr2)/2)) withcolor col;
    draw thelabel(btex $\pmb{v}_1^{\scriptscriptstyle (1)}$ etex scaled qs,(xl1,yl1)) withcolor col;
    draw thelabel(btex $\pmb{v}_2^{\scriptscriptstyle (1)}$ etex scaled qs,(xl1,yr2)) withcolor col;
    
    draw (x0,y0) -- (x0,y1) withcolor col;
    draw (x0,y0) .. (x0-l/2,(y0+y1)/2) .. (x0,y1) withcolor col;
    fill (x0-r_,y0-r_) .. (x0-r_,y0+r_) .. (x0+r_,y0+r_) .. cycle withcolor white;
    fill (x0-r_,y1+r_) .. (x0-r_,y1-r_) .. (x0+r_,y1-r_) .. cycle withcolor white;
    draw (x0-r_,y0-r_) .. (x0-r_,y0+r_) .. (x0+r_,y0+r_) withcolor col;
    draw (x0-r_,y1+r_) .. (x0-r_,y1-r_) .. (x0+r_,y1-r_) withcolor col;
    draw thelabel(btex $\pmb{\mathcal{H}}_{g-1}^{\scriptscriptstyle (1)}$ etex scaled qss,(x0-l/4,(y0+y1)/2)) withcolor col;
enddef;

vardef draw_four(expr col) = 
    draw (xr1,yr1) -- (xl2,yr1) withcolor col;
    draw (xr1,yr1) .. ((xr1+xl2)/2,yr1-l/2) .. (xl2,yr1) withcolor col;
    drawCircle((xr1,yr1),white,col,r);
    drawCircle((xl2,yr1),white,col,r);
    draw thelabel(btex $\pmb{\mathcal{H}}_{g-1}^{\scriptscriptstyle (4)}$ etex scaled qss,((xr1+xl2)/2,yr1-l/4)) withcolor col;
    draw thelabel(btex $\pmb{v}_1^{\scriptscriptstyle (4)}$ etex scaled qs,(xr1,yr1)) withcolor col;
    draw thelabel(btex $\pmb{v}_2^{\scriptscriptstyle (4)}$ etex scaled qs,(xl2,yr1)) withcolor col;

    draw (x0,y0) -- (x1,y0) withcolor col;
    draw (x0,y0) .. ((x0+x1)/2,y0-l/2) .. (x1,y0) withcolor col;
    fill (x0-r_,y0-r_) .. (x0+r_,y0-r_) .. (x0+r_,y0+r_) .. cycle withcolor white;
    fill (x1-r_,y0+r_) .. (x1-r_,y0-r_) .. (x1+r_,y0-r_) .. cycle withcolor white;
    draw (x0-r_,y0-r_) .. (x0+r_,y0-r_) .. (x0+r_,y0+r_) withcolor col;
    draw (x1-r_,y0+r_) .. (x1-r_,y0-r_) .. (x1+r_,y0-r_) withcolor col;
    draw thelabel(btex $\pmb{\mathcal{H}}_{g-1}^{\scriptscriptstyle (4)}$ etex scaled qss,((x0+x1)/2,y0-l/4)) withcolor col;
enddef;

vardef draw_two(expr col) =
    draw (xr1,yl2) -- (xl2,yl2) withcolor col;
    draw (xr1,yl2) .. ((xr1+xl2)/2,yl2+l/2) .. (xl2,yl2) withcolor col;
    drawCircle((xr1,yl2),white,col,r);
    drawCircle((xl2,yl2),white,col,r);
    draw thelabel(btex $\pmb{\mathcal{H}}_{g-1}^{\scriptscriptstyle (2)}$ etex scaled qss,((xr1+xl2)/2,yl2+l/4)) withcolor col;
    draw thelabel(btex $\pmb{v}_1^{\scriptscriptstyle \scriptscriptstyle (2)}$ etex scaled qs,(xr1,yl2)) withcolor col;
    draw thelabel(btex $\pmb{v}_2^{\scriptscriptstyle \scriptscriptstyle (2)}$ etex scaled qs,(xl2,yl2)) withcolor col;

    draw (x1,y1) -- (x0,y1) withcolor col;
    draw (x1,y1) .. ((x0+x1)/2,y1+l/2) .. (x0,y1) withcolor col;
    fill (x1+r_,y1+r_) .. (x1-r_,y1+r_) .. (x1-r_,y1-r_) .. cycle withcolor white;
    fill (x0-r_,y1+r_) .. (x0+r_,y1+r_) .. (x0+r_,y1-r_) .. cycle withcolor white;
    draw (x1+r_,y1+r_) .. (x1-r_,y1+r_) .. (x1-r_,y1-r_) withcolor col;
    draw (x0-r_,y1+r_) .. (x0+r_,y1+r_) .. (x0+r_,y1-r_) withcolor col;
    draw thelabel(btex $\pmb{\mathcal{H}}_{g-1}^{\scriptscriptstyle (2)}$ etex scaled qss,((x0+x1)/2,y1+l/4)) withcolor col;
enddef;

vardef draw_three(expr col) =
    draw (xr2,yl1) -- (xr2,yr2) withcolor col;
    draw (xr2,yl1) .. (xr2+l/2,(yl1+yr2)/2) .. (xr2,yr2) withcolor col;
    drawCircle((xr2,yl1),white,col,r);
    drawCircle((xr2,yr2),white,col,r);
    draw thelabel(btex $\pmb{\mathcal{H}}_{g-1}^{\scriptscriptstyle (3)}$ etex scaled qss,(xr2+l/4,(yl1+yr2)/2)) withcolor col;
    draw thelabel(btex $\pmb{v}_2^{\scriptscriptstyle (3)}$ etex scaled qs,(xr2,yl1)) withcolor col;
    draw thelabel(btex $\pmb{v}_1^{\scriptscriptstyle (3)}$ etex scaled qs,(xr2,yr2)) withcolor col;

    draw (x1,y0) -- (x1,y1) withcolor col;
    draw (x1,y0) .. (x1+l/2,(y0+y1)/2) .. (x1,y1) withcolor col;
    fill (x1-r_,y0+r_) .. (x1+r_,y0+r_) .. (x1+r_,y0-r_) .. cycle withcolor white;
    fill (x1-r_,y1-r_) .. (x1+r_,y1-r_) .. (x1+r_,y1+r_) .. cycle withcolor white;
    draw (x1-r_,y0+r_) .. (x1+r_,y0+r_) .. (x1+r_,y0-r_) withcolor col;
    draw (x1-r_,y1-r_) .. (x1+r_,y1-r_) .. (x1+r_,y1+r_) withcolor col;
    draw thelabel(btex $\pmb{\mathcal{H}}_{g-1}^{\scriptscriptstyle (3)}$ etex scaled qss,(x1+l/4,(y0+y1)/2)) withcolor col;
enddef;

def tand(expr x) = sind(x)/cosd(x); enddef;

beginfig(1)

    pickup pencircle scaled 1.5; %缩放画笔

%    drawAxis(16,16);

    l=30u;
    r=11u;%9u;
    r_ := (r/2)/1.414213562;

    x0 = 500u;
    y0 = 500u;
    x1 = x0 + l;
    y1 = y0 + l;

    gap = 1u;
    root = r/1.414213562 + gap;

    a1 = x0 - 56u; %1.6;
    b1 = y1 + root;
    a0 = a1 - l - root*2;
    b0 = b1 - l - root*2;

    xl1 = a0;
    yl1 = b0 + root;
    xr1 = xl1 + root;
    yr1 = yl1 - root;

    xl2 = xr1 + l;
    yl2 = yl1 + l + root;
    xr2 = xl2 + root;
    yr2 = yl2 - root;

    a2=20;
    a3=25;
    a4=40;

    y2=50u;
    y3=37u;
    y4=20u;

    x2=10u;

    rhs=50u;

    arx=4;
    ary=7;
    arbias=0.37u*1.5;

    qxbias=3u;
    qs := 1.6;% 1.4;
    qs_ := 1.8; %1.6;
    qss := 1.6; %1.6;

    r1 := 1; g1 := 0; b1 := 0;
    r2 := 0; g2 := 0.8; b2 := 0;
    r3 := 0; g3 := 0; b3 := 1;
    r4 := 0.25; g4 := 0.25; b4 := 0.25;

    kk := 2;
    rv1 := (r1 + r4) / kk; gv1 := (g1 + g4) / kk; bv1 := (b1 + b4) / kk;
    rv2 := (r3 + r4) / kk; gv2 := (g3 + g4) / kk; bv2 := (b3 + b4) / kk;
    rv3 := (r1 + r2) / kk; gv3 := (g1 + g2) / kk; bv3 := (b1 + b2) / kk;
    rv4 := (r2 + r3) / kk; gv4 := (g2 + g3) / kk; bv4 := (b2 + b3) / kk;
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% lhs
    draw_one((r1,g1,b1));
    draw_four((r4,g4,b4));
    draw_two((r2,g2,b2));
    draw_three((r3,g3,b3));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% rhs

    label(btex $\pmb{v}_1$ etex scaled qs_,(x0,y0)) withcolor (rv1,gv1,bv1);
    label(btex $\pmb{v}_2$ etex scaled qs_,(x1,y0)) withcolor (rv2,gv2,bv2);
    label(btex $\pmb{v}_3$ etex scaled qs_,(x0,y1)) withcolor (rv3,gv3,bv3);
    label(btex $\pmb{v}_4$ etex scaled qs_,(x1,y1)) withcolor (rv4,gv4,bv4);
    label.bot(btex $\pmb{\mathcal{H}}_g$ etex scaled qs_,((x0+x1)/2.0,(y0-l/2.0))) withcolor (0.4,0.4,0.4);

%    draw thelabel(btex $\Rightarrow$ etex xscaled arx yscaled ary, (x0-l*0.8,(y0+y1)/2-arbias)) withcolor (0.5,0.5,0.5);
    draw thelabel(btex $\Rightarrow$ etex xscaled arx yscaled ary, ((x0+a1)/2.0,(y0+y1)/2-arbias)) withcolor (0.5,0.5,0.5);
    %drawCircle((x0,y0), (1,1,1));
    %drawCircle((x1,y1), (1,1,1));
    %drawCircle((x0,y1), (1,1,1));
    %drawCircle((x1,y0), (1,1,1));

    %fill fullcircle scaled r shifted (x0,y0) withcolor white;
    %fill fullcircle scaled r shifted (x0,y1) withcolor white;
    %fill fullcircle scaled r shifted (x1,y0) withcolor white;
    %fill fullcircle scaled r shifted (x1,y1) withcolor white;
    %drawCircle((x0,y0), (1,1,1));
    %drawCircle((x1,y1), (1,1,1));

    %drawCircle((x0,y1), (1,1,1));
    %drawCircle((x1,y0), (1,1,1));

    %drawCircle((x0,y0), (1,1,1));
    %drawCircle((x1,y1), (1,1,1));

    %drawCircle((x0,y1), (1,1,1));
    %drawCircle((x1,y0), (1,1,1));

    %tmp:=l*tand(a3);
    %draw (rhs-l, y3)--(rhs, y3+tmp)--(rhs+l, y3)--(rhs, y3-tmp)--(rhs-l,y3)--(rhs+l,y3);

    %drawCircle((rhs,y3+tmp),green);
    %drawCircle((rhs,y3),green);
    %drawCircle((rhs,y3-tmp),green);

    %drawCircle((rhs-l,y3), (1,1,0));
    %drawCircle((rhs+l,y3), red);

    %label.top(btex $q=3$ etex scaled qs, ((10u+rhs)/2-qxbias,y3));
    %label(btex $\Rightarrow$ etex xscaled arx yscaled ary, ((20u+rhs)/2,y3-arbias));


endfig;

end;

