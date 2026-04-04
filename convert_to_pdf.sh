#!/bin/bash

# README.md を PDF に変換するスクリプト
# 使用ツール: md-to-pdf (Puppeteer ベース)

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INPUT="$SCRIPT_DIR/README.md"
DATE="$(date +%Y%m%d)"
OUTPUT="$SCRIPT_DIR/${DATE}_レジュメ.pdf"

echo "Converting $INPUT to $OUTPUT ..."

md-to-pdf "$INPUT" \
  --pdf-options '{"format":"A4","margin":{"top":"20mm","bottom":"20mm","left":"20mm","right":"20mm"}}' \
  --css "
    body { font-family: 'Hiragino Sans', 'Noto Sans CJK JP', sans-serif; font-size: 11px; line-height: 1.7; color: #222; }
    h1 { font-size: 22px; border-bottom: 2px solid #333; padding-bottom: 6px; }
    h2 { font-size: 15px; border-bottom: 1px solid #aaa; margin-top: 20px; padding-bottom: 4px; }
    h3 { font-size: 12px; margin-top: 14px; color: #555; }
    a { color: #0066cc; text-decoration: none; }
    strong { color: #111; }
    p { margin: 6px 0; }
  "

mv "$SCRIPT_DIR/README.pdf" "$OUTPUT"

echo "Done! Output: $OUTPUT"
