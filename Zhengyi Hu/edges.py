import pyperclip
num = {1:'one',2:'two',3:'three',4:'four'}
code = ""
'''
for i in range(1,5):
    for j in range(97,99):
        txt = "edges" + str(i) + chr(j) + ".txt"
        print txt
        code = code + "vardef drawEdges_%s(expr col,scale,alen,agl) =\n" % (num[i] + chr(j))
        f = file(txt)
        while True:
            line = f.readline()
            if len(line) == 0: break
            if len(line) == 1: continue
            a,b = map(int,line.split())
            code = code + "drawEdge(x%d,y%d,x%d,y%d,col,scale,alen,agl);\n" % (a,a,b,b)
        code = code + "enddef;\n\n"
        '''

txt = "edges.txt"
print txt
f = file(txt)
while True:
    line = f.readline()
    if len(line) == 0: break
    if len(line) == 1: continue
    a,b = map(int,line.split())
    code = code + "drawEdge(x%d,y%d,x%d,y%d,col,scale,alen,agl);\n" % (a,a,b,b)

print code
pyperclip.copy(code)
