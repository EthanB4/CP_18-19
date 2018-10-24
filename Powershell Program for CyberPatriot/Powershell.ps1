cls

import-module Active Directory

Function PasswordForDomain{
    Param(
    [Parameter(Mandatory=$True)][string]$Password,
    [Parameter(Mandatory=$False)][string]$AccountSamAccountName = "",
    [parameter(Mandatory=$false)][string]$AccountDisplayName,
    [Microsoft.ActiveDirectory.Management.ADentity]$PasswordPolicy = (Get-ADDefaultDomainPasswordPolicy -ErrorAction SilentlyContir)
    )

    If($Password.Length -lt $PasswordPolicy.MinPasswordLength){
    Return $false
    }

    If(($AccountSamAccountName) -and ($Password-match "$AccountSamAccountName")){
    Return $False
    }

