#!/bin/bash

# 開始ディレクトリを指定（カレントディレクトリの場合は「.」）
start_dir="tiles"

# findコマンドを使用して全てのPNGファイルを検索し、各ファイルに対してcwebpを実行
find "$start_dir" -type f -name "*.png" | while read -r file; do
    # 出力ファイル名を生成（同じディレクトリに.webp拡張子で保存）
    output_file="${file%.png}.webp"
    
    # 変換を実行
    cwebp -q 80 "$file" -o "$output_file"
    
    # 変換結果を表示
    echo "Converted: $file -> $output_file"
done

echo "変換が完了しました。"