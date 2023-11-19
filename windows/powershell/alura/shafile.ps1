function get-FileSHA1($filePath) {
    $fileContent = Get-Content $filePath
    $fileBytes = [System.Text.Encoding]::UTF8.GetBytes($fileContent)
    $sha1 = New-Object System.Security.Cryptography.SHA1Managed
    $hash = $sha1.ComputeHash($fileBytes)
    foreach ($byte in $hash) {
        <# $currentItemName is the current item #>
    }
    Write-Host $hash -BackgroundColor Red -ForegroundColor Blue      
}

function get-FileSHA256() {
       
}

function get-FileSHA384() {
       
}

function get-FileSHA512() {
       
}
get-FileSHA1 "D:\CRFSP\OneDrive - crfsp.org.br\Git\infralabs\windows\powershell\alura\shafile.ps1"