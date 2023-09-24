$servico = Get-Service -Name "Audiosrv" -ComputerName "DTI11026X"
$servico.Status
if ($servico.Status -eq "Running"){
    $servico.Stop()
    $servico.Start()
} 
else {
    echo "O servico nao esta em execucao"
}