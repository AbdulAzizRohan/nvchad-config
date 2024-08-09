local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("cpp", {
  s("roja", {
    t({
      "#include <bits/stdc++.h>",
      "using namespace std;",
      "",
      "typedef long long ll;",
      "typedef pair<int, int> ii;",
      "typedef vector<int> vi;",
      "typedef vector<ii> vii;",
      "typedef map<int, int> mii;",
      "",
      -- "//using ll = long long;",
      -- "//using ii = pair<int, int>;",
      -- "//using vi = vector<int>;",
      -- "//using vii = vector<ii>;",
      -- "//using mii = map<int, int>;",
      -- "//",
      "#define el \"\\n\"",
      "#define pb push_back",
      "#define mp make_pair",
      "",
      -- "//const char* el = \"\\n\";",
      -- "//const char* pb = \"push_back\";",
      -- "//const char* mp = \"make_pair\";",
      -- "//",
      "const int INF = 1e9;",
      "const ll LINF = 4e18;",
      "const double EPS = 1e-9;",
      "",
      "bool debug = false;",
      "",
      "void solve()",
      "{",
      "  ",
      "}",
      "",
      "int main()",
      "{",
      "  //ios_base::sync_with_stdio(false);",
      "  //cin.tie(NULL);",
      "",
      "  ",
    }),
    i(1),
    t({
      "",
      "",
      "  return 0;",
      "}"
    })
  })
})

