# Diagnóstico de Impressoras via PowerShell 🖨️

Este projeto contém um script em PowerShell para verificar a conectividade de impressoras da rede, utilizando seus nomes ou endereços IP. O script é útil para identificar impressoras offline de forma rápida e visual.

## 🚀 Funcionalidade

- Testa conectividade de impressoras por hostname ou IP
- Exibe status no terminal com ícones e cores:
  - 🟢 Online (verde)
  - 🔴 Offline (vermelho)
- Útil para ambientes corporativos com múltiplas impressoras distribuídas

## 📂 Estrutura do Script

```powershell
$printers = @(
    @{Nome="Insira o nome da impressora aqui"; Local="Insira onde ela fica"; IP=$null},
    @{Nome="Insira o nome da impressora aqui"; Local="Insira onde ela fica"; IP="Insira o IP aqui"},
    ...
)

foreach ($item in $printers) {
    $nome = $item.Nome
    $local = $item.Local
    $alvo  = if ($item.IP) { $item.IP } else { $nome }

    if (Test-Connection -ComputerName $alvo -Count 1 -Quiet) {
        Write-Host "🟢 $nome ($local)" -ForegroundColor Green
    } else {
        Write-Host "🔴 $nome ($local)" -ForegroundColor Red
    }
}
```

## 🛠️ Como usar

1. Edite o arquivo `ping_printers_example.ps1` com os nomes/IPs reais das impressoras
2. Execute o script no PowerShell:
```bash
powershell -ExecutionPolicy Bypass -File .\ping_printers_example.ps1
```
3. Veja no terminal o status de cada impressora

## 💡 Dicas

- Pode ser combinado com `Export-Csv` para gerar relatórios
- Útil para rodar antes de trocas de toner, manutenção preventiva ou visitas de suporte
- Pode ser adaptado para qualquer outro equipamento de rede (câmeras, switches, etc.)

## 📦 Arquivos

- `ping_printers_example.ps1`: Script principal para diagnóstico de impressoras

## 🔒 Requisitos

- PowerShell 5.1+ (já incluso em Windows 10+)

## 📃 Licença

Este projeto está licenciado sob a [MIT License](LICENSE).
