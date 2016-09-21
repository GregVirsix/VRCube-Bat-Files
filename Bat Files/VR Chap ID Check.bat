@ECHO OFF

CD "C:\Program Files (x86)\Steam\config"

SET id="1468542198"

SET vrchap="C:\Program Files (x86)\Steam\config\chaperone_info.vrchap"

SET json="C:\Program Files (x86)\Steam\config\lighthouse\lighthousedb.json"

SET backup=".backup"

FIND %id% %vrchap% 2>nul
echo.

IF %ERRORLEVEL% == 0 (
echo LOG: chaperone_info.vrchap ID is CORRECT.
) ELSE (
echo LOG: chaperone_info.vrchap ID is INCORRECT. Replacing with backup.
COPY %vrchap%%backup% %vrchap%
)

FIND %id% %json% 3>nul
echo.

IF %ERRORLEVEL% == 0 (
echo LOG: lighthousedb.json ID is CORRECT.
) ELSE (
echo LOG: lighthousedb.json ID is INCORRECT. Replacing with backup.
COPY %json%%backup% %json%
)

TIMEOUT /t 08

EXIT