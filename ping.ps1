Set-Location "C:\src\ping\";
Get-Date;
$dns = [ordered]@{
    home = "127.0.0.1";
    # tmobile = "192.168.12.1";
    spectrum = "192.168.1.1";
    cloudflare1 = "1.1.1.1"; 
    cloudflare2 = "1.0.0.1"; 
    google1 = "8.8.8.8"; 
    google2 = "8.8.4.4"; 
    quad91 = "9.9.9.9";
    quad92 = "149.112.112.112";
    opendns1 = "208.67.222.222";
    opendns2 = "208.67.220.220";
    comodo1 = "8.26.56.26";
    comodo2 = "8.20.247.20";
}
# $dns
foreach ($key in $dns.Keys) {
    Write-Host "${key}: $($dns.Item($key))";
    Get-Date | Out-File ping$key.txt;
    ping /n 20 /l 4 $($dns.Item($key)) | Out-File -Append ping$key.txt;
    Get-Date | Out-File -Append ping$key.txt;
}
Get-Date;
"# For learning purposes only" | Out-File README.md
"This repo is for learning purposes only." | Out-File -Append README.md
"Last updated at" | Out-File -Append README.md
Get-Date | Out-File -Append README.md

git add .;
git commit -m "add ping";
git push origin --all;
