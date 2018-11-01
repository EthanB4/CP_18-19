

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
$Thing = (Get-Random -InputObject "Red", "Yellow", "Blue", "Cyan", "White", "Magenta", "DarkCyan")
Write-host "                           /\                              " -fore ($Thing)
Write-host "                          /  \                             " -Fore ($Thing)
Write-host "                         /    \                            " -fore ($Thing)
Write-host "                        /      \                           " -fore ($Thing)
Write-host "                       /        \                          " -fore ($Thing)
Write-host "                      /          \                         " -fore ($Thing)
Write-host "                     /            \                        " -fore ($Thing)
write-host "                    /______________\                       " -fore ($Thing)
Write-host "                   / \            / \                      " -fore ($Thing)
write-host "                  /   \          /   \                     " -fore ($Thing)
write-host "                 /     \        /     \                    " -fore ($Thing)
Write-host "                /       \      /       \                   " -fore ($Thing)
write-host "               /         \    /         \                  " -fore ($Thing)
Write-host "              /           \  /           \                 " -fore ($Thing)
Write-host "             /             \/             \                " -fore ($Thing)
Write-host "            /______________________________\               " -fore ($Thing)
write-host "                CyberPatriot 2018-2019                     " -fore gray
Write-host ""
Start-sleep -milliseconds 1000
clear-host

Function Show-Team
{
Write-host "             ___     ____         ___      " -fore red
Write-host "            /   |   /    \       /   |     " -fore red
Write-host "           / /| |  |  /\  |     / /| |     " -fore red
Write-host "          / / | |  | |  | |    / / | |     " -fore red
Write-host "         / /  | |  | |  | |   / /  | |     " -fore red
Write-host "        / /___| |  | |  | |  / /___| |     " -fore red
Write-host "       /______| |  | |  | | /______| |     " -fore red
Write-host "              | |  |  \/  |        | |     " -fore red
Write-host "              |_|   \____/         |_|     " -fore red
} 
Function Show-User-Info
{

Get-localUser | out-file C:\Users.txt
Get-Content C:\Users.txt

}
# Generate the Menu that will be used to choose between scripts
Function Show-Menu
{
    param (
        [string]$Title = 'Team 404 Menu' )
cls
Write-Host -fore Red ("========== $Title ==========")

Write-host "1: Set Password Policy and Audit Policy"
Write-Host "2: Set Users Passwords"
Write-Host "3: Disable User Accounts"
Write-host "4: Find a File"
Write-host "5: Give me a random number"
Write-Host "Q:Press 'Q' to quit."
""
$Random = Get-Random -InputObject "Red", "Yellow", "Blue", "Cyan", "White", "DarkGreen", "DarkBlue", "DarkRed", "DarkCyan"
$Text = Get-Random -InputObject "This is for CybperPatriot 2018-2019", "Beep Boop", "This version is for Windows 10 and Server 2016", "I don't know what to put here, but...", "AKSJHfslkhsakdhglakshdg", "This is for CybperPatriot 2018-2019", "Beep Boop", "This version is for Windows 10 and Server 2016", "I don't know what to put here, but...", "AKSJHfslkhsakdhglakshdg", "This is for CybperPatriot 2018-2019", "Beep Boop", "This version is for Windows 10 and Server 2016", "I don't know what to put here, but...", "AKSJHfslkhsakdhglakshdg", "This is for CybperPatriot 2018-2019", "Beep Boop", "This version is for Windows 10 and Server 2016", "I don't know what to put here, but...", "AKSJHfslkhsakdhglakshdg", "This is for CybperPatriot 2018-2019", "Beep Boop", "This version is for Windows 10 and Server 2016", "I don't know what to put here, but...", "AKSJHfslkhsakdhglakshdg", "404", "The", "Secret", "Code", "Is"
Write-Host "$Text" -Fore ($Random)
}

