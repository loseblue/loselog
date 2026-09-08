echo %LOSELOG_QT%
echo %LOSELOG_QT_DIR%

md %LOSELOG_WORKSPACE%\release

echo "Copying loselog binaries..."
xcopy %LOSELOG_WORKSPACE%\%LOSELOG_BUILD_ROOT%\output\loselog_portable.exe %LOSELOG_WORKSPACE%\release\ /y
xcopy %LOSELOG_WORKSPACE%\%LOSELOG_BUILD_ROOT%\output\loselog_portable.pdb %LOSELOG_WORKSPACE%\release\ /y
xcopy %LOSELOG_WORKSPACE%\%LOSELOG_BUILD_ROOT%\output\loselog.exe %LOSELOG_WORKSPACE%\release\ /y
xcopy %LOSELOG_WORKSPACE%\%LOSELOG_BUILD_ROOT%\output\loselog.pdb %LOSELOG_WORKSPACE%\release\ /y

xcopy %LOSELOG_WORKSPACE%\%LOSELOG_BUILD_ROOT%\output\loselog_crashpad_handler.exe %LOSELOG_WORKSPACE%\release\ /y
xcopy %LOSELOG_WORKSPACE%\%LOSELOG_BUILD_ROOT%\output\loselog_minidump_dump.exe %LOSELOG_WORKSPACE%\release\ /y

xcopy %LOSELOG_WORKSPACE%\%LOSELOG_BUILD_ROOT%\msvc_19.41_cxx17_64_md_relwithdebinfo\tbb12.dll %LOSELOG_WORKSPACE%\release\ /y
xcopy %LOSELOG_WORKSPACE%\%LOSELOG_BUILD_ROOT%\msvc_19.41_cxx17_64_md_relwithdebinfo\tbb12.pdb %LOSELOG_WORKSPACE%\release\ /y
xcopy %LOSELOG_WORKSPACE%\%LOSELOG_BUILD_ROOT%\msvc_19.41_cxx17_32_md_relwithdebinfo\tbb12.dll %LOSELOG_WORKSPACE%\release\ /y
xcopy %LOSELOG_WORKSPACE%\%LOSELOG_BUILD_ROOT%\msvc_19.41_cxx17_32_md_relwithdebinfo\tbb12.pdb %LOSELOG_WORKSPACE%\release\ /y

xcopy %LOSELOG_WORKSPACE%\%LOSELOG_BUILD_ROOT%\msvc_19.42_cxx17_64_md_relwithdebinfo\tbb12.dll %LOSELOG_WORKSPACE%\release\ /y
xcopy %LOSELOG_WORKSPACE%\%LOSELOG_BUILD_ROOT%\msvc_19.42_cxx17_64_md_relwithdebinfo\tbb12.pdb %LOSELOG_WORKSPACE%\release\ /y
xcopy %LOSELOG_WORKSPACE%\%LOSELOG_BUILD_ROOT%\msvc_19.42_cxx17_32_md_relwithdebinfo\tbb12.dll %LOSELOG_WORKSPACE%\release\ /y
xcopy %LOSELOG_WORKSPACE%\%LOSELOG_BUILD_ROOT%\msvc_19.42_cxx17_32_md_relwithdebinfo\tbb12.pdb %LOSELOG_WORKSPACE%\release\ /y

xcopy %LOSELOG_WORKSPACE%\%LOSELOG_BUILD_ROOT%\generated\documentation.html %LOSELOG_WORKSPACE%\release\ /y
xcopy %LOSELOG_WORKSPACE%\COPYING %LOSELOG_WORKSPACE%\release\ /y
xcopy %LOSELOG_WORKSPACE%\NOTICE %LOSELOG_WORKSPACE%\release\ /y
xcopy %LOSELOG_WORKSPACE%\README.md %LOSELOG_WORKSPACE%\release\ /y
xcopy %LOSELOG_WORKSPACE%\DOCUMENTATION.md %LOSELOG_WORKSPACE%\release\ /y

