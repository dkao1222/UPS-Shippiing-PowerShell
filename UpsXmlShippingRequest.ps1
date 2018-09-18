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
    $ShipmentDigestCode = $response.ShipmentConfirmResponse.ShipmentDigest
}
$shipmentAccep = @"
<?xml version="1.0" encoding="ISO-8859-1"?>
<AccessRequest>
    <AccessLicenseNumber>$AccessToken</AccessLicenseNumber>
    <UserId>$loginID</UserId>
    <Password>$loginPW</Password>
</AccessRequest>
<?xml version="1.0" encoding="ISO-8859-1"?>
<ShipmentAcceptRequest>
    <Request>
        <TransactionReference>
            <CustomerContext>Customer Comment</CustomerContext>
        </TransactionReference>
        <RequestAction>ShipAccept</RequestAction>
        <RequestOption>1</RequestOption>
    </Request>
    <ShipmentDigest>$ShipmentDigestCode</ShipmentDigest>
</ShipmentAcceptRequest>
"@
# Ship Accep
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$build_info = Invoke-WebRequest -uri $accepuri -Method POST -Body $shipmentAccep -ContentType 'application/XML' #-Credential $usercreds
$build_info.Content | Out-File c:\test\responseXMLAccep.xml
$trackingArray = @()

foreach($document in [xml]$build_info.Content){
    "ResponseStatus"
    $document.ShipmentAcceptResponse.Response.ResponseStatusCode
    $document.ShipmentAcceptResponse.Response.ResponseStatusDescription
    "TransportationCharges"
    $document.ShipmentAcceptResponse.ShipmentResults.ShipmentCharges.TransportationCharges.CurrencyCode
    $document.ShipmentAcceptResponse.ShipmentResults.ShipmentCharges.TransportationCharges.MonetaryValue
    "ServiceOptionsCharges"
    $document.ShipmentAcceptResponse.ShipmentResults.ShipmentCharges.ServiceOptionsCharges.CurrencyCode
    $document.ShipmentAcceptResponse.ShipmentResults.ShipmentCharges.ServiceOptionsCharges.MonetaryValue
    "TotalCharges"
    $document.ShipmentAcceptResponse.ShipmentResults.ShipmentCharges.TotalCharges.CurrencyCode
    $document.ShipmentAcceptResponse.ShipmentResults.ShipmentCharges.TotalCharges.MonetaryValue
    "BillingWeight"
    $document.ShipmentAcceptResponse.ShipmentResults.BillingWeight.UnitOfMeasurement.Code
    $document.ShipmentAcceptResponse.ShipmentResults.BillingWeight.UnitOfMeasurement.Description
    "ShipmentIdentificationNumber"
    $document.ShipmentAcceptResponse.ShipmentResults.ShipmentIdentificationNumber
    "ShipmentIdentificationNumber box tracing"
    $trackingArray = $document.ShipmentAcceptResponse.ShipmentResults.PackageResults
    $tracking = $document.ShipmentAcceptResponse.ShipmentResults.PackageResults
}
foreach($label in $trackingArray){
    
    $label.TrackingNumber
    $label.ServiceOptionsCharges
    $label.LabelImage.LabelImageFormat.Code
    $label.LabelImage.HTMLImage
    $label.LabelImage.GraphicImage
    $HTMLImage = $label.LabelImage.HTMLImage
    $GraphicImage = $label.LabelImage.GraphicImage
    $fileName = $label.TrackingNumber
    
    if($label.LabelImage.LabelImageFormat.Code -eq "ZPL"){
        $gpimage = "label"+$fileName+"."+ $label.LabelImage.LabelImageFormat.Code
        $labelTransfer = [System.Convert]::FromBase64String($GraphicImage)
        [IO.File]::WriteAllBytes("C:\test\$gpimage", $labelTransfer)
        try { Copy-Item C:\test\$gpimage "\\wksp0007b8e8\UPSZP450" -ErrorAction Stop }catch{Write-Host "error send out to printer"}
    }
    else{
        $imageTransfer = [system.convert]::FromBase64String($HTMLImage) #| Out-Printer -Name "Microsoft Print to PDF"
        [System.Text.Encoding]::UTF8.GetString($imageTransfer) | Out-File "C:\test\$fileName.html"
        $gpimage = "label"+$fileName+"."+ $label.LabelImage.LabelImageFormat.Code
        $labelTransfer = [System.Convert]::FromBase64String($GraphicImage)
        [IO.File]::WriteAllBytes("C:\test\$gpimage", $labelTransfer)
    }
    
}