clear-host
Add-Type -AssemblyName PresentationFramework
$Country = @("Afghanistan",
"Albania",
"Algeria",
"American Samoa",
"Andorra",
"Angola",
"Anguilla",
"Antigua and Barbuda",
"Argentina",
"Armenia",
"Aruba",
"Australia",
"Austria",
"Azerbaijan",
"Azores",
"Bahamas",
"Bahrain",
"Bangladesh",
"Barbados",
"Belarus",
"Belgium",
"Belize",
"Benin",
"Bermuda",
"Bhutan",
"Bolivia",
"Bonaire",
"Bosnia",
"Botswana",
"Brazil",
"British Virgin Islands",
"Brunei",
"Bulgaria",
"Burkina Faso",
"Burundi",
"Cambodia",
"Cameroon",
"Canada",
"Canary Islands",
"Cape Verde Island",
"Cayman Islands",
"Central African Republic",
"Chad",
"Chile",
"China, People?™s Republic of",
"Colombia",
"Comoros",
"Congo",
"Congo, The Democratic Republic of",
"Cook Islands",
"Costa Rica",
"Croatia",
"Curacao",
"Cyprus",
"Czech Republic",
"Denmark",
"Djibouti",
"Dominica",
"Dominican Republic",
"East Timor",
"Ecuador",
"Egypt",
"El Salvador",
"England",
"Equatorial Guinea",
"Eritrea",
"Estonia",
"Ethiopia",
"Europe",
"Faeroe Islands",
"Fiji",
"Finland",
"France",
"French Guiana",
"French Polynesia",
"Gabon",
"Gambia",
"Georgia",
"Germany",
"Ghana",
"Gibraltar",
"Greece",
"Greenland",
"Grenada",
"Guadeloupe",
"Guam",
"Guatemala",
"Guernsey",
"Guinea",
"Guinea-Bissau",
"Guyana",
"Haiti",
"Holland",
"Honduras",
"Hong Kong",
"Hungary",
"Iceland",
"India",
"Indonesia",
"Iraq",
"Ireland, Republic of",
"Israel",
"Italy",
"Ivory Coast",
"Jamaica",
"Japan",
"Jersey",
"Jordan",
"Kazakhstan",
"Kenya",
"Kiribati",
"Korea, South",
"Kosrae",
"Kuwait",
"Kyrgyzstan",
"Laos",
"Latvia",
"Lebanon",
"Lesotho",
"Liberia",
"Libya",
"Liechtenstein",
"Lithuania",
"Luxembourg",
"Macau",
"Macedonia (FYROM)",
"Madagascar",
"Madeira",
"Malawi",
"Malaysia",
"Maldives",
"Mali",
"Malta",
"Marshall Islands",
"Martinique",
"Mauritania",
"Mauritius",
"Mayotte",
"Mexico",
"Micronesia, Federated States of",
"Moldova",
"Monaco",
"Mongolia",
"Montenegro",
"Montserrat",
"Morocco",
"Mozambique",
"Namibia",
"Nepal",
"Netherlands",
"Netherlands Antilles",
"New Caledonia",
"New Zealand",
"Nicaragua",
"Niger",
"Nigeria",
"Norfolk Island",
"Northern Ireland",
"Northern Mariana Islands",
"Norway",
"Oman",
"Pakistan",
"Palau",
"Panama",
"Papua New Guinea",
"Paraguay",
"Peru",
"Philippines",
"Poland",
"Ponape",
"Portugal",
"Puerto Rico",
"Qatar",
"Reunion",
"Romania",
"Rota",
"Russia",
"Rwanda",
"Saba",
"Saipan",
"Samoa",
"San Marino",
"Saudi Arabia",
"Scotland",
"Senegal",
"Serbia",
"Seychelles",
"Sierra Leone",
"Singapore",
"Slovakia",
"Slovenia",
"Solomon Islands",
"South Africa",
"Spain",
"Sri Lanka",
"St. Barthelemy",
"St. Christopher",
"St. Croix",
"St. Eustatius",
"St. John",
"St. Kitts and Nevis",
"St. Lucia",
"St. Maarten",
"St. Martin",
"St. Thomas",
"St. Vincent and the Grenadines",
"Suriname",
"Swaziland",
"Sweden",
"Switzerland",
"Tahiti",
"Taiwan",
"Tajikistan",
"Tanzania",
"Thailand",
"Tinian",
"Togo",
"Tonga",
"Tortola",
"Trinidad and Tobago",
"Truk",
"Tunisia",
"Turkey",
"Turkmenistan",
"Turks and Caicos Islands",
"Tuvalu",
"U.S. Virgin Islands",
"Uganda",
"Ukraine",
"Union Island",
"United Arab Emirates",
"United Kingdom",
"United States",
"Uruguay",
"Uzbekistan",
"Vanuatu",
"Vatican City State",
"Venezuela",
"Vietnam",
"Virgin Gorda",
"Wales",
"Wallis and Futuna Islands",
"Yap",
"Yemen",
"Zambia",
"Zimbabwe"
)

