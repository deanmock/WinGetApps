# credit to https://powershellisfun.com/2025/02/07/using-the-powershell-winget-client-module-to-install-your-apps-on-your-new-computer/

# import WinGet
Install-Module -Name Microsoft.WinGet.Client
Import-Module -Name Microsoft.WinGet.Client

# makes list of programs currently on your machine
(Get-WinGetPackage | Where-Object Source -eq winget).Id | Sort-Object | Out-File c:\temp\WinGetApps.txt

# run in administrator PS window
# this will install all programs from your WinGetApps.txt
Get-Content C:\temp\WinGetApps.txt | foreach {Install-WinGetPackage -Id $_ -Source WinGet}
