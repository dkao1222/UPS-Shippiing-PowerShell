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
    </Grid>
</Window>

"@

$UserID = $Window.FindName("USerID")
$UserPW = $Window.FindName("UserPW")
$AccessToken = $Window.FindName("AccessToken")
$PrinterList = $Window.FindName(("PrinterList")

$prints = Get-Printer
foreach($tmp in $prints){
    $PrinterList.items.add($prints.Name)
}