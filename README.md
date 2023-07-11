# Install-Update-laanp-Icarus_Mods
This script automates the process of downloading and installing mods for the game "Icarus" in your Steam library. 
It retrieves the latest mod release from a specific GitHub repository and installs it into the appropriate folder. 
The script prompts you to enter the path to your Steam library, and saves the value to %appdata/SteamLibraryConfig.txt so that you do not have to keep entering the path. 
It creates the necessary folders if they don't exist. 
It removes any old mod files to ensure a clean installation. 
Finally, it extracts the downloaded mod file directly into the "Mods" folder using the built-in Windows ZIP handling.
