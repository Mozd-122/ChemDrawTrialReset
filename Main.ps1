clear

# Define the key name pattern with wildcards
$keyNamePattern = "Registry::HKEY_CURRENT_USER\Software\PerkinElmerInformatics\ChemBioDraw\**.*\Ultra"

$ProgramPathDefault = "C:\Program Files\PerkinElmerInformatics\ChemOffice\ChemDraw\ChemDraw.exe"
$ProgramPath = ""
$Input = ""
$Input2 = ""
$done = $false


if (Get-ItemProperty -Path $keyNamePattern -Name "Program Path" -Erroraction 'silentlycontinue') {
	
	$ProgramPath = Get-ItemPropertyValue -Path $keyNamePattern -Name "Program Path" -Erroraction 'silentlycontinue'
	
}else{

	New-Item -Path $keyNamePattern -Name "Program Path" -Force -ErrorAction SilentlyContinue  
	New-ItemProperty  -Path $keyNamePattern -Name "Program Path" -Value $ProgramPathDefault ` -PropertyType String -Force 
	
}





function Choice-1 {
clear
$Input = Read-Host "Select options:

1 Run
2 Change Program Path

"

if ($Input -eq 1){
	
	clear
	return $false
	
}elseif ($Input -eq 2){
	clear
	
	$Input2 = Read-Host "Select options:

1 Reset to Default
2 Custom Program Path
3 Return

"
	
if ($Input2 -eq 1){
	
	clear
	New-ItemProperty  -Path $keyNamePattern -Name "Program Path" -Value $ProgramPathDefault ` -PropertyType String -Force | Out-Null
	Write-Host "Completed"
	pause
	return
	
}elseif ($Input2 -eq 2){
	
	clear
	$ProgramPath = Read-Host "Please enter the complete path to your ChemDraw installation" 
	New-ItemProperty  -Path $keyNamePattern -Name "Program Path" -Value $ProgramPath ` -PropertyType String -Force | Out-Null
	return
	
}elseif ($Input2 -eq 3){
	
clear
return

}
	
}else{
	
	clear
	return
	
	}
}



while ($true){
clear 
$done = Choice-1
if ($done -eq $false){
	break
}
}

$ProgramPath = Get-ItemPropertyValue -Path $keyNamePattern -Name "Program Path" -Erroraction 'silentlycontinue'
Write-Host "Current Program Path: " $ProgramPath
	
# Get child keys matching the pattern
$keys = Get-ItemProperty -Path $keyNamePattern -Name "Launch Count" -Erroraction 'silentlycontinue'

# Check if any keys were found
if ($keys) {
    Remove-ItemProperty -Path $keyNamePattern -Name "Launch Count"
    Write-Host "Keys Cleared Sucessfully"
  } else {
    Write-Host "Keys Already Cleared"
  }

try {Start-Process -FilePath $ProgramPath -Erroraction 'silentlycontinue'}

catch {
	
	$ProgramPath = Read-Host "Error: Your ChemDraw installation is not at the default path. Please enter the complete path to your ChemDraw installation"
	New-ItemProperty  -Path $keyNamePattern -Name "Program Path" -Value $ProgramPath ` -PropertyType String -Force
	
}



