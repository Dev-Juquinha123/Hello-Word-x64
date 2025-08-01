@echo off
:: Compilar o código .asm usando NASM
nasm -f win64 -o "%~n1.obj" "%1"

:: Linkar o arquivo .obj com LD para gerar o .exe
ld -o "%~n1.exe" "%~n1.obj" "C:\msys64\ucrt64\lib\libkernel32.a" "C:\msys64\ucrt64\lib\libmsvcrt.a"

:: Limpar a tela
cls

:: Pausar por 2 segundos antes de executar o .exe gerado
timeout /t 2 /nobreak

:: Verificar se o arquivo .exe foi gerado corretamente
if exist "%~n1.exe" (
    :: Executar o .exe gerado
    start "" "%~n1.exe"
) else (
    echo Error: %~n1.exe not found.
)

:: Pausar para ver a saída antes de fechar
pause
