beginfig(1)
    pickup pencircle scaled dfts;

    pair coor[], dx, dy;
    dx := (width, 0);
    dy := (0, -height);

    coor[0] := (0,0);

    drawG(coor[0],0,0,0,0,0,0,0,0,0);
    %drawG(coor[0] + dx,0,0,0,0,1,0,0,0,0);
    drawGG(coor[0] + 1.3dx,0,0,0,0,0,0,0,0,0);
    draw thelabel(btex $\Rightarrow$ etex xscaled 4.5 yscaled 7.5, coor[0] + (0.95width, 0.23height)) withcolor (0.6,0.6,0.6);

endfig;

end;
