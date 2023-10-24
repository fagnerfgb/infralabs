New-Item -Path c:\A -ItemType directory

cd C:\A
$FILE="MYFILE.txt"

For ($i=1; $i -le 10; $i++) {
$MYARRAY = New-Object -TypeName Byte[] -ArgumentList 2Mb
$OBJ = New-Object -TypeName System.Random
$OBJ.NextBytes($MYARRAY)
Set-Content -Path "$i-$FILE" -Value $MYARRAY -Encoding Byte
}




New-Item -Path c:\B -ItemType directory