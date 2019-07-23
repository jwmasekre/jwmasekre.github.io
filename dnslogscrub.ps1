$inputpath = "C:\temp\DNS.log"

$outputfile = ‘c:\temp\extracted_ip_addresses.txt’

$Uniqueoutputfile = ‘c:\temp\extracted_unique_ip_addresses.txt’

$regex = ‘\b\d{1,3}.\d{1,3}.\d{1,3}.\d{1,3}\b’

$Matched = select-string -Path $inputpath -Pattern $regex -AllMatches | % { $_.Matches } | % { $_.Value }

$uniques = $Matched |Select-Object -Unique |Sort-Object

$Matched |Out-File -Encoding utf8 -FilePath $outputfile

$uniques |Out-File -Encoding utf8 -FilePath $Uniqueoutputfile