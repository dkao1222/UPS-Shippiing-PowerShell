$loginID = 'dkao1222'
$loginPW = 'Dragon6812'
$AccessToken = "DD0DBB35461EAD78"
$uri = "https://wwwcie.ups.com/ups.app/xml/ShipConfirm"
$accepuri = "https://wwwcie.ups.com/ups.app/xml/ShipAccept"

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

$shipmentConfirm = $xmlHead

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$build_info = Invoke-WebRequest -uri $uri -Method POST -Body $shipmentConfirm -ContentType 'application/XML' #-Credential $usercreds
$build_info.Content #| Out-File c:\test\responseXML.xml