# Comprime os vídeos do site para web (mobile-first)
# Uso: powershell -ExecutionPolicy Bypass -File scripts\comprimir-videos.ps1
# - Faz backup dos originais em assets\videos\originais\
# - Mantém os mesmos nomes (o site continua funcionando)
# - H.264 CRF 26 + AAC 96k + faststart (roda liso no 4G)
# - Gera poster-*.jpg (capa do player antes do play)

$ErrorActionPreference = "Stop"
$dir = Join-Path $PSScriptRoot "..\assets\videos"
$bak = Join-Path $dir "originais"
New-Item -ItemType Directory -Force $bak | Out-Null

Get-ChildItem $dir -Filter "video-*.mp4" | ForEach-Object {
  $orig = $_.FullName
  $nome = $_.Name
  $antes = [math]::Round($_.Length / 1MB, 1)

  Copy-Item $orig (Join-Path $bak $nome) -Force
  $tmp = "$orig.tmp.mp4"

  ffmpeg -y -v error -i $orig `
    -vf "scale='if(gt(iw,720),720,iw)':-2" `
    -c:v libx264 -preset slow -crf 28 -pix_fmt yuv420p `
    -c:a aac -b:a 80k -movflags +faststart `
    $tmp

  Move-Item $tmp $orig -Force
  $depois = [math]::Round((Get-Item $orig).Length / 1MB, 1)
  Write-Output "$nome : ${antes}MB -> ${depois}MB"

  # capa (frame de 1s)
  $poster = Join-Path $dir ($_.BaseName -replace "video-", "poster-")
  ffmpeg -y -v error -ss 1 -i $orig -frames:v 1 -vf "scale=720:-2" -q:v 4 "$poster.jpg"
  Write-Output "poster : $(Split-Path $poster -Leaf).jpg"
}
Write-Output "Pronto! Originais em assets\videos\originais\"
