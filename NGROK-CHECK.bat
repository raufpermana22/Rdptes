@echo off
curl -O https://raw.githubusercontent.com/ThuongHai/windows-rdp/main/DisablePasswordComplexity.ps1 > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\Fast Config VPS.exe" https://raw.githubusercontent.com/ThuongHai/windows-rdp/main/FastConfigVPS_v5.1.exe > out.txt 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './DisablePasswordComplexity.ps1'" > out.txt 2>&1
diskperf -Y >nul
sc start audiosrv >nul
net user administrator Thuonghai001 /add >nul
net localgroup administrators administrator /add >nul
net user administrator /active:yes >nul
echo All done! Connect your VM using RDP. When RDP expired and VM shutdown, Re-run jobs to get a new RDP.
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Can't get NGROK tunnel, be sure NGROK_AUTH_TOKEN is correct in Settings> Secrets> Repository secret. Maybe your previous VM still running: https://dashboard.ngrok.com/status/tunnels " & ping 127.0.0.1 >Nul
echo User: Administrator
echo Pass: Thuonghai001
ping -n 10 127.0.0.1 >nul






