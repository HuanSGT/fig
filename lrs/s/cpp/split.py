f = file('labels.txt')
s = f.read()[:-1];
s = s.split("\n\n\n");
print len(s)
for i in xrange(10):
    fo = file('l' + str(i),'w')
    #fo.write(str(len(s[i].split('\n'))) + '\n')
    fo.write(s[i])
