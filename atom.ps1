

$atom = (join-path $home "\AppData\Local\atom\bin\atom.cmd")

$path = $ARGS[0]

if($path -eq $null) { # 引数がない場合は現在のディレクトリを開く
	start $atom (pwd)
} elseif($path.contains("*")) { # パスに「*」が入ったときはlsで探して開く
	start $atom (ls $path)
} elseif(Split-Path $path -isAbsolute) { # pathが絶対パスならそのパスを開く
	start $atom $ARGS[0]
} else { # 違えば現在のパスからの引数[0]の相対パスを開く
	start $atom (join-path (pwd) $path)
}
