# Chocolatey Plugin installer for Firefox Plugin "Tamper Data for FF Quantum by Pamblam"
[Addon Page - Official mozilla](https://addons.mozilla.org/en-US/firefox/addon/tamper-data-for-ff-quantum/)
[MIT - License](http://www.opensource.org/licenses/mit-license.php)
[Source - Github](https://github.com/Pamblam/Tamper-Data-for-FF-Quantum)

##Prerequesites
* [chocolatey - Official](https://chocolatey.org)

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

## Thanks for the inspiration
*   proudcanadianeh - uBlock Origin for Firefox
*   doc - adblockplus-firefox
