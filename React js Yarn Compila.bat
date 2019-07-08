::crio o build
call yarn run build

::crio a pasta para publicar
mkdir .\docs

::copio usando 2 metodos, pq as vezes o xcopy nao copia arquivo aberto
xcopy ".\build" ".\docs" /e /y
Robocopy ".\build" ".\docs" /MIR /PURGE


echo OFF
ECHO . 
ECHO .     ACABEI
ECHO .
pause