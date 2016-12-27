#include<bits/stdc++.h>
#define rep(i,s,t) for (ll i=(s); i<=(t); ++i)
#define dep(i,t,s) for (ll i=(t); i>=(s); --i)
#define i first
#define j second
#define pb push_back
#define qb pop_back
#define pf push_front
#define qf pop_front
#define sz(x) ll((x).size())
#define p(i) (1LL<<((i)-1))
#define w(x,i) ((x)&p(i))
#define inf ll(~0u>>1)

using namespace std;

template<class T> inline T pr(T x) { return --x; }
template<class T> inline T nx(T x) { return ++x; }
template<class T> inline T sqr(T x) { return x*x; }

template<class T>
inline void get(T &n) {
    char c = getchar();
    while (c!='-' && (c<'0' || c>'9')) c = getchar();
    n = 0; T s = 1; if (c=='-') s = -1,c = getchar();
    while (c>='0' && c<='9') n*=10,n+=c-'0',c=getchar();
    n *= s;
}

typedef int ll;
typedef pair<ll,ll> PII;

ll n,nn,m,mm,cnt;

int main() {
    ll i,j,k,t,tt,Test;
    puts("verbatimtex\n%&LaTeX\n\\documentclass{article}\n\\usepackage{amsmath}\n\\usepackage{amssymb}\n\\begin{document}\netex\n\nprologues := 3;\nfilenametemplate \"%j_%c.eps\";\n\ninput r;\n\nbeginfig(1)\n\tpickup pencircle scaled dfts;\n\n\tpair coor[], dx, dy;\n\tdx := (width, 0);\n\tdy := (0, -height);\n\n\tcoor[0] := (0,0);\n");

    mm = 0;
    m = 1;
    cnt = 0;
    while (cin >> n) {
        ++cnt;
        printf("\tcoor[%d] := coor[%d] + dy;\n",m,mm);
        printf("\tlabel.lft(btex $(%c)$ etex scaled qs0, coor[%d] + (lmargin, halfh));\n",
                'a' + cnt - 1, m);
        printf("\tfor i=%d upto %d:\n",m+1,m+n-1);
        printf("\t\tcoor[i] := coor[i - 1] + dx;\n");
        printf("\tendfor;\n");

        rep(k,1,n) {
            printf("\tdrawG(coor[%d]",m + k - 1);
            rep(i,1,9) {
                cin >> t;
                printf(",%d",t);
            }
            printf(");\n");
        }
        puts("");
        mm = m; m += n;
    }

    puts("endfig;\n\nend;");


    return 0;
}
