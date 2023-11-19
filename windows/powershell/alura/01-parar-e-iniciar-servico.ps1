$servico = Get-Service -name "AdobeARMservice" -ComputerName "Fagner"
if ($servico.Status -eq "Running") {
    $servico.Stop()
    $servico.Start()
    Write-Output "Servico reiniciado com sucesso"
} else {
    Write-Output "O servico nao estava em execucao"
}