# ChemDrawTrialReset
Script to reset ChemDraw trial activations

Requires ChemDraw to be installed

Works with ChemDraw 22

_____
<h3>Usage: </h3> 

1. Download and install ChemDraw if necessary (provided in releases tab)
2. Download ChemDrawTrialReset.exe from releases tab
3. Run (may need to be run as administrator)

Alternative:
This may be useful if the .exe does not work

1. Download main.ps1
2. Open powershell as administrator
3. Paste " &nbsp; set-executionpolicy remotesigned &nbsp; " into the console to allow Powerscript execution
4. Right click main.ps1 and select run in powershell
<br><br/>
<br><br/>

Modifiying registry locations: 
The default location is set to HKEY_CURRENT_USER\Software\PerkinElmerInformatics\ChemBioDraw\**.*\Ultra

This may be altered by changing 
$keyNamePattern = "Registry::HKEY_CURRENT_USER\Software\PerkinElmerInformatics\ChemBioDraw\**.*\Ultra"
