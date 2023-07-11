# Install-Update-laanp-Icarus_Mods

This is an automated method to install or update the [Icarus_Mods by Laanp](https://github.com/laanp/Icarus_Mods).
This script automates the process of downloading and installing mods for the game "Icarus" in your Steam library. 
- Uses PowerShell, and other native libraries, such as the built-in Windows ZIP handling, so that no special software needs to be installed.
- It retrieves the latest mod release from a specific GitHub repository and installs it into the appropriate folder. 
- The script prompts you to enter the path to your Steam library, and saves the value to %appdata/SteamLibraryConfig.txt so that you do not have to keep entering the path. 
- It creates the necessary folders if they don't exist. 
- It removes any old mod files to ensure a clean installation. 
- Finally, it extracts the downloaded mod file directly into the "Mods" folder.
- May be easily modified to use with other mod collections.

## How to use
1. Download file and save it to where you can find it again.
2. Right click on UpdateLaanpIcarusMods.ps1 and select, "Run With Powershell".
3. Follow the directions on the PowerShell console window. 

## [Alternative ways to run the script](https://learn.microsoft.com/en-us/powershell/scripting/windows-powershell/starting-windows-powershell?view=powershell-7.3 ) 
- Click Start, type PowerShell, and then click Windows PowerShell, or, 
- From the Start menu, click Start, click All Programs, click Accessories, click the Windows PowerShell folder, and then click Windows PowerShell.
1. Type the file path to the script. Example: C:\Scripts\UpdateLaanpIcarusMods.ps1
2. Follow the directions on the PowerShell console window.
