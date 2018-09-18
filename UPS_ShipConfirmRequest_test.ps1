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
$shipmentHead = @"
<ShipmentConfirmRequest xml:lang="en-US">
"@
$shipmentRequest = @"
<Request>
<TransactionReference>
    <CustomerContext>Customer Comment</CustomerContext>
</TransactionReference>
<RequestAction>ShipConfirm</RequestAction>
<RequestOption>validate</RequestOption>
</Request>
"@
$shipmentLabelSpecification = @"
<LabelSpecification>
    <LabelPrintMethod>
        <Code>ZPL</Code>
        <Description>ZPL</Description>
    </LabelPrintMethod>
    <HTTPUserAgent>Mozilla/4.5</HTTPUserAgent>
    <LabelImageFormat>
        <Code>ZPL</Code>
        <Description>ZPL</Description>
    </LabelImageFormat>
    <LabelStockSize>
        <Height>4</Height>
        <Width>6</Width>
    </LabelStockSize>
</LabelSpecification>
"@
$shipmentShipmentHead= @"
<Shipment>
<RateInformation>
    <NegotiatedRatesIndicator/> 
</RateInformation> 
<Description>TEST</Description>
"@
$shipmentShipmentShipper = @"
<Shipper>
    <Name>TEST</Name>
    <AttentionName>TEST</AttentionName>
    <PhoneNumber>1234567890</PhoneNumber>
    <ShipperNumber>015A69</ShipperNumber>
	<TaxIdentificationNumber></TaxIdentificationNumber>
    <Address>
    <AddressLine1>6F., No. 21, Sui-Lih Road,</AddressLine1>
    <City>Taoyuan</City>
    <StateProvinceCode></StateProvinceCode>
    <PostalCode>11161</PostalCode>
    <PostcodeExtendedLow></PostcodeExtendedLow>
    <CountryCode>TW</CountryCode>
    </Address>
</Shipper>
"@
$shipmentShipmentShipTo = @"
<ShipTo>
    <CompanyName>US TEST UPS API</CompanyName>
    <AttentionName>Ship To Attn Name</AttentionName>
    <PhoneNumber>97225377171</PhoneNumber>
    <Address>
    <AddressLine1>Address Line</AddressLine1>
    <City>CHICAGO</City>
    <StateProvinceCode>IL</StateProvinceCode>
    <PostalCode>60616</PostalCode>
    <CountryCode>US</CountryCode>
    </Address>
</ShipTo>
"@
$shipmentShipmentShipFrom = @"
<ShipFrom>
    <CompanyName>TEST UPS API</CompanyName>
    <AttentionName>test</AttentionName>
    <PhoneNumber>1234567890</PhoneNumber>
	<TaxIdentificationNumber></TaxIdentificationNumber>
    <Address>
    <AddressLine1>6F., No. 21, Sui-Lih Road,</AddressLine1>
    <City>Taoyuan</City>
    <StateProvinceCode></StateProvinceCode>
    <PostalCode>11161</PostalCode>
    <CountryCode>TW</CountryCode>
    </Address>
</ShipFrom>
"@
$shipmentPaymentInfor = @"
<PaymentInformation>
    <Prepaid>
    <BillShipper>
        <AccountNumber>015a69</AccountNumber>
    </BillShipper>
    </Prepaid>
</PaymentInformation>
"@
$shipmentService = @"
<Service>
    <Code>07</Code>
    <Description>Express</Description>
</Service>
"@
$shipmentPackage = @"
<Package>
    <PackagingType>
        <Code>02</Code>
        <Description>Customer Supplied Package</Description>
    </PackagingType>
    <Description>TEST</Description>
	<ReferenceNumber>
	<Code>00</Code>
	<Value>Package</Value>
	</ReferenceNumber>
    <PackageWeight>
        <UnitOfMeasurement/>
        <Weight>60.0</Weight>
    </PackageWeight>
    <LargePackageIndicator/>
    <AdditionalHandling>0</AdditionalHandling>
</Package>
"@
$shipmentPackage2 = @"
<Package>
    <PackagingType>
        <Code>02</Code>
        <Description>Customer Supplied Package</Description>
    </PackagingType>
    <Description>TEST</Description>
	<ReferenceNumber>
	<Code>00</Code>
	<Value>Package</Value>
	</ReferenceNumber>
    <PackageWeight>
        <UnitOfMeasurement/>
        <Weight>60.0</Weight>
    </PackageWeight>
    <LargePackageIndicator/>
    <AdditionalHandling>0</AdditionalHandling>
</Package>
"@
$shipmentShipmentEnd = @"
</Shipment>
"@
$shipmentEnd = @"
</ShipmentConfirmRequest> 
"@
$ShipmentDigestCode = ""

$shipmentConfirm = $xmlHead + $requestInformation + $shipmentHead + $shipmentRequest + $shipmentLabelSpecification + $shipmentLabelSpecification + $shipmentShipmentHead + $shipmentShipmentShipper + $shipmentShipmentShipTo + $shipmentShipmentShipFrom + $shipmentPaymentInfor + $shipmentService + $shipmentPackage + $shipmentPackage2 + $shipmentShipmentEnd + $shipmentEnd
# Ship Confirm request
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$build_info = Invoke-WebRequest -uri $uri -Method POST -Body $shipmentConfirm -ContentType 'application/XML' #-Credential $usercreds
$build_info.Content | Out-File c:\test\responseXML.xml
foreach($response in [xml]$build_info.Content){
    $response.ShipmentConfirmResponse.Response.TransactionReference
    $response.ShipmentConfirmResponse.Response.ResponseStatusCode
    $response.ShipmentConfirmResponse.Response.ResponseStatusDescription
    $responseStatus = $response.ShipmentConfirmResponse.Response.ResponseStatusDescription
    if($responseStatus -eq "Failure"){
        $response.ShipmentConfirmResponse.Response.Error.ErrorSeverity
        $response.ShipmentConfirmResponse.Response.Error.ErrorCode
        $response.ShipmentConfirmResponse.Response.Error.ErrorDescription
        
    }
    

}
