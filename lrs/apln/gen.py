
code0 = '''verbatimtex
%&LaTeX
\documentclass{article}
\usepackage{amsmath}
\usepackage{amssymb}
\\begin{document}
etex

prologues := 3;

%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%
%
input s;

beginfig(1)
    pickup pencircle scaled default_scale;

	pair coor;

    coor := (0,0);
'''

code2 = '''
endfig;

end;
'''

code_dy = '\tcoor := coor + dy;\n'
code_dyy = '\tcoor := coor + dyy;\n'
code_drawG  = '\tdrawG  (coor + %ddx, %s);\n'
code_eq = '\tlabel.lft(btex $%s:$ etex scaled eq_scale, coor + dxx);\n'

def gets(f):
    ret = f.readline()
    if ret.endswith('\n'):
        return ret[:-1]
    else:
        return ret

def rotate(cs):
    tmp = cs.split(',')
    tmp[7],tmp[8] = tmp[8],tmp[7]
    tmp[3],tmp[4],tmp[5],tmp[6],tmp[7],tmp[8],tmp[0],tmp[1],tmp[2] = tmp[:]
    tmp[7],tmp[8] = tmp[8],tmp[7]
    return ','.join(tmp)

def flip(cs):
    tmp = cs.split(',')
    tmp[0],tmp[2],tmp[1],tmp[6],tmp[7],tmp[8],tmp[3],tmp[4],tmp[5] = tmp[:]
    return ','.join(tmp)

def draw(cs):
    global cnt, code, code_dy, code_dyy, code_drawG, code_eq
    cnt = cnt + 1
    if cnt == 7:
        cnt = 1
        code = code + code_dyy
    code = code + (code_drawG % (cnt - 1, cs))

#files = ['A','B','C','D','r0']
files = ['r0','r1','r2','r3']

for file_name in files:
    code = ''
    fp = file(file_name + ".txt")
    fm = file(file_name + '.mp','w')
    while True:
        eq = gets(fp)
        if len(eq) == 0: break
        code = code + (code_eq % eq)
        n = int(gets(fp))
        cnt = 0
        for k in xrange(n):
            cols = ','.join(gets(fp).split())
            [rot,fli] = gets(fp).split();
            for xx in xrange(3):
                draw(cols)
                if fli.startswith('f'): draw(flip(cols))
                if not rot.startswith('r'): break
                cols = rotate(cols)

        code = code + '\n' + code_dy
        gets(fp)
    code = code0 + code + code2
    fm.write(code)
    print code
