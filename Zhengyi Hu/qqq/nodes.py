import pyperclip
num = {1:'one',2:'two',3:'three',4:'four'}
code = ""
for i in range(1,4):
    txt = "nodes" + str(i) + ".txt"
    code = code + "vardef drawNodes_%s(expr interCol,outlineCol,radius) =\n" % (num[i])
    f = file(txt)
    while True:
        line = f.readline()
        if len(line) == 0: break
        if len(line) == 1: continue
        a = int(line)
        code = code + "    drawCircle((x%d,y%d),interCol,outlineCol,radius);\n" % (a,a)
    code = code + "enddef;\n\n"


for i in range(1,4):
    txt = "nodess" + str(i) + ".txt"
    code = code + "vardef drawNodess_%s(expr interCol,outlineCol,radius) =\n" % (num[i])
    f = file(txt)
    while True:
        line = f.readline()
        if len(line) == 0: break
        if len(line) == 1: continue
        a = int(line)
        code = code + "    drawCircles(x%d,y%d,interCol,outlineCol,radius);\n" % (a,a)
    code = code + "enddef;\n\n"

print code
pyperclip.copy(code)
