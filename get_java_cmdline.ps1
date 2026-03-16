Get-CimInstance Win32_Process -Filter "Name = 'java.exe'" | Select-Object CommandLine
