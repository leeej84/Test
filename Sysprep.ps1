Start-Process $env:SystemRoot\System32\Sysprep\Sysprep.exe -ArgumentList '/oobe','/generalize','/quit','/mode:vm'

while ($true) {
    $imageState = (Get-ItemProperty 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Setup\State').imageState
    Write-Output $imageState
    if ($imageState -eq 'IMAGE_STATE_GENERALIZE_RESEAL_TO_OOB') { break }
    Start-Sleep -seconds 5
}
Write-Output 'Sysprep Complete'
