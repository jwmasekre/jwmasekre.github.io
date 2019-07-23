<#
.NAME
    sec-ren
.SYNOPSIS
    renames a target machine
.NOTES
    Updated: 2019-05-10        Added Ads
    Release Date: 2019-03-08

  Author: SPC Joshua Masek - joshua.w.masek.mil@mail.mil
#>

#functions
function rename-machine {
    Write-Host "Please input the current name of the machine you'd like to rename." -ForegroundColor Magenta
    Write-Host ""
    $oldmachine = Read-Host ">"
    Write-Host ""
    Write-Host "And now please input the new name for the machine." -ForegroundColor Magenta
    Write-Host ""
    $newmachine = Read-Host ">"
    Write-Host ""
    Write-Host "Please wait while we rename the computer to your desired name..." -ForegroundColor Green
    Write-Host ""
    rename-computer -ComputerName $oldmachine -NewName $newmachine -DomainCredential $admincreds
    ask-reboot
}

function ask-reboot {
    Write-Host "Would you like to force a reboot of the newly-renamed machine?" -ForegroundColor Magenta
    Write-Host ""
    $answer = Read-Host ">"
    Write-Host ""
    If ($answer -like 'y*') {
        Write-Host "Absolutely, forcing a reboot!" -ForegroundColor Cyan
        Restart-Computer -force -computername $oldmachine
        ask-rename
        }
    Elseif ($answer -like 'n*') {
    	Write-Host "Understood!"
    	ask-rename
        }
    Else {
        Write-Host "We did not understand your input."
        ask-reboot
}

function ask-rename {
	Write-Host "Would you like to image another machine?"
    Write-Host ""
    $answer = Read-Host ">"
    Write-Host ""
    If ($answer -like 'y*') {
    	rename-machine
    }
    Elseif ($answer -like 'n*') {
    	Write-Host "Absolutely, we hope you've enjoyed your time using SEC-REN."
        Write-Host "Please consider SEC-REN for all your computer renaming needs in the future!"
        exit
        }
    Else {
        Write-Host "We did not understand your input."
        ask-rename
    }
}

function display-menu {

    Write-Host ""
    Write-Host '  `odNMMMNm/  `yNNNNNNNy     :sdmMMMMNy           :mNNNmmmmh+`   /NNNNNNNm` .hNNNy`    .dNm-  ####      ####     ' -ForegroundColor DarkRed
    Write-Host ' `mMMMo..-/:   oMMMd-://   -mMMMs:..-/+           `NMMM//dMMMm`  .MMMM/-:+`  /MMMMN/    yMd   #### #### #### ####' -ForegroundColor DarkRed
    Write-Host ' .MMMMd+-      oMMMd      -NMMM/                  `NMMM. /MMMN`  `MMMM.      :MMMMMMh.  yMh   #### #### #### ####' -ForegroundColor DarkRed
    Write-Host '  /mMMMMMNh:   oMMMMNNd   yMMMN`                  `NMMM/+NMms.   `MMMMNNN:   :MM/dMMMN/ yMh   #### #### #### ####' -ForegroundColor DarkRed
    Write-Host '    -ohNMMMMh  oMMMd--/   sMMMM.          .yyyyo  `NMMMdMMMh`    `MMMM/-:.   :MM. +NMMMhhMh   #### #### #### ####' -ForegroundColor DarkRed
    Write-Host ' `     `+MMMM. oMMMd      .mMMMd`        .ssoo+`  `NMMM-yMMMm-   `MMMM.      :MM.  .dMMMMMh   #### #### #### ####' -ForegroundColor DarkRed
    Write-Host ' .my+/:/hMMMs  oMMMNo++oy: `sNMMNy+///oh/         `MMMM- sMMMN+  .MMMMs+++ss :MM-    +NMMMh   #### #### #### ####' -ForegroundColor DarkRed
    Write-Host '  /ydmmmdho-  `shhhhhhhhy    `/shdmmmdho          :hhhh/  :yhhho`/hhhhhhhhh- shh+      :sdy        ####      ####' -ForegroundColor DarkRed
    Write-Host ""
    Write-Host "Welcome to the new, more secure computer renaming script, called SEC-REN!" -ForegroundColor Cyan
    Write-Host "We're glad to have you here, and proud to serve secure service." -ForegroundColor Cyan
    Write-Host "To begin, we'll need your admin credentials." -ForegroundColor Cyan
    Write-Host ""
    $admincreds = Get-Credential -Message "Please select your ASCL from the list."
    Write-Host "Thank you!" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "While we authenticate your account, please observe this brief message from our sponsor."
    run-advert
}

function run-advert {
	#pick a random ad
	
	#doc wagon
    Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host "                                                                                  ++++`                                                          " -ForegroundColor Magenta
    Write-Host "                                                                             :.  `MMMM.  `:                                                      " -ForegroundColor Magenta
    Write-Host "`:::::::-   `::::::::   .::::::::         `::   .:::::.  :::::-   .:::::::-  sN+``MMMM.`+Nh  ---:----`     .-----`   --------`   ------  .-----` " -ForegroundColor Magenta
    Write-Host ".yyyymMd.   :MNyyhMMm   +MNyyyhMM   /h-   -MN   oMmyyyo//yyyhMd   oMmyyydMm  sMMm/NMMM+dMMy  yhhhdMM+    ::shhhhh:  `MMhhhhMM/   MMhhhh::shhhNM+ " -ForegroundColor Magenta
    Write-Host "     yMs    :Md :dNo`   +Mh   :MM   /Mm   -MN   oMy   /Mm   .Md   oMo   +Mm  `sNMMddMMMMNy.      :MN     NMdy:      `MM`   mM/   MM`   MM:   hM+ " -ForegroundColor Magenta
    Write-Host "     yMs    :MmhNy.     +MNyyyhMN   /Mm   -MN   oMy   /Mm   .Md   oMmyyydMm    -yMMNMMMh-        :MN     NMs/.      `MMysssNM/   MM`   MM:   hM+ " -ForegroundColor Magenta
    Write-Host "     yMs    :MMd:  ``   +Mm+++sMN   /Mm   -MN   oMy   /Mm   .Md   oMh+++yMm     `hMMMMd.         :MN     NM/   -/.  `MMooooNM/   MM`   MM:   hM+ " -ForegroundColor Magenta
    Write-Host "     yMs    :MMo` `dd   +Mh   :MM   /Mm   -MN   oMy   /Mm   .Md   oMo   +Mm    /dMMMMMMm/        :MN     NM/   hM/  `MM`   mM/   MM`   MM:   hM+ " -ForegroundColor Magenta
    Write-Host "     yMs    :MNmms-MM   +Mh   :MM   /Mm   -MN   oMy   /Mm   .Md   oMo   +Mm  .hMMMMMMMMMMd-      :MN     NM/   hM/  `MM`   mM/   MM`   MM:   hM+ " -ForegroundColor Magenta
    Write-Host "     yMs    :Md`/dNMM   +Mh   :MM   /MN+++sMN   oMy   /Mm   .Md   oMo   +Mm  sMMh:MMMM:yMMh      :MN     NMy+++mM/  `MM`   mM/   MM`   MM:   hM+ " -ForegroundColor Magenta
    Write-Host "     /o:    .o+  `:oo   -o/   .oo   -oooooooo   -o/   -o+   `o+   :o:   -o+  sd: `MMMM. :dh      -ss     ssssssss-   ss`   os-   ss`   ss.   +s- " -ForegroundColor Magenta
    Write-Host "                                                                             -`  `MMMM.   -                                                      " -ForegroundColor Magenta
    Write-Host "                                                                                  osoo`    "
    Write-Host ""

	#sprunk
	Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host "      `-/+osssssso+/:-`                                                                                                           " -ForegroundColor Green
	Write-Host "    :+dNMMMMMMo/oyhNMMM-                                                                                                          " -ForegroundColor Green
	Write-Host "    y+NMMMMMMM/` `+syds                                                                                                           " -ForegroundColor Green
	Write-Host "    .sshNMMMMMMd+.      /-yyhhyyyy+.:+ooso+-`  .`-......` ````   .`      `                             `.----...`                 " -ForegroundColor Green
	Write-Host "      ./shmNMMMMMNy:`   `.soNMMMMMMmhhdNMMMMms-s+hdMMMNNm+sdmNhy:yyhhhhys`  +.oo+++- -.::----.``.....` `-:hsMMMNh`                " -ForegroundColor Green
	Write-Host "         -+yhmMMMMMMd/`   y+NMMMMMN- `:oNMMMMMd` N/MMMMMMmddyhy/.+shMMMMM/  y/NMMMMm`//hsMMMMMyhhddNNmh+` oyhMMMMy+ohhyo+.        " -ForegroundColor Green
	Write-Host " .+odh-    `+hsMMMMMMMd`  d/MMMMMMs    ohMMMMMN. d/MMMMMMh       `N+MMMMMd  somMMMMM+  oyhMMMMMo`osdMMMMh  homMMMMdmMMd/-`        " -ForegroundColor Green
	Write-Host " +yhMMNs-`  .doMMMMMMMM-  m/MMMMMMd   `+NMMMMm/  s+mMMMMMh        homMMMMMs+dhNNMMMMN---m+NMMMMh `d+NMMMMs//d+NMMMNooydNNmh+. .`` " -ForegroundColor Green
	Write-Host " :ssmNNNNmddmNMMMMMNds:   N/MMMMMMMdsoymMNdy/`   +yhMMMMMN        .ysmNMMMMNmydsNMNmhy+-:hsNmNmd. .s+hhyo/-.-o+oso/.``.-/:-.` ``` " -ForegroundColor Green
	Write-Host "  ``.-:/++++ooo+/:-.`    `M/MMMMMMdyys+/-.`      .+/oo/++:          .-////:.` .-:-.`     .`.`.``    ``                            " -ForegroundColor Green
	Write-Host "                         .N+MMMMMMs                                                                                               " -ForegroundColor Green
	Write-Host "                         :moMMMMMMm+/                                                                                             " -ForegroundColor Green
	Write-Host "                         .s+yyyyssss/" -ForegroundColor Green
    Write-Host ""

    #joja
	Write-Host ""
    Write-Host ""
    Write-Host ""
    Write-Host "    +hhhhhhhh/                `hhh:                          :dd`      od`                                    -dddddo-dd-          sy                 " -ForegroundColor Cyan
    Write-Host "    +dddddMNd+                `ddd/                          -Nd.      yN`                                    :MmNdMy:mm:          ss                 " -ForegroundColor Cyan
    Write-Host "         -My                                                  s.                                              .+`h /: /+                              " -ForegroundColor Cyan
    Write-Host "         -My    `ooooo+       `ooo-   /oooo/                  o.  /++. :+  /+++`        -+/`++. :+/ -            h    /h++`  /+++. :/ `++`-+/  +++`   " -ForegroundColor Cyan
    Write-Host "         -My   odMMMMMNd-     `MMM+ /dNMMMMNd+                s. +NNNh.yM` mMNNh.       sMm.NM/oNMNss            h    /MNNs` mMNNh yd -MM-oMm`sNNMy`  " -ForegroundColor Cyan
    Write-Host "  .///`  -Mo   ym     `M:       -M+ oM.    .Ms                s. h   // y` .s  o:        d  .s os//:`            h    /+  y. .s /m` s  :o  h `h  +M.  " -ForegroundColor Cyan
    Write-Host "  oMMM.  -Mo   ym      M:       -M+ oM.    .Ms             :. s. h   // y` `o  o:        h  .s  ohhh.            h    /+  y. .s     o  ./`.+ `m++oo`  " -ForegroundColor Cyan
    Write-Host "  sMMMsooyMo   yNooooosM:       -M+ oMyoooosMdo-     /+:  `Mh/h. d///s/-d/ +d-.ho        d+/oh.-sssys`/`        -d/  .sy..d/ +h.   :d:  o+d- `d////`:-" -ForegroundColor Cyan
    Write-Host "  `-hNNNNd-`   .:NNNNNd-`  sh   -M+ `-hNNNNh-/N/     hms   :MMs` .mMMo yMd NMooMN`       -md+M///hMm`.M:        oMN  /MM/sMm mM+   hMh  odN-  /MMM+ ms" -ForegroundColor Cyan
    Write-Host "                           sdNMMNd/                                           `--                                                         `           " -ForegroundColor Cyan
    Write-Host "                             sss/                                                                                                                     " -ForegroundColor Cyan
    Write-Host "                       +Nh          mN:                                                                                                               " -ForegroundColor Cyan
    Write-Host "                       `..hhhhhhhhhh..`                                                                                                               " -ForegroundColor Cyan
    Write-Host "                          //////////    " -ForegroundColor Cyan
    Write-Host ""
}

function test-creds {
	#test if creds belong to proper domain group
	rename-machine
}
#starts script
display-menu