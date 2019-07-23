<#
.NAME
    DCReporter
.SYNOPSIS
    consolidates common reports from a domain controller into a simple menu interface
.NOTES
    last updated:   20190223        fleshed out menus
    created:        20190209
    author:         Joshua Masek    josh.masek@joshuamasek.com
#>
function Test-Administrator  {  
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)  
}
function handle-invalid {
    $sel = 0
    write-host "invalid input"
}
#main menu
function read-menu {
    Clear-Host
    Write-Host "what would you like to do?" -ForegroundColor Cyan
    Write-host "0) set/update report directory" -ForegroundColor  Green
    Write-host "1) set/update FQDN of DC" -foregroundcolor Green
    Write-Host "2) set/update DA creds" -foregroundcolor Green
    Write-Host "3) run AD reports" -foregroundcolor Magenta
    Write-Host "4) run DNS reports" -ForegroundColor Magenta
    Write-Host "5) run DHCP reports" -ForegroundColor Magenta
    Write-Host "6) run print server reports" -ForegroundColor Magenta
    Write-Host "7) placeholder"
    Write-Host "x) exit" -ForegroundColor Yellow -BackgroundColor DarkGray
    $sel = read-host ">"
    if ($sel -eq 0) {
        $sel = 0
        update-dir
    }
    if ($sel -eq 1) {
        $sel = 0
        update-fqdn
    }
    elseif ($sel -eq 2) {
        $sel = 0
        update-creds
    }
    elseif ($sel -eq 3) {
        $sel = 0
        run-adreports
    }
    elseif ($sel -eq 4) {
        $sel = 0
        run-dnsreports
    }
    elseif ($sel -eq 5) {
        $sel = 0
        run-dhcpreports
    }
    elseif ($sel -eq 6) {
        $sel = 0
        run-printserverreports
    }

    elseif ($sel -eq "x") {
        Write-Host "see ya"
        exit
    }
    else {
        handle-invalid
        read-menu
    }
}
#-------------------------------------------------------------------------------------------------
#main menu options
function update-dir {
    Clear-Host
    Write-Host "provide report destination directory" -ForegroundColor Cyan
    $reportdestination = Read-Host ">"
    
    read-menu
}
function update-fqdn {
    Clear-Host
    write-host "provide fqdn of domain controller" -ForegroundColor Cyan
    $fqdn = Read-Host ">"
    read-menu
}
function update-creds {
    Clear-Host
    write-host "provide domain admin credentials for subject domain" -ForegroundColor cyan
    if (Test-Administrator -eq $true) {
        set-itemproperty "HKLM:\SOFTWARE\Microsoft\Powershell\1\ShellIds" ConsolePrompting True
        get-credential
        set-itemproperty "HKLM:\SOFTWARE\Microsoft\Powershell\1\ShellIds" ConsolePrompting False    
    }
    else {
        Get-Credential
    }
    read-menu
}
function run-adreports {
    Clear-Host
    write-host "which report would you like to run?" -ForegroundColor cyan
    write-host "1) full user dump" -ForegroundColor Green
    write-host "2) full computer dump" -foregroundcolor Green
    write-host "3) full group dump" -ForegroundColor Green
    write-host "4) full OU dump" -ForegroundColor Green
    write-host "5) full group policy dump" -ForegroundColor Green
    write-host "6) full group membership report" -ForegroundColor Green
    write-host "7) fine-tuned AD dumps" -ForegroundColor Magenta
    write-host "x) back to main menu" -ForegroundColor Yellow -BackgroundColor DarkGray
    $sel = read-host ">"
    if ($sel -eq 1) {
        $sel = 0
        run-userdump
    }
    elseif ($sel -eq 2) {
        $sel = 0
        run-computerdump
    }
    elseif ($sel -eq 3) {
        $sel = 0
        run-groupdump
    }
    elseif ($sel -eq 4) {
        $sel = 0
        run-oudump
    }
    elseif ($sel -eq 5) {
        $sel = 0
        run-gpdump
    }
    elseif ($sel -eq 6) {
        $sel = 0
        run-groupmemberdump
    }
    elseif ($sel -eq 7) {
        $sel = 0
        tune-adreports
    }
    elseif ($sel -eq "x") {
        $sel = 0
        read-menu
    }
    else {
        handle-invalid
        run-adreports
    }
}
function run-dnsreports {
    Clear-Host

    read-menu
}
function run-dhcpreports {
    Clear-Host

    read-menu
}
function run-printserverreports {
    Clear-Host

    read-menu
}
#-------------------------------------------------------------------------------------------------
#ad report menu options
function run-userdump {
    Clear-Host
    Get-ADUser -filter * -server $fqdn -credential $usrcred -properties * | export-csv $reportdestination
    run-adreports

}
function run-computerdump {
    Clear-Host

    run-adreports

}
function run-groupdump {
    Clear-Host

    run-adreports

}
function run-oudump {
    Clear-Host

    run-adreports

}
function run-gpdump {
    Clear-Host

    run-adreports

}
function run-groupmemberdump {
    Clear-Host

    run-adreports

}
function tune-adreports {
    Clear-Host
    
}
#-------------------------------------------------------------------------------------------------
#fine-tuned ad report options
read-menu

