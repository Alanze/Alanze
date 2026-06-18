# GitHub Profile README - push script
# Requires: Sakuracat proxy running on port 7897, and gh auth login completed once

$env:HTTP_PROXY = "http://127.0.0.1:7897"
$env:HTTPS_PROXY = "http://127.0.0.1:7897"
$env:Path = "C:\Program Files\GitHub CLI;" + [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Set-Location "e:\vibe io"

Write-Host "Checking GitHub login..." -ForegroundColor Cyan
gh auth status
if ($LASTEXITCODE -ne 0) {
    Write-Host "`nPlease login first (complete browser verification when prompted):" -ForegroundColor Yellow
    gh auth login -h github.com -p https -w
}

Write-Host "`nCreating repo and pushing..." -ForegroundColor Cyan
git config http.proxy http://127.0.0.1:7897
git config https.proxy http://127.0.0.1:7897
gh repo create Alanze --public --push --source=. --description "GitHub Profile README"

Write-Host "`nDone! Visit: https://github.com/Alanze" -ForegroundColor Green
