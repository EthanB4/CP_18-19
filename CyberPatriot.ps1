clear-host

Function Show-Menu
{
    param (
        [string]$Title = 'CyberPatriot Menu')
cls
Write-Host -foregroundcolor red("========== $Title ==========")

Write-host "1: Set User Password Policy"
Write-Host "2: Set Users Passwords"
Write-Host "3: About"
Write-Host "Q:Press 'Q' to quit."
}

do
{
    Show-Menu
       $input = Read-Host "Please select one"
       Switch($input)
    {
        '1'{
            cls
            
        }'2'{
            cls
                'Please list the users you want changed'
        }'3'{
            cls
           
        }'q'{
            return
            }
        }
        pause
        If($input -eq '1')
 {
    Write-Host -foregroundcolor Green("========== Password Policy ==========")
 Net Accounts /MINPWLEN:8
 Read-Host ("Minimum Password Length set to '8'.")
 Net Accounts /MINPWAGE:15
 Read-Host ("Minimum Password Age set to '15'.")
 Net Accounts /MAXPWage:30
 Read-Host ("Maximum Password Age set to '30'.") 
 }
    If($input -eq '3')
   {;
    Write-Host -foregroundcolor Yellow("========== About CyberPatriot Menu ==========");
    Read-Host; "Tutorial for menu found at http://www.tomsitpro.com/articles/powershell-interactive-menu,2-961.html"
    Read-Host; "Scripts used are made by Ethan"
  
   }

    }
 until ($input -eq 'q'); until ($input -eq '1'); until ($input -eq '2')

 

