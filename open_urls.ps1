Param(
  [Parameter(ValueFromRemainingArguments=$true)]
  [string[]]$Files
)

if (-not $Files -or $Files.Count -eq 0) {
  $default = Join-Path $env:USERPROFILE 'Downloads\s.txt'
  $Files = @($default)
}

$alltext = foreach ($f in $Files) {
  if (Test-Path $f) { Get-Content -Raw -Encoding UTF8 -ErrorAction SilentlyContinue -LiteralPath $f } else { Write-Warning "Missing file: $f"; "" }
} -join "`n"

$urls = [regex]::Matches($alltext, 'https?://[^\s\""''<>]+') | ForEach-Object { $_.Value } | Select-Object -Unique
if ($urls.Count -eq 0) { Write-Output 'No URLs found.'; exit 0 }

foreach ($u in $urls) {
  try { Start-Process $u } catch { Write-Warning "Failed to open: $u" }
  Start-Sleep -Milliseconds 200
}
