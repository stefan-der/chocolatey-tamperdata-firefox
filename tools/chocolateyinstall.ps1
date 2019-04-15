# This Package is inspired by
#   proudcanadianeh - uBlock Origin for Firefox
#   doc - adblockplus-firefox
# Thanks for that!

#$url        = 'https://addons.mozilla.org/firefox/downloads/file/1081527/tamper_data_for_ff_quantum-0.3-an+fx.xpi'
$url        = 'https://addons.cdn.mozilla.net/user-media/addons/998256/tamper_data_for_ff_quantum-0.3-an+fx.xpi?filehash=sha256%3A031e45ece363fc6d91f3892f9622d601b664ac12040f23de5f5a906a4638bfa2'

# For deploying Firefox Addons the Filename has to be "<extension_specific_id>.xpi"
# in all other cases Firefox ignores xpi file

# Install the Extension on Reference Machine
# open about:memory (Firefox)
# Section "Show memory reports" click on "Measure"
# Search for Addon Name -> there should be an entry with extension id="<extension_specific_id>"
$extensionName = "{2bd18ca8-5dd7-4311-a777-02ed29663496}.xpi"

#Find Firefox install location
if(test-path 'hklm:\SOFTWARE\Mozilla\Firefox\TaskBarIDs'){
  $installDir = Get-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Mozilla\Firefox\TaskBarIDs | Select-Object -ExpandProperty Property
    Write-Output "Install Path located via Registry"
}elseif(test-path 'hklm:\SOFTWARE\Wow6432Node\Mozilla\Firefox\TaskBarIDs'){
  $installDir = Get-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Mozilla\Firefox\TaskBarIDs | Select-Object -ExpandProperty Property
    Write-Output "Install path found via Wow6432Node in the registry"
}else{
	throw "Firefox install not detected"
}

#Generate path for copy
$browserFolder = Join-Path $installDir "browser"
$extensionsFolder = Join-Path $browserFolder "extensions"
$extFile = Join-Path $extensionsFolder "$extensionName"

#Check to see if process running
$isrunning = Get-Process -Name firefox -ErrorAction SilentlyContinue
if ($isrunning){
    throw "Firefox running"
}

#Copy to Firefox system extensions folder
Write-Output "Preparing to install to path $extFile"
try {
    Get-ChocolateyWebFile -PackageName 'tamperdata-firefox' -FileFullPath "$extFile" -url $url -ForceDownload
 }catch{
    Write-Output "Error occured, fail to copy file."
 }
