#!/bin/bash

mkdir -p log html

for i in $(seq 0 99); do
  echo "--- Game $i 開始 ---"
  mjai server --host=127.0.0.1 --port=11600 \
    --game_type=one_kyoku --room=default \
    --log_dir=./log \
    "mjai-shanten mjsonp://127.0.0.1:11600/default" \
    "mjai-shanten mjsonp://127.0.0.1:11600/default" \
    "mjai-shanten mjsonp://127.0.0.1:11600/default" \
    "mjai-shanten mjsonp://127.0.0.1:11600/default"

  # HTML変換
  log_file="log/game_${i}.mjson"
  html_file="html/game_${i}.html"
  if [ -f "$log_file" ]; then
    echo "Converting $log_file → $html_file"
    mjai convert --format=html "$log_file" > "$html_file"
  else
    echo "⚠️ ログファイルが見つかりません: $log_file"
  fi
done

echo "✅ 全100局のHTML化が完了しました！"