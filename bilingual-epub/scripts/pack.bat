@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
pushd "%SCRIPT_DIR%" >nul

if not exist "epub" (
  echo Missing folder: epub
  popd >nul
  endlocal
  exit /b 1
)

if not exist "export" mkdir "export"

for %%I in ("%CD%") do set "BOOK_NAME=%%~nxI"
set "SOURCE_DIR=%CD%\epub"
set "OUT_FILE=%CD%\export\%BOOK_NAME%.epub"

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$ErrorActionPreference = 'Stop';" ^
  "$sourceDir = $env:SOURCE_DIR;" ^
  "$outFile = $env:OUT_FILE;" ^
  "$mimePath = Join-Path $sourceDir 'mimetype';" ^
  "if (-not (Test-Path -LiteralPath $mimePath)) { throw 'Missing epub\\mimetype' };" ^
  "if (Test-Path -LiteralPath $outFile) { Remove-Item -LiteralPath $outFile -Force };" ^
  "Add-Type -AssemblyName System.IO.Compression, System.IO.Compression.FileSystem;" ^
  "$fileStream = [System.IO.File]::Open($outFile, [System.IO.FileMode]::CreateNew);" ^
  "try {" ^
  "  $zip = New-Object System.IO.Compression.ZipArchive($fileStream, [System.IO.Compression.ZipArchiveMode]::Create, $false);" ^
  "  try {" ^
  "    $mimeEntry = $zip.CreateEntry('mimetype', [System.IO.Compression.CompressionLevel]::NoCompression);" ^
  "    $mimeStream = $mimeEntry.Open();" ^
  "    try { [System.IO.File]::OpenRead($mimePath).CopyTo($mimeStream) } finally { $mimeStream.Dispose() };" ^
  "    Get-ChildItem -LiteralPath $sourceDir -Recurse -File | Where-Object { $_.FullName -ne $mimePath } | Sort-Object FullName | ForEach-Object {" ^
  "      $entryPath = $_.FullName.Substring($sourceDir.Length + 1).Replace('\','/');" ^
  "      $entry = $zip.CreateEntry($entryPath, [System.IO.Compression.CompressionLevel]::Optimal);" ^
  "      $entryStream = $entry.Open();" ^
  "      $inputStream = [System.IO.File]::OpenRead($_.FullName);" ^
  "      try { $inputStream.CopyTo($entryStream) } finally { $inputStream.Dispose(); $entryStream.Dispose() };" ^
  "    }" ^
  "  } finally { $zip.Dispose() }" ^
  "} finally { $fileStream.Dispose() };"

if errorlevel 1 (
  popd >nul
  endlocal
  exit /b 1
)

echo Done: %OUT_FILE%
popd >nul
endlocal
exit /b 0
