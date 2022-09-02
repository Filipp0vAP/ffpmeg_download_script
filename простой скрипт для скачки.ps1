###Путь до папки куда сохранять видео###
$folder_dest = "D:\Курсы Тони\Какой-то курс"



###Путь до файла с ссылками и названиями видео###
$source_table = "D:\Курсы Тони\ссылки.xlsx"




###дальше магия, ничего трогать не надо 😄###
Set-Location $folder_dest
$src = Import-Excel $source_table

$counter = 0
$videos_count = ($src.name | measure).Count

$src | % {

    $counter++
    Write-Progress -Activity 'Загрузка видео' -CurrentOperation $_.name -PercentComplete (($counter / $videos_count) * 100)
    ffmpeg -i $_.link -c copy -bsf:a aac_adtstoasc $_.name

}


