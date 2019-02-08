<# This form was designed using POSHGUI.com, a free online gui designer for PowerShell
.NAME
    cioadmin
.SYNOPSIS
    will be launched as /smartcard to be able to launch various admin tools as administrator
#>

#functions
function run-cmd {
    start-process cmd -verb runas
    }
function run-aduc {
    start-process dsa -verb runas
    }
function run-sccm {
#need to find a better way than hard-coding locations. maybe look for the shortcut in start menu and see where it points?
    if (test-path "C:\Program Files (x86)\Microsoft Configuration Manager\AdminConsole\bin\") {
        start-process "C:\Program Files (x86)\Microsoft Configuration Manager\AdminConsole\bin\Microsoft.ConfigurationManagement.exe" -verb runas
        }
    elseif (test-path "C:\Program Files (x86)\SCCM\AdminConsole\bin\") {
        start-process "C:\Program Files (x86)\SCCM\AdminConsole\bin\Microsoft.ConfigurationManagement.exe" -verb runas
        }
    else {
        $buttontype = [system.windows.messageboxbutton]::OK
        $messageboxtitle = "SCCM Not Found"
        $Messageboxbody = "SCCM was not found on your system. Please verify it is installed, and contact SPC Masek to update the script."
        $MessageIcon = [System.Windows.MessageBoxImage]::Error
        [System.Windows.MessageBox]::Show($Messageboxbody,$MessageboxTitle,$ButtonType,$messageicon)
        #write-host "please contact SPC Masek about integrating your SCCM location into the script"
        }
    }
function run-posh {
    start-process powershell -verb runas
    }
#original path obfuscated, obviously won't work
function run-cacbullet {
    invoke-item -path "\\CACBULLETPATH\CaCBullet.hta"
    }
function run-printmgmt {
    start-process printmanagement -verb runas
    }
function run-dns {
    start-process dnsmgmt -verb runas
    }
function run-gpmc {
    start-process gpmc -verb runas
    }
function run-dhcp {
    start-process dhcpmgmt -verb runas
    }

#form

#drawing the form
Add-Type -AssemblyName system.Windows.Forms, System.drawing, presentationframework
[Windows.Forms.Application]::EnableVisualStyles()

#window
$CIOAdminConsole = New-Object Windows.Forms.Form
$CIOAdminConsole.Opacity = '.90'
$CIOAdminConsole.Size = '440,500'
$CIOAdminConsole.text = "CIO Admin Launcher"
$CIOAdminConsole.BackColor = "#4a4a4a"
$CIOAdminConsole.TopMost = $false
$CIOAdminConsole.icon = "c:\admingui\adminguiico2-1.ico"
$CIOAdminConsoleImage = [system.drawing.image]::FromFile("c:\admingui\adminguibg1.png")
$CIOAdminConsole.BackgroundImage = $CIOAdminConsoleImage

#instructions label
$instructions                    = New-Object system.Windows.Forms.Label
$instructions.BackColor          = "transparent"
$instructions.text               = "press a button to launch as administrator"
$instructions.AutoSize           = $true
$instructions.width              = 25
$instructions.height             = 10
$instructions.location           = New-Object System.Drawing.Point(20,16)
$instructions.Font               = 'Georgia,13'
$instructions.ForeColor          = "#ffffff"
$instructions.Parent = $CIOAdminConsole

#cmd button
$cmd = New-Object Windows.Forms.Button
$cmd.BackColor = "#000000"
$cmd.text = "cmd"
$cmd.width = 120
$cmd.height = 120
$cmd.location = New-Object System.Drawing.Point(16,56)
$cmd.Font = 'Georgia,10'
$cmd.ForeColor = "#ffffff"
$cmd.Parent = $CIOAdminConsole

#powershell button
$posh                            = New-Object Windows.Forms.Button
$posh.BackColor                  = "#000000"
$posh.text                       = "powershell"
$posh.width                      = 120
$posh.height                     = 120
$posh.location                   = New-Object System.Drawing.Point(152,56)
$posh.Font                       = 'Georgia,10'
$posh.ForeColor                  = "#ffffff"
$posh.Parent = $CIOAdminConsole

