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
%filenametemplate "%jPNo%c.eps"; %设置文件名
filenametemplate "LinY_1.eps"; %设置文件名
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

vardef arcsind(expr x)=angle((1+-+x,x)) enddef;
vardef tand(expr x)=(sind(x)/cosd(x)) enddef;

vardef drawCircle(expr loc, c)=  %画圆。圆圈、线条的粗细一般不同，需要特殊设置
    pen prepen;
    prepen:=currentpen;

    pickup prepen scaled 1.05;  %缩放画笔
    fill fullcircle scaled r shifted loc withcolor c;
    draw fullcircle scaled r shifted loc withcolor black;

    pickup prepen;
enddef;

vardef generate(expr lev, tot)=
begingroup
    save i, num, idx, pa, pb, pd, tmp;

    num:=3**lev;
    idx:=num*2;
    pair pa, pb, pd;

    if lev < tot:
        for i:=1 upto num:
            pa:=edge[2*i-1];
            pb:=edge[2*i];
            tmp:=angle(pb-pa);
            pd:=pa+whatever*dir(tmp+tilt[lev])=pb+whatever*dir(180+tmp-tilt[lev]);
            idx:=idx+1; edge[idx]:=pa;
            idx:=idx+1; edge[idx]:=pd;
            idx:=idx+1; edge[idx]:=pd;
            idx:=idx+1; edge[idx]:=pb;
        endfor;
        generate(lev+1, tot);
    else:
        for i:=1 upto num:
            pa:=edge[2*i-1];
            pb:=edge[2*i];
            draw pa--pb;
        endfor;
    fi;

    idx:=(3**(lev-1))*2+2;
    for i:=0 upto ((num*2-idx)/4):
        drawCircle(edge[i*4+idx], col[lev]);
    endfor;
endgroup
enddef;

beginfig(2)  % beginfig() 里面可以是变量（代表整数），只要在之前定义过这个变量即可

%    drawAxis(20,20);

    pickup pencircle scaled 1.05; %缩放画笔，对之后的语句都有效

    numeric tilt[];
    tilt[1]:=60;
    tilt[2]:=30;
    tilt[3]:=10;

    color col[];
    col[1]:=(1,1,0);%red;
    col[2]:=green;%green; %blue;
    col[3]:=red;%white; %white*0.5; %blue+red;

    color yellow;
    yellow:=(1,1,0);

    r:=3u;
    l:=12u;
    pair p[];
    p[1]:=(76u,55u);
    p[2]:=p[1]+(l,0);
    p[3]:=p1+whatever*dir(60)=p2+whatever*dir(120);

    pair edge[];
    edge[1]:=p2; edge[2]:=p1;
    edge[3]:=p1; edge[4]:=p3;
    edge[5]:=p3; edge[6]:=p2;

    generate(1,3);
    drawCircle(p[1], yellow);
    drawCircle(p[2], yellow);
    %label(btex $g=2$ etex scaled 1.5, (82u, 40u));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    tilt[1]:=30;
    tilt[2]:=30;
    tilt[3]:=10;

    p[1]:=(30u,45u);
    p[2]:=p[1]+(l,0);
    p[3]:=p1+whatever*dir(60)=p2+whatever*dir(120);

    edge[1]:=p2; edge[2]:=p1;
    edge[3]:=p1; edge[4]:=p3;
    edge[5]:=p3; edge[6]:=p2;

    generate(1,1);
    drawCircle(p[1], yellow);
    drawCircle(p[2], yellow);
    %label(btex $g=0$ etex scaled 1.5, (36u, 40u));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    tilt[1]:=30;
    tilt[2]:=30;
    tilt[3]:=10;

    p[1]:=(50u,48u);
    p[2]:=p[1]+(l,0);
    p[3]:=p1+whatever*dir(60)=p2+whatever*dir(120);

    edge[1]:=p2; edge[2]:=p1;
    edge[3]:=p1; edge[4]:=p3;
    edge[5]:=p3; edge[6]:=p2;

    generate(1,2);
    drawCircle(p[1], yellow);
    drawCircle(p[2], yellow);
    %label(btex $g=1$ etex scaled 1.5, (56u, 40u));


endfig;

end;
