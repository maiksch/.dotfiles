$Path = "$PSScriptRoot\..\oh-my-posh\maiksch.omp.json";
$Theme = (Get-Item $Path).FullName
oh-my-posh init pwsh --config $Theme | Invoke-Expression