# ChemDrawTrialReset
Works with ChemDraw 22
Script to reset ChemDraw trial activations

Usage: 

1. Download ChemDrawTrialReset.exe from releases tab
2. Run (may need to be run as administrator)


Alternative:
This may be useful if the .exe does not work

1. Download main.ps1
2. Open powershell as administrator
3. Paste    set-executionpolicy remotesigned    into the console to allow Powerscript execution
4. Right click main.ps1 and select run in powershell

Modifiying registry locations: 
The default location is set to HKEY_CURRENT_USER\Software\PerkinElmerInformatics\ChemBioDraw\**.*\Ultra

This may be altered by changing 
$keyNamePattern = "Registry::HKEY_CURRENT_USER\Software\PerkinElmerInformatics\ChemBioDraw\**.*\Ultra"
