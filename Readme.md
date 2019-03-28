# Chocolatey Plugin installer for tamperdata-firefox

##Prerequesites
chocolatey

##Build Steps
1. Install firefox-esr or firefox
    * choco install Firefox-ESR  (choco install Firefox)
2. Clone Repository
4. Open a new "elevated" PowerShell Console
3. Navigate to the cloned Folder
4. Enter PowerShell Command (this command does not need an elevation)
    * choco pack
5. Enter PowerShell Command (this command requires access to Chocolatey lib)
    * choco install -s tamperdata-firefox -y