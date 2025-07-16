#!/bin/sh

# mjaiコマンドのパス（インストール済み前提）
MJAI_CMD="mjai"

# .mjsonファイルをすべて処理
for f in *.mjson; do
  out="${f%.mjson}.html"
  echo "変換中: $f → $out"
  $MJAI_CMD convert "$f" "$out"
done