# Before running it, allow ps1 to execute scripts:
#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
# and then install the AudioDevice module
#Install-Module -Name AudioDeviceCmdlets -Scope CurrentUser

# Script to cycle through all available audio output devices
$ErrorActionPreference = "Stop"

# Import the AudioDeviceCmdlets module
Import-Module -Name AudioDeviceCmdlets

# Get the list of output devices and sort by Index (to ensure consistent order)
$devices = Get-AudioDevice -List | Where-Object { $_.Type -eq "Playback" }
$indices = $devices | Select-Object -ExpandProperty Index | Sort-Object
$totalDevices = $indices.Count

# Get the real index of the current playback device
$currentDeviceIndex = (Get-AudioDevice -Playback).Index

# Find the position of the current index inside the array of indices
$pos = [Array]::IndexOf($indices, $currentDeviceIndex)

# Calculate the position of the next device (wrap around to the beginning if needed)
$nextPos = ($pos + 1) % $totalDevices

# Get the real index of the next device
$nextDeviceIndex = $indices[$nextPos]

# Set the next playback device
Set-AudioDevice -Index $nextDeviceIndex
