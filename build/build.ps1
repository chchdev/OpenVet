# PowerShell script to build the OpenVet application

# Builds to 'bin' directory

# Check if 'bin' directory exists, if not create it
if (-Not (Test-Path -Path "bin")) {
    New-Item -ItemType Directory -Path "bin" | Out-Null
} else {
    Write-Host "Cleaning existing 'bin' directory..."
    Remove-Item -Path "bin\*" -Recurse -Force
}

# Compile the main.cpp file
Write-Host "Compiling main.cpp..."
$sourceFile = "src\main.cpp"
$outputFile = "bin\OpenVet.exe"
$compileCommand = "g++ $sourceFile -o $outputFile"
Invoke-Expression $compileCommand

# Check if the compilation was successful
if (Test-Path -Path $outputFile) {
    Write-Host "Build successful! Executable created at: $outputFile"
} else {
    Write-Host "Build failed. Please check for errors in the source code."
}

