import pyperclip

f = file('rodes1.txt')
code = "vardef rot1() =\n"
code += "cx1 := (a0 + a1) / 2; cy1 := (b0 + b1) / 2;\n"
code += "sin := sind(45); cos := cosd(45);\n"
while True:
    line = f.readline()
    if len(line) == 0: break
    if len(line) == 1: continue
    line = line[:-1]
    x = "x%s" % line
    y = "y%s" % line
    code += "    xx := %s - cx1; yy := %s - cy1;\n" % (x,y)
    code += "    %s := cos*xx+sin*yy+cx1; %s := -sin*xx+cos*yy+cy1;\n" % (x,y)

code = code + "enddef;\n\n"
print code
pyperclip.copy(code)
