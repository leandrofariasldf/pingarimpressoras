$printers = @(
    @{Nome="Insira o nome da impressora aqui"; Local="Insira onde ela fica"; IP=$null},
    @{Nome="Insira o nome da impressora aqui"; Local="Insira onde ela fica"; IP="Insira o IP aqui"},
    @{Nome="Insira o nome da impressora aqui"; Local="Insira onde ela fica"; IP=$null}
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
