# This Package is inspired by
#   proudcanadianeh - uBlock Origin for Firefox
#   doc - adblockplus-firefox
# Thanks for that!


$ErrorActionPreference = 'Stop';
$extensionName = "{2bd18ca8-5dd7-4311-a777-02ed29663496}.xpi"

if(test-path 'hklm:\SOFTWARE\Mozilla\Firefox\TaskBarIDs'){
  $installDir = Get-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Mozilla\Firefox\TaskBarIDs | Select-Object -ExpandProperty Property
}
if(test-path 'hklm:\SOFTWARE\Wow6432Node\Mozilla\Firefox\TaskBarIDs'){
  $installDir = Get-Item -Path Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Mozilla\Firefox\TaskBarIDs | Select-Object -ExpandProperty Property
}


$browserFolder = Join-Path $installDir "browser"
$extensionsFolder = Join-Path $browserFolder "extensions"
$extFile = Join-Path $extensionsFolder "$extensionName"

$isrunning = Get-Process -Name firefox -ErrorAction SilentlyContinue

if ($isrunning){
  throw "Firefox running"
}

Test-Path $extFile
Remove-Item "$extFile" -Force -Recurse
