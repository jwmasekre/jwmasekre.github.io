$sourcefile = "C:\path\to\file.xlsx"
$destinationfolder = "C:\path\to\folder\"
$today = Get-Date

$i = 1
do {
    if ($today.AddDays($i).DayOfWeek -eq "Monday") {
        $nextmonday = $today.AddDays($i)
    }
    $i++
}
until ($i -eq 7)

$i = 0
do{
    $currentworkingmonday = $nextmonday.AddDays($i*7)
    $monthday = get-date -date $currentworkingmonday -UFormat "%m-%d-%y"
    $newfilename = "$destinationfolder`Schedule and Notes $monthday.xlsx"
    copy-item -path $sourcefile -Destination "$newfilename"
    $excel = New-Object -ComObject Excel.Application
    $excel.Visible = $true
    $excel.displayalerts = $false
    $workbook = $excel.Workbooks.Open($newfilename)
    $j = 10
    do{
        $currentday = $currentworkingmonday.AddDays($j-10)
        $cellentry = get-date -date $currentday -uformat "%m`/%d`/%y"
        $workbook.ActiveSheet.Cells.Item(14,$j) = "$cellentry"
        $j++
    }
    until ($j -eq 17)
    $workbook.SaveAs("$newfilename")
    $excel.quit()
    write-host "completed $monthday"
    $i++
}
until ($i -eq 3)