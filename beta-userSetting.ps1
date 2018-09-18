Add-Type -AssemblyName PresentationFramework
function savevalue{
param(
    [string]$UserID,
    [string]$UserPW,
    [string]$AccessToken,
    [string]$printID
)
    $printName = Get-Printer -Name $printID
    $userRequest = [ordered]@{
        UserID = $UserID
        UserPW = $UserPW
        AccessToken = $AccessToken
        Printer = @{
            Name = $printName.Name
            ShareName = $printName.ShareName
            Port = $printName.PortName
        }
    }

    $userRequest | ConvertTo-Json | Out-File '.\UPS_Shipping_Beta_v1\userRequest.json'
}
function getvalue{
    
}

[xml]$xaml = @"
<Window
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        x:Name= "Window" Title="User Setting(API)" Height="400" Width="500">
    <Grid >
        <ToolBarPanel HorizontalAlignment="Left" Height="45" Margin="4,10,0,0" VerticalAlignment="Top" Width="338" Grid.ColumnSpan="3" Background="Gray" Grid.Column="1">
        <Label Content="User Setting" HorizontalAlignment="Left" VerticalAlignment="Top" Width="151" FontSize="14" FontWeight="Bold"/>
        </ToolBarPanel>
        <Label Content="User ID" HorizontalAlignment="Left" Margin="4,60,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <Label Content="User PW" HorizontalAlignment="Left" Margin="4,90,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <Label Content="User Access Token" HorizontalAlignment="Left" Margin="4,120,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <TextBox Name="UserID" HorizontalAlignment="Left" Height="23" Margin="131,60,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="173" Grid.Column="2"/>
        <TextBox Name="UserPW" HorizontalAlignment="Left" Height="23" Margin="131,90,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="173" Grid.Column="2"/>
        <TextBox Name="AccessToken" HorizontalAlignment="Left" Height="23" Margin="131,120,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="173" Grid.Column="2"/>
        <Label Content="Printer List" HorizontalAlignment="Left" Margin="4,150,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <ListBox Name="PrinterList" HorizontalAlignment="Left" Height="110" Margin="4,180,0,0" VerticalAlignment="Top" Width="300" Grid.Column="2"/>
        <Button Name="USerData" Content="User Default Infor" Grid.Column="5" HorizontalAlignment="Left" Height="30" Margin="4,310,0,0" VerticalAlignment="Top" Width="150"/>

    </Grid>
</Window>

"@

$reader=(New-Object System.Xml.XmlNodeReader $xaml) 
$Window=[Windows.Markup.XamlReader]::Load( $reader )


$UserID = $Window.FindName("UserID")
$UserPW = $Window.FindName("UserPW")
$AccessToken = $Window.FindName("AccessToken")
$PrinterList = $Window.FindName("PrinterList")
$USerData = $Window.FindName("USerData")

$prints = Get-Printer
foreach($tmp in $prints){
    $PrinterList.Items.Add($tmp.Name)
}

$USerData.add_Click({
   
    savevalue -UserID $UserID.Text -UserPW $UserPW.Text -AccessToken $AccessToken.Text -printID $PrinterList.SelectedItems ;
    Start-Process Powershell -ArgumentList(".\beta-userDefault.ps1") -WindowStyle Hidden;
    $Window.Close()})

$Window.showDialog()