echo "Copying vc runtime..."
xcopy "%VCToolsRedistDir%%platform%\Microsoft.VC143.CRT\msvcp140.dll" %LOSELOG_WORKSPACE%\release\ /y
xcopy "%VCToolsRedistDir%%platform%\Microsoft.VC143.CRT\msvcp140_1.dll" %LOSELOG_WORKSPACE%\release\ /y
xcopy "%VCToolsRedistDir%%platform%\Microsoft.VC143.CRT\msvcp140_2.dll" %LOSELOG_WORKSPACE%\release\ /y
xcopy "%VCToolsRedistDir%%platform%\Microsoft.VC143.CRT\vcruntime140.dll" %LOSELOG_WORKSPACE%\release\ /y
xcopy "%VCToolsRedistDir%%platform%\Microsoft.VC143.CRT\vcruntime140_1.dll" %LOSELOG_WORKSPACE%\release\ /y

echo "Copying ssl..."
xcopy %SSL_DIR%\libcrypto-1_1%SSL_ARCH%.dll %LOSELOG_WORKSPACE%\release\ /y
xcopy %SSL_DIR%\libssl-1_1%SSL_ARCH%.dll %LOSELOG_WORKSPACE%\release\ /y

echo "Copying Qt..."
set "QTDIR=%LOSELOG_QT_DIR:/=\%"
echo %QTDIR%
xcopy %QTDIR%\bin\%LOSELOG_QT%Core.dll %LOSELOG_WORKSPACE%\release\ /y
xcopy %QTDIR%\bin\%LOSELOG_QT%Gui.dll %LOSELOG_WORKSPACE%\release\ /y
xcopy %QTDIR%\bin\%LOSELOG_QT%Network.dll %LOSELOG_WORKSPACE%\release\ /y
xcopy %QTDIR%\bin\%LOSELOG_QT%Widgets.dll %LOSELOG_WORKSPACE%\release\ /y
xcopy %QTDIR%\bin\%LOSELOG_QT%Concurrent.dll %LOSELOG_WORKSPACE%\release\ /y
xcopy %QTDIR%\bin\%LOSELOG_QT%Xml.dll %LOSELOG_WORKSPACE%\release\ /y
xcopy %QTDIR%\bin\%LOSELOG_QT%Core5Compat.dll %LOSELOG_WORKSPACE%\release\ /y

md %LOSELOG_WORKSPACE%\release\platforms
xcopy %QTDIR%\plugins\platforms\qwindows.dll %LOSELOG_WORKSPACE%\release\platforms\ /y

md %LOSELOG_WORKSPACE%\release\styles
xcopy %QTDIR%\plugins\styles\qwindowsvistastyle.dll %LOSELOG_WORKSPACE%\release\styles /y
xcopy %QTDIR%\plugins\styles\qmodernwindowsstyle.dll %LOSELOG_WORKSPACE%\release\styles /y

echo "Copying packaging files..."
md %LOSELOG_WORKSPACE%\chocolately
xcopy %LOSELOG_WORKSPACE%\packaging\windows\loselog.nuspec chocolately /y

md %LOSELOG_WORKSPACE%\chocolately\tools
xcopy %LOSELOG_WORKSPACE%\packaging\windows\chocolatelyInstall.ps1 chocolately\tools\ /y

xcopy %LOSELOG_WORKSPACE%\packaging\windows\loselog.nsi  /y
xcopy %LOSELOG_WORKSPACE%\packaging\windows\FileAssociation.nsh  /y

echo "Making portable archive..."
7z a -r %LOSELOG_WORKSPACE%\loselog-%LOSELOG_VERSION%-%LOSELOG_ARCH%-%LOSELOG_QT%-portable.zip @%LOSELOG_WORKSPACE%\packaging\windows\7z_loselog_listfile.txt
7z a %LOSELOG_WORKSPACE%\loselog-%LOSELOG_VERSION%-%LOSELOG_ARCH%-%LOSELOG_QT%-pdb.zip @%LOSELOG_WORKSPACE%\packaging\windows\7z_pdb_listfile.txt

echo "Done!"
