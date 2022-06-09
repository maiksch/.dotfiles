# winget install oh-my-posh

# Create profile
$ProfilePath = (Get-Item "./profile.ps1").FullName
echo $Profile
echo ". $ProfilePath" >> $Profile