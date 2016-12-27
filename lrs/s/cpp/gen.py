code0 = '''verbatimtex
%&LaTeX
\documentclass{article}
\usepackage{amsmath}
\usepackage{amssymb}
\\begin{document}
etex

prologues := 3;
filenametemplate "STheta'''

code1 = '''.eps";

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

input s;

beginfig(1)
    pickup pencircle scaled dfts;
	pair coor; %, dx, dy, dxx;
	%dx  := (widthG, 0);
	%dy  := (0, -heightG);
    %dxx := (-widthGG, 0);

    coor := (0,0);
'''

code2 = '''
endfig;

end;
'''

code_coor = '\tcoor := coor + dy;\n'
codeGG = '\tdrawGG (coor + dxx, %s);\n'
codeG  = '\tdrawG  (coor + %ddx, %s, %s);\n'
btex = 'btex $%s$ etex scaled qs0'
number = '\tlabel.lft(btex $(%s)$ etex scaled qs1, coor + dxx + dnum);\n'

def gets(f):
    ret = f.readline()
    if ret.endswith('\n'):
        return ret[:-1]
    else:
        return ret

for i in xrange(10):
    code = ''
    fp = file('p' + str(i))
    fl = file('l' + str(i))
    fm = file('../s' + str(i) + '.mp','w')
    num = 97
    while True:
        line = gets(fp)
        if len(line) == 0: break
        nol = int(line)
        cols = []
        for k in xrange(3):
            cols += map(int, gets(fp).split())
        gets(fp)
        code += codeGG % ','.join(map(str,cols))
        code += number % (chr(num))
        num += 1

        for k in xrange(nol):
            nog = int(gets(fp))
            print 'nog: ',nog
            for l in xrange(nog):
                crs = set(map(int,gets(fp).split()))
                col = cols[:]
                for index in xrange(9):
                    if (index + 1) in crs: col[index] = 2
                code += codeG % (l, ','.join(map(str,col)), btex % gets(fl))
            code += code_coor
            gets(fp)
    fm.write(code0 + str(i) + code1 + code + code2)

#print code1 + code + code2
#fm.write(code1 + code + code2)
