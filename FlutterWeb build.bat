call flutter pub global run webdev build
pause 
exit

::echo ----LEONARDO EU TERMINEI A PASTA BUID AGORA VOU copiar-----------------
::
::xcopy "C:\Dropbox\Dropbox\z-esc\Leonardo particular\projetos\2019 01 24 eCommerce Cath\PAGINA_com_flutter\build" "C:\Dropbox\Dropbox\z-esc\Leonardo particular\projetos\2019 01 24 eCommerce Cath\PAGINA_com_firebase\public\Fluterweb\build" /e /y
::Robocopy "C:\Dropbox\Dropbox\z-esc\Leonardo particular\projetos\2019 01 24 eCommerce Cath\PAGINA_com_flutter\build" "C:\Dropbox\Dropbox\z-esc\Leonardo particular\projetos\2019 01 24 eCommerce Cath\PAGINA_com_firebase\public\Fluterweb\build" /MIR /PURGE
::echo ---------------------
::echo ---------------------
::echo ----LEONARDO EU TERMINEI de copiar, agora eh publicando-----------------
::echo ---------------------
::echo ---------------------
::pause
::
::start cmd /c "C:\Dropbox\Dropbox\z-esc\Leonardo particular\projetos\2019 01 24 eCommerce Cath\PAGINA_com_firebase\LM postar pagina no firebase.bat"
::
pause 