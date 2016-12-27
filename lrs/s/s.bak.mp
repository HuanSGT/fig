beginfig(1)
    pickup pencircle scaled dfts;
    pair coor[], dx, dy;
    dx := (1.0widthG, 0);
    dy := (0, -heightGG);

    coor0 := (0,0);
    coor1 := coor0 + (lenx + dix + gapx, leny + diy + gapy);
    coor2 := coor1 + (lenx + dix + gapx, - (leny + diy + gapy));

    coor3 := coor0 + 1.4dx;
    coor4 := coor3 + (lenx , leny);
    coor5 := coor4 + (lenx , - (leny));

    drawTT(coor0, black, 0,0,0, 0, 2,0,2, btex $\mathcal{S}_n^{(1)}$ etex scaled qstt);
    drawTT(coor1, black, 0,0,0, 1, 6,3,5, btex $\mathcal{S}_n^{(2)}$ etex scaled qstt);
    drawTT(coor2, black, 0,0,0, 2, 2,1,2, btex $\mathcal{S}_n^{(3)}$ etex scaled qstt);

    drawTT(coor3, black, 0,0,0, 3, 8,8,2, btex $$ etex scaled qstt);
    drawTT(coor4, black, 0,0,0, 3, 0,8,8, btex $$ etex scaled qstt);
    drawTT(coor5, black, 0,0,0, 3, 8,1,8, btex $$ etex scaled qstt);

    label(btex $\mathcal{S}_{n+1}$ etex scaled 1.3, coor3 + (len,0.62leny));

    draw thelabel(btex $\Rightarrow$ etex xscaled 4.5 yscaled 7.5, coor[0] + (1.08widthG, 0.29heightG)) withcolor (0.6,0.6,0.6);
    %coor[0] := (0,0);

    %drawG(coor[0],0,0,0,0,0,0,0,0,0, btex $$ etex);
    %drawG(coor[0] + dx,0,0,0,0,1,0,0,0,0);
    %drawGG(coor[0] + 1.3dx,0,0,0,0,0,0,0,0,0);
endfig;

end;

beginfig(1)
    pickup pencircle scaled dfts;
    pair coor[];
    coor[0] = (0,0);
    coor[1] = coor[0] + (-lenx, -heightGG);
    coor[2] = coor[1] + (widthGG + 3di, 0);
    coor[3] = coor[2] + (len, 2leny);
    coor[4] = coor[2] + (2len, 0);

    drawT(coor[0], black, 0,0,0);
    drawGG(coor[1], 0,0,0,0,0,0,0,0,0);
    drawGG(coor[2], 0,0,0,0,0,0,0,0,0);
    drawGG(coor[3], 0,0,0,0,0,0,0,0,0);
    drawGG(coor[4], 0,0,0,0,0,0,0,0,0);

    label.bot(btex $\mathcal{S}_1$ etex scaled qs0, coor[0] + (lenx, -0.1di));
    label.bot(btex $\mathcal{S}_2$ etex scaled qs0, coor[1] + (len, -0.6di));
    label.bot(btex $\mathcal{S}_3$ etex scaled qs0, coor[2] + (2len, -0.6di));
endfig;

end;

beginfig(1)
    pickup pencircle scaled dfts;
    pair coor[], dn;
    dn := (-3di, 0.5leny);
    coor[0] := (0,0);
    drawT(coor[0], black, 0,0,0);
    label(btex $(a)$ etex scaled qs2, coor[0] + dn);

    coor[1] := coor[0] + (width + 6di, 0);
    coor[2] := coor[1] + (width, 0);
    coor[3] := coor[2] + (width, 0);
    drawT(coor[1], black, 1,0,0);
    drawT(coor[2], black, 0,1,0);
    drawT(coor[3], black, 0,0,1);
    label(btex $(b)$ etex scaled qs2, coor[1] + dn);

    coor[4] := coor[0] + (0, - (leny + 5di));
    drawT(coor[4], black, 1,1,1);
    label(btex $(d)$ etex scaled qs2, coor[4] + dn);

    coor[5] := coor[4] + (width + 6di, 0);
    coor[6] := coor[5] + (width, 0);
    coor[7] := coor[6] + (width, 0);
    drawT(coor[5], black, 0,1,1);
    drawT(coor[6], black, 1,0,1);
    drawT(coor[7], black, 1,1,0);
    label(btex $(c)$ etex scaled qs2, coor[5] + dn);

    %drawGG((-widthGG,0), 0,0,0,0,0,0,0,0,0);
    %drawG((0,0), 0,1,2,1,2,0,2,0,1, btex $\gamma_n^0 + \varphi_n^2 + \gamma_n^0 -1$ etex scaled qs0);
    %drawG((widthG,0), 0,1,2,1,2,0,2,0,1, btex $\gamma_n^0 + \varphi_n^2 + \gamma_n^0 -1$ etex scaled qs0);
    %drawG((0,-heightG), 0,1,2,1,2,0,2,0,1, btex $\gamma_n^0$ etex scaled qs0);
    %drawT((0,0), black, 0,1,2, btex $$ etex scaled qs0);
endfig;

end;
