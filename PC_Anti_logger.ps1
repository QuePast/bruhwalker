Set-executionPolicy -Scope CurrentUser -ExecutionPolicy unrestricted
Stop-Process -Name Dwrcst
while($true)
{
$wshell = New-Object -ComObject wscript.shell;
Start-Sleep -s 30
$wshell.SendKeys('{t}{e}{s}{t}{F5}')
}
