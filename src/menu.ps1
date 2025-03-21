function logoMenu {
	Write-Host ""
	Write-Host "========================================" -ForegroundColor Cyan
	Write-Host "               WinScripsts              " -ForegroundColor Green
	Write-Host "========================================" -ForegroundColor Cyan
	Write-Host ""
}

function menu {
	Clear-Host

	logoMenu

	Write-Host "Selecione uma opção para download:" -ForegroundColor Yellow
	Write-Host "[1] Instaladores de impressoras"
	Write-Host "[2] WinScripts"
	Write-Host "[0] Sair"
	Write-Host ""
}

function menuImpressora {
	Clear-Host

	logoMenu

	Write-Host "Selecione uma opção para download:" -ForegroundColor Yellow
	Write-Host "[1] Baixar Instalador HPSmart (MsStore)"
	Write-Host "[2] Baixar Driver HP410"
	Write-Host "[3] Baixar Driver HP580"
	Write-Host "[0] Sair"
	Write-Host ""
}

function menuScripts {
	Clear-Host

	logoMenu

	Write-Host "Selecione uma opção para download:" -ForegroundColor Yellow
	Write-Host "[1] Executar Script ChrisTitus"
	Write-Host "[2] Executar Script Massgrave"
	Write-Host "[0] Sair"
	Write-Host ""
}

while ($true) {
	menu

	$opcao = Read-Host "Digite o número da opção"

	switch ($opcao) {
		'1' {
			while ($true) {
				
				menuImpressora

				$opcaoImpressora = Read-Host "Digite o número da opção"

				switch ($opcaoImpressora) {
					'1' {
						$url = "https://github.com/rillmind/WinScripts/releases/download/Installer/HP.Smart.Installer.exe"
						$destino = "$env:USERPROFILE\Downloads\HPEasyStart-15.8.1.exe"
						Write-Host "Baixando o arquivo para $destino..." -ForegroundColor Green
						Invoke-WebRequest -Uri $url -OutFile $destino
						Write-Host "Download concluído!" -ForegroundColor Green
						Start-Sleep -Seconds 1
						break
					}
					'2' {
						$url = "https://github.com/rillmind/WinScripts/releases/download/410/HP_410-420.exe"
						$destino = "$env:USERPROFILE\Downloads\HP_410.exe"
						Write-Host "Baixando o arquivo para $destino..." -ForegroundColor Green
						Invoke-WebRequest -Uri $url -OutFile $destino
						Write-Host "Download concluído!" -ForegroundColor Green
						break
					}
					'3' {
						$url = "https://github.com/rillmind/WinScripts/releases/download/580/HP_580-590.exe"
						$destino = "$env:USERPROFILE\Downloads\HP_580.exe"
						Write-Host "Baixando o arquivo para $destino..." -ForegroundColor Green
						Invoke-WebRequest -Uri $url -OutFile $destino
						Write-Host "Download concluído!" -ForegroundColor Green
						break
					}
					'0' {
						break
					}
					Default {
						Write-Host "Opção inválida." -ForegroundColor Red
					}
				}

				if ($opcaoImpressora -eq '0') {
					break
				}
			}
		}
		'2' {
			while ($true) {
				menuScripts

				$opcaoScript = Read-Host "Digite o número da opção"

				switch ($opcaoScript) {
					'1' {
						Invoke-RestMethod https://christitus.com/win | Invoke-Expression
						break
					}
					'2' {
						Invoke-RestMethod https://get.activated.win | Invoke-Expression
						break
					}
					'0' {
						break
					}
				}
				if ($opcaoScript -eq '0') {
					break
				}
			}
		}
	}

	if ($opcao -eq '0') {
		Write-Host "Saindo..."
		Start-Sleep -Seconds 1
		break
	}
}