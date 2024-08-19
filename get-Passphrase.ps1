$pathToYourDirectory = "PUT YOUR PATH HERE"
$wordCount = 3
$minLength = 4
$maxLength = 6
$seperator = "-"
$symbolList = '!','#','$','%','&','(',')','*','+',',','-','.','/',':',';','<','=','>','?','@','[','\',']','^','_','{','|','}','~'
$finalWords = @()
$finalOutput = ""
$counter = 1
$needWords = $true

# Aquired from https://github.com/dwyl/english-words
$wordList = get-content -Path $pathToYourDirectory

$randomWord = Get-Random -InputObject $wordList

while ($needWords -eq $true) {
    $randomWord = Get-Random -InputObject $wordList    
    #Write-Host $randomWord " " $randomWord.Length
    if (($randomWord.Length -le $maxLength) -and ($randomWord.Length -ge $minLength)) {
        $randomWord = $randomWord.substring(0,1).toupper() + $randomWord.Substring(1).tolower()
        $finalWords += $randomWord
    }
    if ($finalWords.Count -eq $wordCount) {
        $needWords = $false
        Write-Host "Found words, formatting..."
    }
}

$finalOutput = $finalwords -join $seperator

$randomSymbol = Get-Random -InputObject $symbolList -Count 1
$randomNumber = Get-random -minimum 1 -maximum 10
$finalOutput = "$randomNumber" + $seperator.ToString() + $finalOutput + $randomSymbol.ToString()

Write-Host $finalOutput
