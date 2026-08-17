#!/usr/bin/env bash
# Syntax-checks the JS inside game.html without opening a browser.
# Usage: ./check.sh
set -uo pipefail
cd "$(dirname "$0")"

if [ ! -f game.html ]; then echo "FAIL: game.html does not exist"; exit 1; fi

node -e '
const fs = require("fs");
const html = fs.readFileSync("game.html", "utf8");
const blocks = [...html.matchAll(/<script\b[^>]*>([\s\S]*?)<\/script>/gi)].map(m => m[1]);
if (!blocks.length) { console.log("FAIL: no <script> block found"); process.exit(1); }
const js = blocks.join("\n;\n");
fs.writeFileSync("/tmp/_game_check.js", js);
const lines = js.split("\n").length;
try {
  new (require("vm").Script)(js, { filename: "game.html" });
  console.log(`PASS: JS parses cleanly (${lines} lines, ${blocks.length} script block(s))`);
} catch (e) {
  console.log("FAIL: " + e.message);
  if (e.stack) console.log(e.stack.split("\n").slice(0, 4).join("\n"));
  process.exit(1);
}
'
