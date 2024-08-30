# compliments of Dayve

[CmdletBinding()]
param (
    [string]$pathToYourDirectory,
    [int]$wordCount = 3,
    [int]$minLength = 4,
    [int]$maxLength = 6,
    [string]$seperator = "-",
    [string]$counter = 1,
    [switch]$online
)

begin {
    $symbolList = @('!', '#', '$', '%', '&', '(', ')', '*', '+', ',', '-', '.', '/', ':', ';', '<', '=', '>', '?', '@', '[', '\', ']', '^', '_', '{', '|', '}', '~')
}
process {
    # Aquired from https://github.com/dwyl/english-words
    if ($online) {
        # Online connect
        $response = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/dwyl/english-words/master/words.txt"
        $wordlist = $response.Content -split "`n"
    }
    else {
        # Local File
        $wordList = get-content -Path $pathToYourDirectory
    }

    $i = 0
    $finalwords = do {
        $randomWord = Get-Random -InputObject $wordList
        if (($randomWord.Length -le $maxLength) -and ($randomWord.Length -ge $minLength)) {
            "$($randomWord.substring(0, 1).toupper())$($randomWord.Substring(1).tolower())"
            $i++
        }
    }
    while ($i -lt $wordCount)

    $finalOutput = $finalwords -join $seperator

    $randomSymbol = Get-Random -InputObject $symbolList -Count 1
    $randomNumber = Get-random -minimum 1 -maximum 10
    $finalOutput = "$randomNumber" + $seperator.ToString() + $finalOutput + $randomSymbol.ToString()

    Write-Host $finalOutput
}
end {

}