#active directory users and computers button
$dsa                             = New-Object Windows.Forms.Button
$dsa.BackColor                   = "#000000"
$dsa.text                        = "active directory"
$dsa.width                       = 120
$dsa.height                      = 120
$dsa.location                    = New-Object System.Drawing.Point(16,192)
$dsa.Font                        = 'Georgia,10'
$dsa.ForeColor                   = "#ffffff"
$dsa.Parent = $CIOAdminConsole

#sccm button
$sccm                            = New-Object Windows.Forms.Button
$sccm.BackColor                  = "#000000"
$sccm.text                       = "sccm"
$sccm.width                      = 120
$sccm.height                     = 120
$sccm.location                   = New-Object System.Drawing.Point(16,328)
$sccm.Font                       = 'Georgia,10'
$sccm.ForeColor                  = "#ffffff"
$sccm.Parent = $CIOAdminConsole

#dhcp button
$dhcp                            = New-Object Windows.Forms.Button
$dhcp.BackColor                  = "#000000"
$dhcp.text                       = "dhcp"
$dhcp.width                      = 120
$dhcp.height                     = 120
$dhcp.location                   = New-Object System.Drawing.Point(288,328)
$dhcp.Font                       = 'Georgia,10'
$dhcp.ForeColor                  = "#ffffff"
$dhcp.Parent = $CIOAdminConsole

#group policy button
$gpmc                            = New-Object Windows.Forms.Button
$gpmc.BackColor                  = "#000000"
$gpmc.text                       = "group policy"
$gpmc.width                      = 120
$gpmc.height                     = 120
$gpmc.location                   = New-Object System.Drawing.Point(288,192)
$gpmc.Font                       = 'Georgia,10'
$gpmc.ForeColor                  = "#ffffff"
$gpmc.Parent = $CIOAdminConsole

#dns button
$dns                             = New-Object Windows.Forms.Button
$dns.BackColor                   = "#000000"
$dns.text                        = "dns"
$dns.width                       = 120
$dns.height                      = 120
$dns.location                    = New-Object System.Drawing.Point(288,56)
$dns.Font                        = 'Georgia,10'
$dns.ForeColor                   = "#ffffff"
$dns.Parent = $CIOAdminConsole

#print server button
$printserver                     = New-Object Windows.Forms.Button
$printserver.BackColor           = "#000000"
$printserver.text                = "print server"
$printserver.width               = 120
$printserver.height              = 120
$printserver.location            = New-Object System.Drawing.Point(152,328)
$printserver.Font                = 'Georgia,10'
$printserver.ForeColor           = "#ffffff"
$printserver.Parent = $CIOAdminConsole

#cacbullet button
$cacbullet                       = New-Object Windows.Forms.Button
$cacbullet.BackColor             = "#000000"
$cacbullet.text                  = "cacbullet"
$cacbullet.width                 = 120
$cacbullet.height                = 120
$cacbullet.location              = New-Object System.Drawing.Point(152,192)
$cacbullet.Font                  = 'Georgia,10'
$cacbullet.ForeColor             = "#ffffff"
$cacbullet.Parent = $CIOAdminConsole


$CIOAdminConsole.controls.AddRange(@($instructions,$cmd,$posh,$dsa,$sccm,$Button1,$dhcp,$Button3,$Button4,$gpmc,$dns,$printserver,$cacbullet))

$cmd.Add_Click({ run-cmd })
$dsa.Add_Click({ run-aduc })
$sccm.Add_Click({ run-sccm })
$posh.Add_Click({ run-posh })
$cacbullet.Add_Click({ run-cacbullet })
$printserver.Add_Click({ run-printmgmt })
$dns.Add_Click({ run-dns })
$gpmc.Add_Click({ run-gpmc })
$dhcp.Add_Click({ run-dhcp })

[void]$CIOAdminConsole.ShowDialog()