do
{
# Generate the options for choices in the Main Menu
    Show-Menu
    ""
    ""
       $input = Read-Host "Please select one"
       Switch($input)
    {
        '1'{
            cls
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

 # Configure the Password Policy, Account Lockout and Audit Policy
 write-Host ("Configuring Password History, Complexity, the Lockout Policy and the Audit Policy.") -ForegroundColor cyan
 write-host ""
 secedit /export /cfg c:\secpol.cfg
 (gc C:\secpol.cfg).replace("PasswordComplexity = 0", "PasswordComplexity = 1") | Out-File C:\secpol.cfg; (gc C:\secpol.cfg).replace("LockoutBadCount = 0", "LockoutBadCount = 6")  | Out-File C:\secpol.cfg; (gc C:\secpol.cfg).replace("PasswordHistorySize = 0", "PasswordHistorySize = 5") | Out-File C:\secpol.cfg; (gc C:\secpol.cfg).replace("EnableGuestAccount = 1", "EnableGuestAccount = 0") | Out-File C:\Secpol.cfg; (gc C:\secpol.cfg).replace("EnableAdminAccount = 1", "EnableAdminAccount = 0") | Out-File C:\Secpol.cfg; (gc C:\secpol.cfg).replace("AuditLogonEvents = 0", "AuditLogonEvents = 3") | Out-File C:\Secpol.cfg; (gc C:\secpol.cfg).replace("AuditPolicyChange = 0", "AuditPolicyChange = 1") | Out-File C:\Secpol.cfg; (gc C:\secpol.cfg).replace("AuditAccountManage = 0", "AuditAccountManage = 1") | Out-File C:\Secpol.cfg; (gc C:\secpol.cfg).replace("AuditDSAccess = 0", "AuditDSAccess = 1") | Out-File C:\Secpol.cfg; (gc C:\secpol.cfg).replace("AuditAccountLogon = 0", "AuditAccountLogon = 1") | Out-File C:\Secpol.cfg; (gc C:\secpol.cfg).replace("MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DontDisplayLastUserName=4,0", "MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DontDisplayLastUserName=4,1") | Out-File C:\Secpol.cfg; (gc C:\secpol.cfg).replace("MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableCAD=4,1", "MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\DisableCAD=4,0") | Out-File C:\secpol.cfg; 
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
 Write-host ""
 Write-Host "Audit Account Logon Events set to 'Success'" -Fore Green
 Start-sleep -Milliseconds 500
 write-host ""
 Write-host ""
 Write-Host "Audit Account Managment set to 'Success'" -Fore Green
 Start-Sleep -Milliseconds 500
 Write-Host ""
 Write-Host ""
 Write-Host "Audit Directory Service Access set to 'Success'" -Fore Green
 Start-sleep -Milliseconds 500
 Write-host ""
 Write-host ""
 Write-Host "Audit Logon Events set to 'Success,Failure'" -Fore Green
 Start-sleep -Milliseconds 500
 write-host ""
 write-host ""
 Write-Host "Audit Policy Change set to 'Success'" -Fore Green
 Start-sleep -Milliseconds 500
 write-host ""
 write-host ""
 Write-host "Interactive Logon: Disable CTRL+ALT+DEL set to 'Disabled' (IF IT WAS TURNED ON!)" -fore Green
 start-sleep -Milliseconds 500
 Write-Host ""
 Write-Host ""
 Write-host "Interactive Logon: Don't Display Last User Signed in to 'Enabled'" -Fore Green
 start-sleep -Milliseconds 500
 Write-Host ""
 Write-Host ""


 
 Write-Host "Done!" -ForegroundColor Yellow
 Read-Host "Press'enter' to continue"
            
        }'2'{
            cls
       $Password = Read-Host -assecurestring "Please type a password to use for users."
       cls
       do
      {
       Write-Host -fore Cyan "==========Set Up the User passwords=========="
       
       Show-User-Info
       
       $input = Read-Host "Please select user you want changed ('0' to exit)"

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
       
       

       $UserAccount = Get-localUser -name ($input) -ErrorAction SilentlyContinue
       $UserAccount | Set-LocalUser -Password $Password -ErrorAction SilentlyContinue
       ""
       ""
       ""
       Write-host -fore yellow "Done!"
       Start-Sleep -milliseconds 500
       Cls
      
      }
        until($input -eq '0')

        }'3'{
            cls
             do
   {
    Write-Host "========== Disabling User Accounts =========="
  
   Show-User-Info

  

   $input = Read-host "Please choose which user you want disabled ('0' to exit)"
   Disable-LocalUser ($input) -Confirm -ErrorAction SilentlyContinue
   start-sleep -Milliseconds 500
   cls
  }
  until($input -eq '0')

        }'4'{
            cls
               do
   {
  $Filetype = Read-host "What type of file are you looking for? Extension or File W/ Extension (E/F)"

  if(($Filetype -ne 'E') -and ($filetype -ne 'F'))
  {
  Write-Warning "$Filetype is not a choice, please choose (E) or (F)"
  pause
  $Confirm = "Are you finished looking? (Y/N)"
  }
  if($Filetype -eq 'f')
  {
  ""
  ""
  $Filename = Read-host "What is the name of the file? ((Filename).(Extension))"
  if(($Filename -ne '') -and ($Filetype -eq 'f'))
  {
  gci ($Filename) -path C:\Users -force -recurse  -erroraction silentlycontinue
  ""
  ""
  ""
  $End = Read-host "Are you finished looking?(Y/N)"
  }
  else
  {
  write-warning "Filename cannot be empty, please put something"
  pause
  }
  }
  If($Filetype -eq 'E')
         {
  ""
  ""
  $Filename = Read-host "What Extension are you looking for (*.(Extension Here))"
   If($Filename -eq '')
  {
  write-warning "extension cannot be empty, please put an extension."
  pause
  }
  If($Filename -eq '*.txt')
  {
  $Confirm = Read-host "are your sure? Txt has A LOT OF FILES!(Y/N)"
  if($Confirm -eq 'y')
     {
   gci ($Filename) -path C:\Users -force -recurse -erroraction SilentlyContinue
   $End = Read-host "Are you finished looking? (Y/N)"
     }
         }
If(($Filename -ne '') -and ($FileType -eq 'E'))  
               {
   gci ($Filename) -path C:\Users -force -recurse -erroraction SilentlyContinue
   ""
   ""
   ""
    $End = Read-host "Are you finished looking?(Y/N)"
               }
  }
  ""
  ""
  cls
  } 
  until($End -eq 'y')
        }'404'{
            cls
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

        }'5'{
        do
          {
          cls
        $Number1 = Read-Host "What is the minimum number you want?"
        if($Number1 -eq '')
        {
        Write-Host -NoNewline "WARNING: This field cannot be blank" -fore yellow 
        Read-Host " "
        }
        if($Number1 -ne '')
        {
        $Number2 = Read-Host "What is the maximum number you want?"
          if($Number2 -eq '')
        {
        Write-Host -NoNewline "WARNING: This field cannot be blank" -fore Yellow 
        Read-host " "
        }
        }
        if(($Number1 -ne '') -and ($Number2 -ne ''))
        {
        $Value1 = $Number1 -as [Double]
        $Value2 = $Number2 -as [Double]
        $ok = ($Value1 -ne $NULL) -and ($Value2 -ne $NULL)
        if ($ok){
        ""
        ""
        Write-host "Here is your number!" -fore Cyan
        Get-random -Minimum ($Number1) -Maximum ($Number2)
        pause
        }
        else 
        {
        Write-Warning "Please input numbers only"
        (start-sleep -Milliseconds 2500)
        }
        }
           }
        until ($ok)
        }'q'{
             ""
       ""
       $input = Read-host "Are You Sure?(Y/N)"
       If($input -eq 'y')
       {
       $Random = Get-Random -InputObject "Red", "Yellow", "Blue", "Cyan", "White", "DarkGreen", "DarkBlue", "DarkRed", "DarkCyan"
       ""
       ""
       Write-Host "Goodbye" -Fore ($Random)
       Start-sleep -milliseconds 2500
       return
       }
  
    }
        }
        start-sleep -milliseconds 15
    If(($input -ne '1') -and ($input -ne '2') -and ($input -ne '3') -and ($input -ne '4') -and ($input -ne '404') -and ($input -ne '0') -and ($input -ne '5'))
    {
    ""
    ""
    Write-Warning "$input is not one of the listed choices, please input a valid choice."
    pause
    }
  #End the Loop
    }
 until ($input -eq 'y');

 
 