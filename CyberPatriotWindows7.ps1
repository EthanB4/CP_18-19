#SET THE EXECUTION POLICY TO BYPASS BEFORE TRYING TO RUN THE SRIPT OR IT WON'T WORK!!!!!

# Determine if the user has admin priv., if not close current powershell and open it in 'Run As' mode

$myWindowsID=[System.Security.Principal.WindowsIdentity]::GetCurrent()

$myWindowsPrincipal=new-object System.Security.Principal.WindowsPrincipal($myWindowsID)

 

$adminRole=[System.Security.Principal.WindowsBuiltInRole]::Administrator


if ($myWindowsPrincipal.IsInRole($adminRole))

   {

   $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)"

   $Host.UI.RawUI.BackgroundColor = "Black"

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
   #Start up Picture

Start-sleep -milliseconds 500
write-host ""
Write-host ""
Write-host ""
Write-host ""
Write-host "                           /\                              " -fore Yellow
Write-host "                          /  \                             " -Fore Yellow
Write-host "                         /    \                            " -fore Yellow
Write-host "                        /      \                           " -fore Yellow
Write-host "                       /        \                          " -fore yellow
Write-host "                      /          \                         " -fore yellow
Write-host "                     /            \                        " -fore Yellow
write-host "                    /______________\                       " -fore yellow
Write-host "                   / \            / \                      " -fore yellow
write-host "                  /   \          /   \                     " -fore yellow
write-host "                 /     \        /     \                    " -fore yellow
Write-host "                /       \      /       \                   " -fore yellow
write-host "               /         \    /         \                  " -fore yellow
Write-host "              /           \  /           \                 " -fore yellow
Write-host "             /             \/             \                " -fore yellow
Write-host "            /______________________________\               " -fore Yellow
write-host "                CyberPatriot 2018-2019                     " -fore gray
Write-host ""
Start-sleep -milliseconds 1000
$ErrorActionPreference = 'silentlycontinue'
clear-host

Function Show-Team
{
Write-host "           _____     ____       ______     " -fore red
Write-host "          / / | |   /    \     / / | |     " -fore red
Write-host "         / /  | |  |  /\  |   / /  | |     " -fore red
Write-host "        / /___| |  | |  | |  / /___| |     " -fore red
Write-host "       /______| |  | |  | | /______| |     " -fore red
Write-host "              | |  |  \/  |        | |     " -fore red
Write-host "              |_|   \____/         |_|     " -fore red
} 
Function Show-User-Info
{
Net User | out-file C:\Users.txt
Get-Content C:\Users.txt

}
# Generate the Menu that will be used to choose between scripts
Function Show-Menu
{
    param (
        [string]$Title = 'Team 404 Menu' )
cls
Write-Host -fore Red ("========== $Title ==========")

Write-host "1: Set User Password Policy"
Write-Host "2: Set Users Passwords"
Write-Host "3: Disable User Accounts"
Write-host "4: Extra"
Write-host "5: Find a File"
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
        }'5'{ 
            cls  
        }'q'{
            
            }
        }
       start-sleep -milliseconds 150
       If($input -eq 'q')
       {
       ""
       ""
       ""
       ""
       $input = Read-host "Are You Sure?(Y/N)"
       If($input -eq 'y')
       {
       return
       }

       }
       If($input -eq '2')
      {
       $Password = Read-Host -assecurestring "Please type a password to use for users."
       cls
       do
      {
       Write-Host -fore Cyan "==========Set Up the User passwords=========="
       
       Show-User-Info
       
       $input = Read-Host "Please Select User you want changed"

       if($input -eq '0')
{
""
""
""
  $Local = Read-Host "Do you want to change the User's account settings?(Y/N)"
  If($local -eq 'y')
  {
  ""
  ""
  ""
  $ErrorActionPreference = 'silentlycontinue'
  Start(lusrmgr.msc)-ErrorAction SilentlyContinue
  pause
  }
    

    }
    else
    {   

       net user ($input) ($Password) | * [($env:computername)]
       ""
       ""
       ""
       Write-host -fore yellow "Done!"
       Start-Sleep -milliseconds 500
       Cls
      }
      }
        until($input -eq '0')
}

         If($input -eq '4')
    {
    #Just Having some fun
    Show-Team
    ""
    ""
    ""
    Write-host "      ========================================" -fore gray
    Write-host "      |                                      |" -fore gray
    Write-host "      |     =======               =======    |" -fore gray
    Write-host "      |     =     =               =     =    |" -fore gray
    Write-host "      |     =     =               =     =    |" -fore gray
    write-host "      |     =     =               =     =    |" -fore gray
    Write-host "      |     =======               =======    |" -fore gray
    write-host "      ========================================" -fore gray
    write-host "                     |        |               " -fore Darkgray
    write-host "                     |        |               " -fore Darkgray
    write-host "       ======================================" -fore gray
    write-host "       |                                    |" -fore gray
    write-host "       |                                    |" -fore gray
    Write-Host "       |                                    |" -fore gray
    Write-Host "       |                                    |" -fore gray
    Write-Host "       |                                    |" -fore gray
    Write-Host "       |                                    |" -fore gray
    Write-Host "       |                                    |" -fore gray
    Write-host "       |                                    |" -fore gray
    Write-Host "       |                                    |" -fore gray
    Write-host "               CyberPatriot 2018-2019        " -ForegroundColor Yellow
    write-host ""
    Write-host ""
    Write-Host ""
    Write-Host ""
    Start-sleep -seconds 2.5
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
 
 ""
 Net Accounts /LockoutDuration:30
 Write-host "Lockout Duration set to 30 minutes" -Fore green
 Start-sleep -milliseconds 300
 ""
 ""
 Net Accounts /Lockoutthreshold:6
 Write-host "lockout threshold set to 6" -Fore Green
 start-sleep -milliseconds 300

 #  Spaces to Distinguish the Different Sections of the Script

 Write-Host ""
 Write-Host ""
 write-host ""
 Write-host ""
 Start-sleep -Milliseconds 500
 Write-host ""
 $Security = Read-host "Would you like to change password complexity? (Y/N)"
 if($security = 'Y')
 {
 Start(Secpol.msc) -erroraction silentlycontinue
 }

 
 Write-Host "Done!" -ForegroundColor Yellow
 Start-sleep -milliseconds 500
 }   
 # Will Allow the Admin to Disable a User account of their choice
    If($input -eq '3')
   {
   do
   {
    Write-Host "========== Disabling User Accounts =========="
  
   Show-User-Info

   $input = Read-host "Please Choose which user you want disabled"
   Net User ($input) /Active:no
   start-sleep -Milliseconds 500
   cls
   
  }
  until($input -eq '0')
  
  If($input -eq '5')
  {
  $filename = Read-host "What file are you searching for?"
  $input = Read-host "are you sure? (this may take a few minutes)(Y/N)"
  if($input = 'y')
  {
  Get-Childitem ($filename) -path C:\ -recurse
  ""
  ""
  Write-host -fore yellow "done!"
  Pause
  }
  else
  {
  }
  }

   #End the Loop
    }
    }
 until ($input -eq 'y');

 
 