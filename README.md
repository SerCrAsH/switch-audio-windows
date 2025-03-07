# SwitchAudio - Quickly Switch Audio Output Device on Windows

## Description

SwitchAudio is a PowerShell script that allows you to quickly switch the audio output device on Windows. It's useful for those who frequently switch between headphones, speakers, and other audio devices.

## Requirements

Before running the script, follow these steps:

1. **Allow script execution in PowerShell:**  
   Run PowerShell as Administrator and enable script execution with the following command:  
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
   ```
2. **Install the `AudioDeviceCmdlets` module (if not already installed):**  
   ```powershell
   Install-Module -Name AudioDeviceCmdlets -Scope CurrentUser -Force
   ```

## Usage

1. Download the `switch-audio.ps1` script and save it to an accessible location.
2. Open PowerShell and navigate to the folder where you saved the script.
3. Run the script launching it or using the following command:
  ```powershell
  .\switch-audio.ps1
  ```

## Notes

If you encounter an execution policy error, check the current policy with:
```powershell
Get-ExecutionPolicy
```
If the result is Restricted, update the policy as shown in the requirements.
You can customize the script to fit your specific audio devices.
