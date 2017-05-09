verbatimtex
%&LaTeX
\documentclass{article}
\usepackage{amsmath}
\usepackage{amssymb}
\begin{document}
etex

prologues := 3;

%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%
input s;

color cols[];
numeric qss[];
numeric qs;

vardef cent(expr la, lb, lc) =
    0.55[la,0.5[lb,lc]]
enddef;

vardef drawAaa(expr laa, lab, lac) =
    pair lad;
    lad = 0.9[laa,0.5[lab,lac]];
    draw laa .. lad withcolor cols1 withpen pencircle scaled qs1;
    draw lab .. lad withcolor cols1 withpen pencircle scaled qs1;
    draw lac .. lad withcolor cols1 withpen pencircle scaled qs1;
    drawCircle(lad, cols1, black, dis1);
enddef;

vardef drawAab(expr laa, lab, lac) =
    pair lad;
    lad = 0.5[laa,0.5[lab,lac]];
    draw laa .. lad withcolor cols1 withpen pencircle scaled qs1;
    draw lab .. lad withcolor cols1 withpen pencircle scaled qs1;
    draw lac .. lad withcolor cols1 withpen pencircle scaled qs1;
    drawCircle(lad, cols1, black, dis1);
enddef;

vardef drawAac(expr laa, lab, lac) =
    pair lad;
    lad = (laa + lab + lac) / 3;
    draw laa .. lad withcolor cols1 withpen pencircle scaled qs1;
    draw lab .. lad withcolor cols1 withpen pencircle scaled qs1;
    draw lac .. lad withcolor cols1 withpen pencircle scaled qs1;
    drawCircle(lad, cols1, black, dis1);
enddef;

vardef drawAba(expr lba, lbb, lbc) =
    pair lbd;
    lbd = cent(lba,lbb,lbc);
    drawAaa(lbb,lba, lbd);
    drawAaa(lbc,lba, lbd);
    drawAab(lbd, lbb, lbc);
    draw lba .. lbd withcolor cols2 withpen pencircle scaled qs2;
    draw lbb .. lbd withcolor cols2 withpen pencircle scaled qs2;
    draw lbc .. lbd withcolor cols2 withpen pencircle scaled qs2;
    drawCircle(lbd, cols2, black, dis2);
enddef;

vardef drawAbb(expr lba, lbb, lbc) =
    pair lbd;
    lbd = (lba+lbb+lbc) / 3;
    drawAab(lbd,lbb,lba);
    drawAab(lbd,lbc,lba);
    drawAab(lbd, lbb, lbc);
    draw lba .. lbd withcolor cols2 withpen pencircle scaled qs2;
    draw lbb .. lbd withcolor cols2 withpen pencircle scaled qs2;
    draw lbc .. lbd withcolor cols2 withpen pencircle scaled qs2;
    drawCircle(lbd, cols2, black, dis2);
enddef;

vardef drawAc(expr lca, lcb, lcc) =
    pair lcd;
    lcd = (lca + lcb + lcc) / 3;
    drawAba(lcd, lca, lcc);
    drawAba(lcd, lca, lcb);
    drawAba(lcd, lcb, lcc);
    draw lca .. lcd withcolor cols3 withpen pencircle scaled qs3;
    draw lcb .. lcd withcolor cols3 withpen pencircle scaled qs3;
    draw lcc .. lcd withcolor cols3 withpen pencircle scaled qs3;
    drawCircle(lcd, cols3, black, dis3);
enddef;

beginfig(1)
    pickup pencircle scaled default_scale;
    ls := 5; pair gapy; gapy := (0, -10u);
    qs := 4;
    di := 8u;
    ratio := 0.9;
    ratis := 0.9;

    pair loca, locb ,locc;
    mul := 5;
    loca := (0,0); locb := (-0.5widthT*mul,-heightT*mul*3); locc := (0.5widthT*mul,-heightT*mul*3);

    cols3 := red; cols2 := green; cols1 := blue;
    dis3  := di*ratio;  dis2  := dis3 * ratio; dis1 := dis2 * ratio;
    qs3 := qs * ratis; qs2 := qs3 * ratis; qs1 := qs 2 * ratis;
    drawAc(loca,locb,locc);
    draw loca .. locb withcolor black withpen pencircle scaled qs;
    draw loca .. locc withcolor black withpen pencircle scaled qs;
    draw locb .. locc withcolor black withpen pencircle scaled qs;
    drawCircle(loca, white, black, di); drawCircle(locb, white, black, di); drawCircle(locc, white, black, di);
    label.bot(btex $n = 3$ etex scaled ls, loca - (0,heightT*mul*3) + gapy);

    pair loba, lobb ,lobc;
    mul := 2.5;
    lobb := locb + (-1.6widthT * mul, 0);
    lobc := lobb + (widthT * mul, 0);
    loba := lobb + (0.5widthT * mul, 3*heightT * mul);

    cols2 := red; cols1 := green;
    dis2  := di*ratio;  dis1  := dis3 * ratio;
    qs2 := qs * ratis; qs1 := qs3 * ratis;
    drawAbb(loba,lobb,lobc);
    draw loba .. lobb withcolor black withpen pencircle scaled qs;
    draw loba .. lobc withcolor black withpen pencircle scaled qs;
    draw lobb .. lobc withcolor black withpen pencircle scaled qs;
    drawCircle(loba, white, black, di); drawCircle(lobb, white, black, di); drawCircle(lobc, white, black, di);
    label.bot(btex $n = 2$ etex scaled ls, loba - (0,heightT*mul*3) + gapy);

    pair loaa, loab ,loac;
    mul := 2.5;
    loab := lobb + (0.85widthT * mul, 3*heightT * mul);
    loac := loab + (widthT * mul, 0);
    loaa := loab + (0.5widthT * mul, 3*heightT * mul);

    cols1 := red;
    dis1  := di*ratio;
    qs1 := qs * ratis;
    drawAac(loaa,loab,loac);
    draw loaa .. loab withcolor black withpen pencircle scaled qs;
    draw loaa .. loac withcolor black withpen pencircle scaled qs;
    draw loab .. loac withcolor black withpen pencircle scaled qs;
    drawCircle(loaa, white, black, di); drawCircle(loab, white, black, di); drawCircle(loac, white, black, di);
    label.bot(btex $n = 1$ etex scaled ls, loaa - (0,heightT*mul*3) + gapy);

    pair loa, lob ,loc;
    mul := 1.5;
    loa := loaa + (-2.5*widthT * mul, -1.5heightT * mul);
    lob := loa + (-0.5widthT * mul, -3heightT * mul);
    loc := loa + (0.5widthT * mul, -3heightT * mul);
    draw loa .. lob withcolor black withpen pencircle scaled qs;
    draw loa .. loc withcolor black withpen pencircle scaled qs;
    draw lob .. loc withcolor black withpen pencircle scaled qs;
    drawCircle(loa, white, black, di); drawCircle(lob, white, black, di); drawCircle(loc, white, black, di);
    label.bot(btex $n = 0$ etex scaled ls, loa - (0,heightT*3 * mul) + gapy);

endfig;

end;
