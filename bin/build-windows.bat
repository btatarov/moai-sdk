@echo off
setlocal enableextensions

call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars64.bat"

where lib || echo "Could not find lib.exe (are you in your VS developer tools prompt?)" && exit /b 1

pushd .
echo "Building SDL"
cd %~dp0%\..\3rdparty\sdl2-2.28.5
call build\build-windows.bat || echo "Could not build SDL" && exit /b 1
popd

set generator=Visual Studio 17

cd %~dp0%..
set rootpath=%cd%
set defaultprefix=%rootpath%\lib\windows\vs2022
set libprefix=%2
if "%libprefix%"=="" set libprefix=%defaultprefix%

mkdir "build\build-vs2022"
cd "build\build-vs2022"

echo Creating Release Libs
cmake -G "%generator%" ^
-DBUILD_WINDOWS=true ^
-DMOAI_SDL=true ^
-DMOAI_HTTP_CLIENT=true ^
-DMOAI_HTTP_SERVER=true ^
-DMOAI_CRYPTO=true ^
-DMOAI_LIBCRYPTO=true ^
-DCMAKE_INSTALL_PREFIX=%libprefix%\Release ^
%rootpath%\cmake\hosts\host-win-sdl || exit /b 1

cmake --build . --target INSTALL --config Release -- -maxcpucount:12 || exit /b 1

erase libmoai\third-party\luajit\luajit\src\lua51.lib

rem echo Creating Debug Libs
rem cmake -DCMAKE_INSTALL_PREFIX=%libprefix%\Debug %rootpath%\cmake\hosts\host-win-sdl || exit /b 1

rem if "%CI%"=="TRUE" goto skipdebug
rem cmake --build . --target INSTALL --config Debug  || exit /b 1

rem :skipdebug
echo Creating Distribute Libs
rmdir /S/Q %libprefix%\Distribute\lib

md %libprefix%\Distribute\lib
lib /OUT:%libprefix%\Distribute\lib\moai.LIB %libprefix%\Release\lib\*.lib || exit /b 1

rem lib /OUT:%libprefix%\Distribute\lib\moai_d.LIB %libprefix%\Debug\lib\*.lib || exit /b 1
xcopy /S/I/Y %libprefix%\Release\include %libprefix%\Distribute\include  || exit /b 1
mkdir %libprefix%\Distribute\bin
copy /Y %libprefix%\Release\bin\moai.exe %libprefix%\Distribute\bin\moai.exe

rd /S/Q %libprefix%\Release
rem rd /S/Q %libprefix%\Debug

echo "Build complete"
