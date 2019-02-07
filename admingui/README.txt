the admin gui launcher is used to launch administrative tools as administrator. its intent is to aggregate commands to launch these tools behind a gui.

installation instructions:
run installer.bat. this puts all the contents of .\bin into c:\admingui\ and copies two shortcuts onto your desktop- one for running as /smartcard and one for running as administrator

usage instructions:
double-click the shortcut that pertains to you
the adminguilauncher shortcut will launch the admin gui launcher as /smartcard, so you then must pick your admin card and enter your pin
in the Open File - Security Warning dialog box, select Open
the adminguilauncher-nocard shortcut will launch the admin gui launcher as administrator
click "yes" on the uac prompt
in cmd window that opens, press "r" and hit enter

common errors:
'i enter in my pin, and the box just closes'
--verify you're using the right card and entering in your pin correctly.
'when i click on a button, it just puts a bunch of red text in the cmd window'
--you're probably running as a regular user, make sure to use your admin card. alternatively, you may not have that tool installed.
'when i close the cmd window, it closes out of the launcher'
--don't do that