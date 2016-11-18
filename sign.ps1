
$command = $ARGS -join " "
Invoke-Expression "$command"
Invoke-Expression (join-path $MyInvocation.MyCommand.Path "..\sign.mid")
