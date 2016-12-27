import pyperclip
num = {1:'one',2:'two',3:'three',4:'four'}
code = ""
for i in range(1,5):
    txt = "edges" + str(i) + ".txt"
    code = code + "vardef drawEdges_%s(expr col,scale,alen,agl) =\n" % (num[i])
    f = file(txt)
    while True:
        line = f.readline()
        if len(line) == 0: break
        if len(line) == 1: continue
        a,b = map(int,line.split())
        code = code + "    drawEdge(x%d,y%d,x%d,y%d,col,scale,alen,agl);\n" % (a,a,b,b)
    code = code + "enddef;\n\n"

txt = "edgess.txt"
code = code + "vardef drawEdgess(expr scale,alen,agl) =\n"
f = file(txt)
while True:
    line = f.readline()
    if len(line) == 0: break
    if len(line) == 1: continue
    a,b = map(int,line.split())
    code = code + "    drawEdges(x%d,y%d,x%d,y%d,scale,alen,agl);\n" % (a,a,b,b)
code = code + "enddef;\n\n"

print code
pyperclip.copy(code)
