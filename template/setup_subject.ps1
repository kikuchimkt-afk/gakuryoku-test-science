# setup_subject.ps1 - Subject Name Replacement Script
param(
    [Parameter(Mandatory = $true)]
    [string]$SubjectName
)

# Pattern for Japanese brackets around subject name placeholder
$targetPattern = [char]0x3010 + [char]0x6559 + [char]0x79D1 + [char]0x540D + [char]0x3011

$files = Get-ChildItem -Path "." -Filter "*.html"
foreach ($file in $files) {
    $content = [System.IO.File]::ReadAllText($file.FullName, [System.Text.Encoding]::UTF8)
    
    # Replace subject name placeholder
    $newContent = $content -replace $targetPattern, $SubjectName
    
    # Replace search page link in registration page
    $newContent = $newContent -replace ($targetPattern + '\.html'), ($SubjectName + '.html')
    
    # Replace IndexedDB name
    $newContent = $newContent -replace "const DB_NAME = 'ScienceProblemsDB'", ("const DB_NAME = '" + $SubjectName + "ProblemsDB'")
    
    [System.IO.File]::WriteAllText($file.FullName, $newContent, [System.Text.Encoding]::UTF8)
    Write-Host "$($file.Name) updated."
}

# Rename search HTML file
$searchFile = Get-ChildItem -Path "." -Filter "*検索.html" | Select-Object -First 1
if ($searchFile) {
    $newName = $SubjectName + ".html"
    Rename-Item -Path $searchFile.FullName -NewName $newName -ErrorAction SilentlyContinue
    Write-Host "Renamed to $newName"
}
