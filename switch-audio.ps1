# Antes de lanzarlo permitir que ps1 ejecute scripts:
#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# y luego el módulo de AudioDevice
#Install-Module -Name AudioDeviceCmdlets -Scope CurrentUser

# Script para rotar entre todos los dispositivos de salida de audio disponibles
$ErrorActionPreference = "Stop"

# Importa el módulo de AudioDeviceCmdlets
Import-Module -Name AudioDeviceCmdlets

# Obtiene la lista de dispositivos de salida
$devices = Get-AudioDevice -List | Where-Object { $_.Type -eq "Playback" }

# Obtiene el dispositivo actual predeterminado
$currentDevice = Get-AudioDevice -Playback | Where-Object { $_.Default }

# Encuentra el siguiente dispositivo en la lista y resetea el índice
$nextDeviceIndex = $currentDevice.Index + 1
$nextDeviceIndex = if ($nextDeviceIndex -gt $devices.Count) {1} else {$nextDeviceIndex}

# Establece el siguiente dispositivo como predeterminado
Set-AudioDevice -Index $nextDeviceIndex
