

$atom = (join-path $home \AppData\Local\atom\bin\atom.cmd)

# 引数がない場合は現在のディレクトリを開く
if($ARGS.Length -eq 0){
	start $atom (pwd)
	exit
}

# 引数[0]が絶対パスならそのパスを開く
if(Split-Path $ARGS[0] -isAbsolute){
	start $atom $ARGS[0]
# 違えば現在のパスからの引数[0]の相対パスを開く
}else{
	start $atom (join-path (pwd) $ARGS[0])
}
