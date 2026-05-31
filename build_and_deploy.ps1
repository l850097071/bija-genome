# Bija-genome Hugo build & deploy script
# Usage: .\build_and_deploy.ps1 [-SkipPush] [-BuildOnly]
param([switch]$SkipPush, [switch]$BuildOnly)

$ErrorActionPreference = "Stop"
$repoDir = $PSScriptRoot
$siteDir = "$repoDir\site"
$publicDir = "$repoDir\public"
$docsDir = "$repoDir\docs"

# Find Hugo (try chocolatey, winget, or direct download)
$hugo = Get-Command hugo -ErrorAction SilentlyContinue | ForEach-Object Source
if (-not $hugo) {
    $candidates = @(
        "$env:ProgramFiles\Hugo\hugo.exe",
        "$env:LOCALAPPDATA\Hugo\hugo.exe",
        "$env:TEMP\hugo_new\hugo.exe",
        "$env:TEMP\hugo\hugo.exe"
    )
    foreach ($c in $candidates) {
        if (Test-Path $c) { $hugo = $c; break }
    }
}
if (-not $hugo) {
    Write-Host "Hugo not found. Downloading..."
    $hugoZip = "$env:TEMP\hugo_deploy.zip"
    $hugoDir = "$env:TEMP\hugo_deploy"
    Invoke-WebRequest -Uri "https://github.com/gohugoio/hugo/releases/download/v0.146.5/hugo_extended_0.146.5_windows-amd64.zip" -OutFile $hugoZip -UseBasicParsing
    Expand-Archive -Path $hugoZip -DestinationPath $hugoDir -Force
    $hugo = "$hugoDir\hugo.exe"
}

Write-Host "=== Hugo build ==="
Set-Location $siteDir
& $hugo --buildFuture --minify --gc --destination $publicDir
Set-Location $repoDir

$fileCount = (Get-ChildItem -Recurse -File $publicDir).Count
$postCount = (Get-ChildItem "$publicDir\posts" -Directory | Where-Object { $_.Name -ne 'page' }).Count
Write-Host "Built: $fileCount files, $postCount articles"

if ($BuildOnly) { Write-Host "Build only. Done."; return }

Write-Host "=== Sync to docs/ ==="
robocopy $publicDir $docsDir /MIR /NFL /NDL /NJH /NJS
Copy-Item "$repoDir\articles\CNAME" $docsDir\CNAME -Force -ErrorAction SilentlyContinue
if (-not (Test-Path "$docsDir\.nojekyll")) { New-Item -ItemType File -Path "$docsDir\.nojekyll" -Force | Out-Null }
Write-Host "docs/ synced: $((Get-ChildItem -Recurse -File $docsDir).Count) files"

if ($SkipPush) { Write-Host "Skip push. Done."; return }

Write-Host "=== Deploy to gh-pages ==="
$deployDir = "$env:TEMP\ghpages_deploy_" + (Get-Random -Minimum 1000 -Maximum 9999)
New-Item -ItemType Directory -Force -Path $deployDir | Out-Null
robocopy $publicDir $deployDir /E /NFL /NDL /NJH /NJS
Copy-Item "$repoDir\articles\CNAME" $deployDir\CNAME -Force -ErrorAction SilentlyContinue

Set-Location $deployDir
git init
git config user.email "bija@externalization.local"
git config user.name "Bija-外部化"
git add -A
git commit -m "deploy: Hugo $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
git remote add origin https://github.com/l850097071/bija-genome.git
git push origin master:gh-pages --force
Set-Location $repoDir
Write-Host "gh-pages deployed"

Write-Host "=== Commit to master ==="
git add docs/ -A
git commit -m "build: Hugo rebuild $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
git push origin master
Write-Host "Done. Site at: https://l850097071.github.io/bija-genome/ (when Pages enabled)"
