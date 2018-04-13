#include <bits/stdc++.h>
#define range(i, a, b) for(int i = (a); i < (b); i++)
#define rep(i, a) range(i, 0, a)
using namespace std;

int d, n, memo[110][110];
vector <int> a, e, r;
const int INF = 1000000000;

int rec(int c = 0, int dur = 0, int exp = 0) {
	if (c > 1000) {
		return INF;
	}
	if (dur >= d) {
		return 0;
	}
	if (memo[dur][exp] != -1) {
		return memo[dur][exp];
	}
	int res = INF;
	rep (i, n) {
		if (exp < r[i]) continue;
		if (a[i] == 0 && e[i] == 0) continue;
		int tmp = rec(c + 1, dur + a[i], min(exp + e[i], 101));
		res = min(res, tmp + 1);
	}
	return memo[dur][exp] = res;
}

int main() {
	while(cin >> d >> n, n) {
		a = e = r = vector <int> (n);
		rep (i, n) cin >> a[i] >> e[i] >> r[i];
		memset(memo, -1, sizeof(memo));
		int ans = rec();
		cout << (ans == INF ? "NA" : to_string(ans)) << endl;
	}
	return 0;
}
