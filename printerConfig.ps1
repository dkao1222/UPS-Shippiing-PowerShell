$printList = Get-Printer
$PrinterName = @()
$printConfig = @"
"@
foreach($Printers in $printList){
    #$printList.Name
    #$printList.Type
    #$printList.ShareName
    #$printList.PortName
    $jsonType = @"
{
    PrintName:$printList.Name
    Type:{
        Type:$printList.Type
        Port:$printList.PortName
        ShareName:$printList.ShareName
    }
}
"@




}

    
