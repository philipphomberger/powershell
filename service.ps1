$i = 0
while ((Get-Service kafka).status -like 'stopped') {
    Start-Service kafka
    $i = $i + 1
    if ((Get-Service kafka).status -like 'running') {
        Write-Output "Service is now Running!"
        exit 0
    }
    if ($i -lt 1000 ) {
        Write-Output "Service coud not be started!"
        exit 0
    }
}