# SIG # Begin signature block
# MIIFeQYJKoZIhvcNAQcCoIIFajCCBWYCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUNknVKDsS5HQZpcT2udzNbrwd
# P7WgggMQMIIDDDCCAfSgAwIBAgIQUMjY2l+/9JVLGAiXLtGKBzANBgkqhkiG9w0B
# AQsFADAeMRwwGgYDVQQDDBNqd21hc2VrcmUuZ2l0aHViLmlvMB4XDTE5MDIwNzE3
# MTMzN1oXDTIwMDIwNzE3MzMzN1owHjEcMBoGA1UEAwwTandtYXNla3JlLmdpdGh1
# Yi5pbzCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALXN+XHDeRbETLMQ
# d69LMm0b6zQCgEOn4yUkAo+le5dUkPIa8MNa1HcBNTKjuf9ycdiCtZK8Ga+GTvAX
# tJox3nanXhdAMFobQq9UYOLJuesMK7JZME7QX6NKiQrBrvEmEozWx/kmX3ZohLjQ
# w1r3MlZQYNIJ0buyFpmrW6uH5+scdZ+PGDU1Wn0t4PiDrVfLHSOYo11A/UY10rcJ
# Cb3+Oli1NP7zaPnVqFxiApAOxK0i5tMQqNy4JABYFPOcJuyrhszBQ5LVfIfvbv2W
# ACTZsiVSO+4zWCjCh2WbIyQgnl8lxFpID/SBtL8LlYwe5pnGfGUnK6egHuD8xorw
# w+rb2dECAwEAAaNGMEQwDgYDVR0PAQH/BAQDAgeAMBMGA1UdJQQMMAoGCCsGAQUF
# BwMDMB0GA1UdDgQWBBTBBeK/8HolrkL5cJRywFhgG24RvzANBgkqhkiG9w0BAQsF
# AAOCAQEAnKvP6aESZpfiN47Mh3JZDwdayhAyelp0BdX+SSiblhc4mQUZtJcmMvLA
# s7Yurut115ifoSknCBWKInpcbeVtiSRqKbHj0K7S+s6/LLt3Zf5AeIcmdWt2pFPl
# FamDZeizveHsEh4ra9VhcJNubV+SKG9nVueFbYlEEarg9+fI6pkyX5g80V+s2lcq
# rng/pattFcazn0OwtmCMxwBuJR0rYt/7O4EypLSNT1NMd2pbGnDkVUE2awS0RDQi
# ECXUvv560DTampy3fur5BBFGcQZrI2An7Esw0A+yFiye5oAYtMo4qUCcgFXQu4c+
# 1L0X5PlEbM2Rs8ETYDWUTLq0wv59pTGCAdMwggHPAgEBMDIwHjEcMBoGA1UEAwwT
# andtYXNla3JlLmdpdGh1Yi5pbwIQUMjY2l+/9JVLGAiXLtGKBzAJBgUrDgMCGgUA
# oHgwGAYKKwYBBAGCNwIBDDEKMAigAoAAoQKAADAZBgkqhkiG9w0BCQMxDAYKKwYB
# BAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAjBgkqhkiG9w0B
# CQQxFgQUjNuRVj1WLFgCaKgEIftdwi+TVM4wDQYJKoZIhvcNAQEBBQAEggEAftt0
# G5C6h4OFXVrR6G0z4I28sRAVxXMoPyh3U1djTGI7sEuRVJ/Od88UDWK6OgIEKsgL
# H+1ohbdwCEVy+z2J3Gca1O7dRB0zhyTLqI1sh+Lyl0+fs04uk7K2Wu0vDDCErLWF
# wYRKz+B9VxWDwbR/d+7lqJdFhe6D9uF7u7wTxLHssODyBU6gGTmBtcd7o38zqBDb
# WOFWnrpn8kSptSuh0mYGmnTrVHni5ECOuTGNZ63/6rvKN0nHo0zri5isqJxH/7v9
# VNGPlWeyEDjcsoL/hyNYwBCufcq9nZCJfSOvzCZePRw6prwvZg1AYQDbYkeL6WJs
# V6PO3PLahsX7krbaUA==
# SIG # End signature block
