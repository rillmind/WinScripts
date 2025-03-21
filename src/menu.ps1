Clear-Host
Write-Host "===============================" -ForegroundColor Cyan
Write-Host "    Instalador Automático" -ForegroundColor Green
Write-Host "===============================" -ForegroundColor Cyan
Write-Host ""

Write-Host "Selecione uma opção para download:" -ForegroundColor Yellow
Write-Host "[1] Baixar Driver HP Easy Start 15.8.1"
Write-Host "[2] Baixar Outro Executável"
Write-Host "[0] Sair"

$opcao = Read-Host "Digite o número da opção"

switch ($opcao) {
    '1' {
        $url = "https://github.com/rillmind/WinScripts/releases/download/Installer/HP.Smart.Installer.exe"
        $destino = "$env:USERPROFILE\Downloads\HPEasyStart-15.8.1.exe"
        Write-Host "Baixando o arquivo para $destino..." -ForegroundColor Green
        Invoke-WebRequest -Uri $url -OutFile $destino
        Write-Host "Download concluído!" -ForegroundColor Green
    }
    '2' {
        $url = "https://github.com/SEU_USUARIO/SEU_REPOSITORIO/releases/download/v1.0.0/OutroArquivo.exe"
        $destino = "$env:USERPROFILE\Downloads\OutroArquivo.exe"
        Write-Host "Baixando o arquivo para $destino..." -ForegroundColor Green
        Invoke-WebRequest -Uri $url -OutFile $destino
        Write-Host "Download concluído!" -ForegroundColor Green
    }
    '0' {
        Write-Host "Saindo..." -ForegroundColor Gray
        exit
    }
    Default {
        Write-Host "Opção inválida." -ForegroundColor Red
    }
}

Write-Host "Pressione qualquer tecla para sair..."
[void][System.Console]::ReadKey($true)
