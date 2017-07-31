
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
code_eq2 = '\tlabel.bot(btex $%s$ etex scaled eq_scale, coor + dz + %ddx);\n'
code_eq3 = '\tlabel.rt(btex $\\times %d$ etex scaled eq_scale, coor + dzz + %ddx);\n'


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

def draw(cs, eq, tot):
    global cnt, code, code_dy, code_dyy, code_drawG, code_eq
    cnt = cnt + 1
    if cnt == 7:
        cnt = 1
        code = code + code_dy
    code = code + (code_drawG % (cnt - 1, cs))
    code = code + (code_eq2 % (eq, cnt - 1))
    code = code + (code_eq3 % (tot, cnt - 1))

files = ['A','B','C','D']
#files = ['r0','r1','r2','r3']

for file_name in files:
    code = ''
    fp = file(file_name + ".txt")
    fm = file(file_name + '.mp','w')
    cnt = 0
    while True:
        eq = gets(fp)
        if len(eq) == 0: break
        #code = code + (code_eq % eq)
        n = int(gets(fp))
        for k in xrange(n):
            cols = ','.join(gets(fp).split())
            [rot,fli] = gets(fp).split();
            tot = 1
            if fli.startswith('f'): tot *= 2
            if rot.startswith('r'): tot *= 3
            draw(cols, eq, tot)
            #for xx in xrange(3):
            #    if fli.startswith('f'): draw(flip(cols), eq)
            #    if not rot.startswith('r'): break
            #    cols = rotate(cols)

        #code = code + '\n' + code_dy
        gets(fp)
    code = code0 + code + code2
    fm.write(code)
    print code
