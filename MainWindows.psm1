[xml]$xaml = @"
<Window
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        x:Name= "Window" Title="MainWindow" Height="550" Width="800">
    <Grid >
        <Grid.ColumnDefinitions>
            <ColumnDefinition Width="2*"/>
            <ColumnDefinition Width="27*"/>
            <ColumnDefinition Width="125*"/>
            <ColumnDefinition Width="110*"/>
        </Grid.ColumnDefinitions>
        <Label Content="Company Name" HorizontalAlignment="Left" Margin="4,60,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <ToolBarPanel HorizontalAlignment="Left" Height="45" Margin="4,10,0,0" VerticalAlignment="Top" Width="772" Grid.ColumnSpan="3" Background="Gray" Grid.Column="1">
        <Label Content="Ship-To:" HorizontalAlignment="Left" VerticalAlignment="Top" Width="151" FontSize="14" FontWeight="Bold"/>
        </ToolBarPanel>
        <Label Content="Attention Name" HorizontalAlignment="Left" Margin="4,90,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <Label Content="Phone Number" HorizontalAlignment="Left" Margin="4,120,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <Label Content="Address 1" HorizontalAlignment="Left" Margin="4,150,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <Label Content="Address 2" HorizontalAlignment="Left" Margin="4,180,0,0" VerticalAlignment="Top" RenderTransformOrigin="-0.353,-0.495" Width="131" Grid.ColumnSpan="2" Grid.Column="1"/>
        <Label Content="Address 3" HorizontalAlignment="Left" Margin="4,210,0,0" VerticalAlignment="Top" Width="131" Grid.ColumnSpan="2" Grid.Column="1"/>
        <Label Content="Country" HorizontalAlignment="Left" Margin="4,240,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <TextBox Name="CompanyName" HorizontalAlignment="Left" Height="23" Margin="59,62,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="173" Grid.Column="2"/>
        <TextBox Name="AttentionName" HorizontalAlignment="Left" Height="23" Margin="59,92,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="173" Grid.Column="2"/>
        <TextBox Name="PhoneNumber" HorizontalAlignment="Left" Height="23" Margin="59,120,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="173" Grid.Column="2"/>
        <TextBox Name="Address1" HorizontalAlignment="Left" Height="23" Margin="59,150,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="173" Grid.Column="2"/>
        <TextBox Name="Address2" HorizontalAlignment="Left" Height="23" Margin="59,180,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="173" Grid.Column="2"/>
        <TextBox Name="Address3" HorizontalAlignment="Left" Height="23" Margin="59,210,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="173" Grid.Column="2"/>
        <ListBox Name="CountryList" HorizontalAlignment="Left" Height="110" Margin="59,240,0,0" VerticalAlignment="Top" Width="173" Grid.Column="2"/>
        <Label Content="City" HorizontalAlignment="Left" Margin="4,367,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <TextBox Name="city" HorizontalAlignment="Left" Height="23" Margin="59,367,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="95" Grid.Column="2"/>
        <Label Content="State" HorizontalAlignment="Left" Margin="4,397,0,0" VerticalAlignment="Top" Width="131" Grid.ColumnSpan="2" Grid.Column="1"/>
        <TextBox Name="state" HorizontalAlignment="Left" Height="23" Margin="59,397,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="95" Grid.Column="2"/>
        <Label Content="Postal Code" HorizontalAlignment="Left" Margin="4,425,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <TextBox Name="postalCode" HorizontalAlignment="Left" Height="23" Margin="59,425,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="95" Grid.Column="2"/>
        <Label Content="UPS Account" HorizontalAlignment="Left" Margin="4,455,0,0" VerticalAlignment="Top" RenderTransformOrigin="0.272,-0.497" Width="131" Grid.ColumnSpan="2" Grid.Column="1"/>
        <TextBox Name="upsAccount" HorizontalAlignment="Left" Height="23" Margin="59,455,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="95" Grid.Column="2"/>
        <Button Name="Process" Content="Process" Grid.Column="3" HorizontalAlignment="Left" Margin="245,490,0,0" VerticalAlignment="Top" Width="75"/>
        <Label Content="Service" Grid.Column="2" HorizontalAlignment="Left" Margin="255,62,0,0" VerticalAlignment="Top" Grid.ColumnSpan="2" Width="177" FontWeight="Bold" Foreground="Blue"/>
        <ListBox Name="ServiceCode" Grid.Column="2" HorizontalAlignment="Left" Height="116" Margin="255,90,0,0" VerticalAlignment="Top" Width="177" Grid.ColumnSpan="2"/>
        <Label Content="Description" Grid.Column="2" HorizontalAlignment="Left" Margin="255,221,0,0" VerticalAlignment="Top" Grid.ColumnSpan="2" Width="139" FontWeight="Bold" Foreground="Blue"/>
        <TextBox Name="description" Grid.Column="2" HorizontalAlignment="Left" Height="23" Margin="255,249,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="177" Grid.ColumnSpan="2"/>
        <Label Content="Total&#xD;&#xA;Weight" Grid.Column="2" HorizontalAlignment="Left" Margin="255,397,0,0" VerticalAlignment="Top" Width="57" Foreground="Blue" FontWeight="Bold"/>
        <Label Content="Total&#xA;Box" Grid.Column="3" HorizontalAlignment="Left" Margin="0,397,0,0" VerticalAlignment="Top" Width="57" Foreground="Blue" FontWeight="Bold"/>
        <TextBox Name="totalWeight" Grid.Column="2" HorizontalAlignment="Left" Height="38" Margin="255,442,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="57" FontSize="24" UndoLimit="3" FontWeight="Bold"/>
        <TextBox Name="totalBox" Grid.Column="3" HorizontalAlignment="Left" Height="38" Margin="0,440,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="57" FontSize="24" UndoLimit="3" FontWeight="Bold"/>
        <Label Content="Ref1#" Grid.Column="3" HorizontalAlignment="Left" Margin="83,72,0,0" VerticalAlignment="Top"/>
        <Label Content="Ref2#" Grid.Column="3" HorizontalAlignment="Left" Margin="83,103,0,0" VerticalAlignment="Top"/>
        <Label Content="Ref3#" Grid.Column="3" HorizontalAlignment="Left" Margin="83,133,0,0" VerticalAlignment="Top"/>
        <TextBox Name="ref1" Grid.Column="3" HorizontalAlignment="Left" Height="23" Margin="131,72,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="189"/>
        <TextBox Name="ref2" Grid.Column="3" HorizontalAlignment="Left" Height="23" Margin="131,103,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="189"/>
        <TextBox Name="ref3" Grid.Column="3" HorizontalAlignment="Left" Height="23" Margin="131,133,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="189"/>

    </Grid>
</Window>

"@