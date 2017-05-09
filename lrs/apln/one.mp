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

dic := di;
dib := dic * 0.75;
dia := dib * 0.75;

color cols[];

vardef drawAb(expr lba, lbb, lbc, colb) =
    pair lbd;
    lbd = (lba + lbb + lbc) / 3.0;
    draw lba .. lbd withcolor colc;
    draw lbb .. lbd withcolor colc;
    draw lbc .. lbd withcolor colc;
    drawCircle(lbd, colb, black, dib);
    %drawAb(lcd, lca, lcb, dep - 1);
    %drawAb(lcd, lca, lcc, dep - 1);
    %drawAb(lcd, lcb, lcc, dep - 1);
enddef;

vardef drawAc(expr lca, lcb, lcc, colc) =
    pair lcd;
    lcd = (lca + lcb + lcc) / 3.0;
    draw lca .. lcd withcolor colc;
    draw lcb .. lcd withcolor colc;
    draw lcc .. lcd withcolor colc;
    drawCircle(lcd, colc, black, dic);
    drawAb(lcd, lca, lcb, );
    drawAb(lcd, lca, lcc, dep - 1);
    drawAb(lcd, lcb, lcc, dep - 1);
enddef;

beginfig(1)
    pickup pencircle scaled default_scale;
    cols3 := red; cols2 := green; cols1 := blue;
    drawAc((0,0),(-0.5widthT*2,-heightT*2*3),(0.5widthT*2,-heightT*2*3), red, green, blue);

endfig;

end;
