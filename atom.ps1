

$atom = (join-path $home "\AppData\Local\atom\bin\atom.cmd")

$path = $ARGS[0]

# 引数がない場合は現在のディレクトリを開く
if($path -eq $null){
	start $atom (pwd)
	exit
}

# 引数[0]が絶対パスならそのパスを開く
if(Split-Path $path -isAbsolute){
	start $atom $ARGS[0]
# 違えば現在のパスからの引数[0]の相対パスを開く
}else{
	start $atom (join-path (pwd) $path)
}
