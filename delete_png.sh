#!/bin/bash

# 開始ディレクトリを指定（カレントディレクトリの場合は「.」）
start_dir="tiles"

# PNGファイルの数を数える
png_count=$(find "$start_dir" -type f -name "*.png" | wc -l)

echo "見つかったPNGファイル: $png_count 個"

# 削除の確認
read -p "これらのPNGファイルを削除しますか？ (y/n): " confirm

if [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
    # findコマンドを使用して全てのPNGファイルを検索し、削除
    find "$start_dir" -type f -name "*.png" | while read -r file; do
        # ファイルを削除
        rm "$file"
        
        # 削除結果を表示
        echo "削除しました: $file"
    done

    echo "削除が完了しました。"
else
    echo "削除をキャンセルしました。"
fi