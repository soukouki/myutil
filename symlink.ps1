# 第一引数にファイル名 第二引数にファイルのパス
New-Item -Path . -Name $ARGS[0] -Value $ARGS[1] -ItemType SymbolicLink
