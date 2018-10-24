

#SET THE EXECUTION POLICY TO BYPASS BEFORE TRYING TO RUN THE SRIPT OR IT WON'T WORK!!!!!

# Determine if the user has admin priv., if not close current powershell and open it in 'Run As' mode

$myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()

$myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)

 

$adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator


if ($myWindowsPrincipal.IsInRole($adminRole))

   {

   $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)"

   $Host.UI.RawUI.BackgroundColor = "DarkCyan"

   clear-host

   }

else

   {

   $newProcess = new-object System.Diagnostics.ProcessStartInfo "PowerShell";

   $newProcess.Arguments = $myInvocation.MyCommand.Definition;

  

   $newProcess.Verb = "runas";

   

   [System.Diagnostics.Process]::Start($newProcess);


   exit

   }
Write-Host -NoNewLine "Press any key to continue..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")


clear-host
# Generate the Menu that will be used to choose between scripts

Function Show-Menu
{
    param (
        [string]$Title = 'CyberPatriot Menu')
cls
Write-Host ("========== $Title ==========")

Write-host "1: Set User Password Policy"
Write-Host "2: Set Users Passwords"
Write-Host "3: Change Firewall Settings"
Write-host "4: Beep Boop"
Write-Host "Q:Press 'Q' to quit."
}

do
{
# Generate the options for choices in the Main Menu
    Show-Menu
       $input = Read-Host "Please select one"
       Switch($input)
    {
        '1'{
            cls
            
        }'2'{
            cls

        }'3'{
            cls

        }'4'{
            cls
            'thumbs up if you can read this in time'
            start-sleep -Milliseconds 50
            cls
        }'q'{
            return
            }
        }
       start-sleep -milliseconds 150

       If($input -eq '2')
       {
       $Password = ConvertTo-SecureString -AsPlainText "P@$$W0rd1!" -Force

       $users = Get-Content -Path C:\MyScripts\UserList.txt
       }
       
         If($input -eq '4')
    {

    Write-host "      ========================================"
    Write-host "      |                                      |"
    Write-host "      |     =======               =======    |"
    Write-host "      |     =     =               =     =    |"
    Write-host "      |     =     =               =     =    |"
    write-host "      |     =     =               =     =    |"
    Write-host "      |     =======               =======    |"
    write-host "      ========================================"
    write-host "                     |        |               "
    write-host "                     |        |               "
    write-host "       ======================================"
    write-host "       |                                    |"
    write-host "       |                                    |"
    Write-Host "       |                                    |"
    Write-Host "       |                                    |"
    Write-Host "       |                                    |"
    Write-Host "       |                                    |"
    Write-Host "       |                                    |"
    Write-host "       |                                    |"
    Write-Host "       |                                    |"
    Write-host "                   We Are Watching           " -ForegroundColor DarkMagenta
    write-host ""
    Write-host ""
    Write-Host ""
    pause
    }
    
        If($input -eq '1')
 {
    Write-Host -foregroundcolor Green("========== Password Policy ==========")
# Change the Password length, Min. Password Age, and the Max Password Age,
 Net Accounts /MINPWLEN:8
 write-host ""
 Write-host "Minimum Password Length set to '8'." -ForegroundColor Green
 Start-Sleep -milliseconds 300
 write-host ""

 Net Accounts /MINPWAGE:15
 write-host ""
 Write-host "Minimum Password Age set to '15'." -ForegroundColor Green
 Start-Sleep -milliseconds 300
 write-host ""

 Net Accounts /MAXPWage:30
 write-host ""
 Write-host "Maximum Password Age set to '30'." -ForegroundColor Green
 Start-Sleep -milliseconds 300

 #  Spaces to Distinguish the Different Sections of the Script

 Write-Host ""
 Write-Host "" 

 # Configure the Password Policy and Account Lockout
 write-Host ("Configuring Password History,Complexity, and the Lockout Policy.") -ForegroundColor cyan
 write-host ""
 secedit /export /cfg c:\secpol.cfg
 (gc C:\secpol.cfg).replace("PasswordComplexity = 0", "PasswordComplexity = 1") | Out-File C:\secpol.cfg; (gc C:\secpol.cfg).replace("LockoutBadCount = 0", "LockoutBadCount = 6")  | Out-File C:\secpol.cfg; (gc C:\secpol.cfg).replace("PasswordHistorySize = 0", "PasswordHistorySize = 5") | Out-File C:\secpol.cfg; (gc C:\secpol.cfg).replace("EnableGuestAccount = 1", "EnableGuestAccount = 0") | Out-File C:\Secpol.cfg
 secedit /configure /db c:\windows\security\local.sdb /cfg c:\secpol.cfg /areas SECURITYPOLICY
 rm -force c:\secpol.cfg -confirm:$false
 Write-host ""
 Write-host "Lockout Threshold Set to '6 Attempts'" -foregroundcolor Green
 Start-sleep -Milliseconds 500
 Write-host ""
 Write-Host ""
 Write-host "Lockout Duration set to '30 minutes'" -ForegroundColor Green
 Start-sleep -Milliseconds 500
 Write-Host ""
 Write-Host ""
 Write-Host "Passwords remembered set to '5'" -ForegroundColor Green
 Start-Sleep -Milliseconds 500
 Write-host ""
 Write-host ""
 Write-Host "Password Complexity set to 'Enabled'" -ForegroundColor Green
 Start-sleep -Milliseconds 500
 Write-host ""


 
 Write-Host "Done!" -ForegroundColor Yellow
 Read-Host "Press'enter' to continue"
 }   
 # If chosen will change the firewall settings to block incoming connnections.
    If($input -eq '3')
   {
   $FW=New-object -ComObject HnetCfg.FwPolicy 2 ; Convert-fwprofileType $fw.CurrentProfileTypes 
   $FwprofileTypes= @{1GB="All";1="Domain"; 2="Private" ; 4="Public"}
   $FwAction    =@{1="Allow" ; 0="Block"}
   $FwProtocols   =@{1="ICMPv4";2="IGMP";6="TCP";17="UDP";41="IPv6";
    }


    }
   #End the Loop
    }
 until ($input -eq 'q');

 
 