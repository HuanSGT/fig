import pyperclip
ans = []
while True:
    try:
        inp = raw_input()
    except EOFError:
        break
    if len(inp) == 0: continue
    a = int(inp)
    str = "drawCircle((x%d,y%d),interCol,outlineCol,radius);" % (a,a)
    ans.append(str)
code = ""
for x in ans:
    code = code + x + "\n"
print code
pyperclip.copy(code)
