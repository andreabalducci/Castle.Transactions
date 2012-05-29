@ECHO OFF

REM #region license

REM // Copyright 2009-2011 Henrik Feldt - http://logibit.se/
REM // 
REM // Licensed under the Apache License, Version 2.0 (the "License");
REM // you may not use this file except in compliance with the License.
REM // You may obtain a copy of the License at
REM // 
REM //      http://www.apache.org/licenses/LICENSE-2.0
REM // 
REM // Unless required by applicable law or agreed to in writing, software
REM // distributed under the License is distributed on an "AS IS" BASIS,
REM // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
REM // See the License for the specific language governing permissions and
REM // limitations under the License.

REM #endregion

echo Checking ruby version
ruby --version

IF %ERRORLEVEL% NEQ 0 GOTO install

:build
echo Performing build
rake
goto done

:done
exit /B 0

:install
tools\wget "http://rubyforge.org/frs/download.php/74298/rubyinstaller-1.9.2-p180.exe"
echo "installing ruby!"
rubyinstaller-1.9.2-p180.exe
SET ERRORLEVEL=0
GOTO build