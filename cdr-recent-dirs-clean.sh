#!/bin/sh

orig=~/.chpwd-recent-dirs
temp=~/.chpwd-recent-dirs-temp
backup=~/.chpwd-recent-dirs-bk

# temp書き出しファイルを空で作成
:>| $temp

# 存在するディレクトリパスのみをtempに書き出す
cat $orig \
  | sed -e 's/^..\(.*\)./\1/g' \
  | while read line
do
  if [ -d "$line" ]; then
    echo "\$'$line'" >> $temp
  fi
done

# 結果置き換え
mv $orig $backup
mv $temp $orig
