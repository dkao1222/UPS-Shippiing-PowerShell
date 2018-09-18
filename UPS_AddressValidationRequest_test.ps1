$loginID = 'dkao1222'
$loginPW = 'Dragon6812'
$AccessToken = "DD0DBB35461EAD78"
$uri = "https://wwwcie.ups.com/ups.app/xml/AV"

$CountryCode = "US"
$CityCode = ""
$StateCode = ""
$PostalCode = "60616"


$xmlHead = @"
<?xml version="1.0"?>
"@
$requestInformation = @"
<AccessRequest xml:lang="en-US">
  <AccessLicenseNumber>$AccessToken</AccessLicenseNumber>
  <UserId>$loginID</UserId>
  <Password>$loginPW</Password>
</AccessRequest> 
"@
$AddressValidation = @"
<?xml version="1.0"?>
<AddressValidationRequest xml:lang="en-US">
    <Request>
        <TransactionReference/>
        <RequestAction>AV</RequestAction>
    </Request>
    <Address>
        <CountryCode>$CountryCode</CountryCode>
        <City>$CityCode</City>
        <StateProvinceCode>$StateCode</StateProvinceCode>
        <PostalCode>$PostalCode</PostalCode>
    </Address>
</AddressValidationRequest>
"@

$AddressValidationRequest = $xmlHead + $requestInformation + $AddressValidation
$AddressValidationResult = @()


[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$build_info = Invoke-WebRequest -uri $uri -Method POST -Body $AddressValidationRequest -ContentType 'application/XML' #-Credential $usercreds
$build_info.Content | Out-File c:\test\responseXML.xml
foreach($response in [xml]$build_info.Content){
    #$response.AddressValidationResponse.Response.ResponseStatusCode
    #$response.AddressValidationResponse.Response.ResponseStatusDescription
    $AddressValidationResult = $response.AddressValidationResponse.AddressValidationResult
}
foreach($address in $AddressValidationResult){
    if($address.Rank -eq 1){
        $CityCode = $address.Address.City
        $StateCode = $address.Address.StateProvinceCode
    }
    else{
        
    }
}

