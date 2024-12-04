Get-ChildItem -Path . -Filter "__pycache__" -Directory -Recurse | 
    Where-Object { $_.FullName -notlike "*\venv\*" } | 
    Tee-Object -Variable pycacheFolders | 
    Select-Object FullName | 
    Format-Table -AutoSize; 
if((Read-Host "是否删除这些文件夹？(Y/N)") -eq 'Y') { 
    $pycacheFolders | Remove-Item -Recurse -Force -Verbose 
}