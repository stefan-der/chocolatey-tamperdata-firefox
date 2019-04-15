# Chocolatey Plugin installer for Firefox Plugin "Tamper Data for FF Quantum by Pamblam"
[Addon Page - Official mozilla](https://addons.mozilla.org/en-US/firefox/addon/tamper-data-for-ff-quantum/)
[MIT - License](http://www.opensource.org/licenses/mit-license.php)
[Source - Github](https://github.com/Pamblam/Tamper-Data-for-FF-Quantum)
[Picture Source](https://camo.githubusercontent.com/8482d889055af4465dab448ca3a46b3bb19f0891/68747470733a2f2f692e696d6775722e636f6d2f716b4a7641514f2e706e67)

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


## Pitfalls
* Getting the Addon CDN URL for Installation of Firefox Addon
    * get official Download URL like -> https://addons.mozilla.org/firefox/downloads/file/1081527/tamper_data_for_ff_quantum-0.3-an+fx.xpi
    * start Fiddler with decryption of https
    * search for the URL addons.cdn.mozilla.net
    * grab the Get Request Header -> "/user-media/addons/998256/tamper_data_for_ff_quantum-0.3-an+fx.xpi?filehash=sha256%3A031e45ece363fc6d91f3892f9622d601b664ac12040f23de5f5a906a4638bfa2"