function savevalue{
    #$CountryCode = ""
    $countryTmp = Get-Content '.\UPS_Shipping_Beta_v1\defaultCountry.json' | ConvertFrom-Json
    $NameCountry = $CountryList.SelectedItems
    $countryTmp.Country.Name.$NameCountry.Code
    $userdefault = [ordered]@{
        CompanyName = $CompanyName.Text
        AttentionName = $AttentionName.Text
        PhoneNumber = $PhoneNumber.Text
        AddressLine1 = $AddressLine1.Text
        AddressLine2 = $AddressLine2.Text
        AddressLine3 = $AddressLine3.Text
        Country = $countryTmp.Country.Name.$NameCountry.Code
        City = $City.Text
        State = $State.Text
        PostalCode = $PostalCode.Text
        Account = $Account.Text
    }
    #Write-Host $CountryList.SelectedItems
    #$CountryCode = [string]$countryTmp.Country.Name.$NameCountry.Code
    Write-Host $countryTmp.Country.Name.$NameCountry.Code
    Write-Host $CountryCode
    #$userdefault

    try{$userdefault | ConvertTo-Json | Out-File '.\UPS_Shipping_Beta_v1\userDefault.json'}
    catch{"no files"}
    
}
function getvalue{
    $userFiles = Get-Content '.\UPS_Shipping_Beta_v1\userDefault.json' | ConvertFrom-Json
    $CompanyName.Text = $userFiles.CompanyName
    $AttentionName.Text = $userFiles.AttentionName
    $PhoneNumber.Text = $userFiles.PhoneNumber
    $AddressLine1.Text = $userFiles.AddressLine1
    $AddressLine2.Text = $userFiles.AddressLine2
    $AddressLine3.Text = $userFiles.AddressLine3
    #$CountryList.SelectedItem = $userFiles.Country
    $City.Text = $userFiles.City
    $State.Text = $userFiles.State
    $PostalCode.Text = $userFiles.PostalCode
    $Account.Text = $userFiles.Account
}
[xml]$xaml = @"
<Window
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        x:Name= "Window" Title="User Setting(API)" Height="550" Width="500">
    <Grid >
        <ToolBarPanel HorizontalAlignment="Left" Height="45" Margin="4,10,0,0" VerticalAlignment="Top" Width="338" Grid.ColumnSpan="3" Background="Gray" Grid.Column="1">
        <Label Content="User Default Information" HorizontalAlignment="Left" VerticalAlignment="Top" Width="338" FontSize="14" FontWeight="Bold"/>
        </ToolBarPanel>
        <Label Content="Company Name" HorizontalAlignment="Left" Margin="4,60,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <Label Content="Attention Name" HorizontalAlignment="Left" Margin="4,90,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <Label Content="Phone Number" HorizontalAlignment="Left" Margin="4,120,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <Label Content="Address 1" HorizontalAlignment="Left" Margin="4,150,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <Label Content="Address 2" HorizontalAlignment="Left" Margin="4,180,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <Label Content="Address 3" HorizontalAlignment="Left" Margin="4,210,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <Label Content="Country" HorizontalAlignment="Left" Margin="4,240,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <Label Content="City" HorizontalAlignment="Left" Margin="4,380,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <Label Content="State" HorizontalAlignment="Left" Margin="4,410,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <Label Content="Postal Code" HorizontalAlignment="Left" Margin="4,440,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <Label Content="UPS Account" HorizontalAlignment="Left" Margin="4,470,0,0" VerticalAlignment="Top" Width="131" Foreground="Blue" FontWeight="Bold" Grid.ColumnSpan="2" Grid.Column="1"/>
        <TextBox Name="CompanyName" HorizontalAlignment="Left" Height="23" Margin="131,60,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="173" Grid.Column="2"/>
		<TextBox Name="AttentionName" HorizontalAlignment="Left" Height="23" Margin="131,90,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="173" Grid.Column="2"/>
		<TextBox Name="PhoneNumber" HorizontalAlignment="Left" Height="23" Margin="131,120,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="173" Grid.Column="2"/>
		<TextBox Name="AddressLine1" HorizontalAlignment="Left" Height="23" Margin="131,150,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="173" Grid.Column="2"/>
		<TextBox Name="AddressLine2" HorizontalAlignment="Left" Height="23" Margin="131,180,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="173" Grid.Column="2"/>
		<TextBox Name="AddressLine3" HorizontalAlignment="Left" Height="23" Margin="131,210,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="173" Grid.Column="2"/>
		<ListBox Name="CountryList" HorizontalAlignment="Left" Height="110" Margin="131,240,0,0" VerticalAlignment="Top" Width="173" Grid.Column="2"/>
		<TextBox Name="City" HorizontalAlignment="Left" Height="23" Margin="131,380,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="173" Grid.Column="2"/>
		<TextBox Name="State" HorizontalAlignment="Left" Height="23" Margin="131,410,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="173" Grid.Column="2"/>
		<TextBox Name="PostalCode" HorizontalAlignment="Left" Height="23" Margin="131,440,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="173" Grid.Column="2"/>
        <TextBox Name="Account" HorizontalAlignment="Left" Height="23" Margin="131,480,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="173" Grid.Column="2"/>
        <Button Name="SAVE" Content="SAVE" Grid.Column="5" HorizontalAlignment="Left" Height="30" Margin="330,480,0,0" VerticalAlignment="Top" Width="150"/>

    </Grid>
</Window>

"@

$reader=(New-Object System.Xml.XmlNodeReader $xaml) 
$Window=[Windows.Markup.XamlReader]::Load( $reader )

$CompanyName = $Window.FindName("CompanyName")
$AttentionName = $Window.FindName("AttentionName")
$PhoneNumber = $Window.FindName("PhoneNumber")
$AddressLine1 = $Window.FindName("AddressLine1")
$AddressLine2 = $Window.FindName("AddressLine2")
$AddressLine3 = $Window.FindName("AddressLine3")
$CountryList = $Window.FindName("CountryList")
$City = $Window.FindName("City")
$State = $Window.FindName("State")
$PostalCode = $Window.FindName("PostalCode")
$Account = $Window.FindName("Account")
$SAVE = $Window.FindName("SAVE")
# Country List
getvalue
foreach($countryName in $Country){
    $CountryList.Items.Add($countryName)
}


$SAVE.add_Click({
    savevalue;
    Start-Process Powershell -ArgumentList(".\UPS_Shipping_Beta_v1\beta-userSetting.ps1") -WindowStyle Hidden;
    $window.close()})

$Window.showDialog()