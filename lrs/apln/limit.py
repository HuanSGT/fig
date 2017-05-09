import math

def vn(n):
    return 2 + (3 ** n - 3) / 4

a1,b1,c1,d1 = 108,246,480,738
n = 2
while True:
    n = n + 1
    if n > 3:
        a0,b0,c0,d0 = a1,b1,c1,d1
        a1 = 3 * b0 * (a0 ** 2);
        b1 = 2 * c0 * (a0 ** 2) + 4 * (b0 ** 2) * a0;
        c1 = d0 * (a0 ** 2) + 8 * c0 * b0 * a0 + 3 * (b0 ** 3);
        d1 = 6 * d0 * b0 * a0 + 6 * a0 * (c0 ** 2) + 12 * (b0 ** 2) * c0;

    v_n = vn(n)

    e_n = math.log(d1) / v_n

    f = file('limit.txt','a')
    f.write('n = ' + str(n) + '\n')
    f.write('E_n = ' + str(e_n) + '\n')
    f.write('\n')
    f.close()

    print 'n =', n
    #print 'varphi_n =', a1
    #print 'theta_n =', b1
    #print 'phi_n =', c1
    #print 'tau_n =', d1
    #print 'V_n =', v_n
    print 'E_n =', e_n
    print ''
    print '*' * 20
    print ''
