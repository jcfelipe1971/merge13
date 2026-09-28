@echo off
call "C:\Program Files (x86)\Embarcadero\Studio\37.0\bin\rsvars.bat"
if not exist _dcu mkdir _dcu
if not exist _exe mkdir _exe
dcc32 -B -Q -DDEBUG;PYTHON;PYTHONVER311;SKIA -NSSystem;Xml;Data;Datasnap;Web;Soap;Vcl;Vcl.Imaging;Vcl.Touch;Vcl.Samples;Vcl.Shell;Winapi;System.Win;Data.Win;Datasnap.Win;Web.Win;Soap.Win;Xml.Win -UUtilidades;Utilidades\FR;Utilidades\Estilos -N0_dcu -E_exe Merge13.dpr > compilacion.log 2>&1
findstr /C:") Error" /C:"Fatal" compilacion.log
if errorlevel 1 echo Compilado sin errores: _exe\Merge13.exe
