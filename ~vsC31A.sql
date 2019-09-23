--1)
--a)Display a list of all property names and their property id’s for Owner Id: 1426.
SELECT Property.Name,Property.Id FROM dbo.Property inner JOIN OwnerProperty ON 
OwnerProperty.PropertyId=Property.Id WHERE dbo.OwnerProperty.OwnerId = 1426;

--b)Display the current home value for each property in question a).
SELECT Property.Name,Property.Id,PropertyHomeValue.Value FROM dbo.Property inner JOIN OwnerProperty ON
OwnerProperty.PropertyId=Property.Id 
inner JOIN dbo.PropertyHomeValue ON PropertyHomeValue.PropertyId= Property.Id
WHERE dbo.OwnerProperty.OwnerId = 1426;

--c)For each property in question a), return the following:   
--i.)Using rental payment amount, rental payment frequency, tenant start date and tenant end date to write a query 
      --that returns the sum of all payments from start date to end date. 
SELECT Property.Name,Property.Id,PropertyHomeValue.Value,PropertyRentalPayment.Amount,
TenantProperty.StartDate,TenantProperty.EndDate
FROM dbo.Property inner JOIN OwnerProperty ON
OwnerProperty.PropertyId=Property.Id 
inner JOIN dbo.PropertyHomeValue ON PropertyHomeValue.PropertyId= Property.Id
inner JOIN TenantProperty ON TenantProperty.PropertyId=Property.Id
inner JOIN PropertyRentalPayment ON PropertyRentalPayment.PropertyId=Property.Id
WHERE dbo.OwnerProperty.OwnerId = 1426;

--ii)Display the yield. 
 SELECT OwnerProperty.PropertyId,
 Property.id,
 Property.Name,
 Property.AddressId,
 PropertyFinance.Yield
 FROM Property inner JOIN OwnerProperty on Property.Id=OwnerProperty.PropertyId
 inner JOIN PropertyFinance ON Property.Id=PropertyFinance.PropertyId WHERE OwnerProperty.OwnerId = 1426;


--d)Display all the jobs available in the marketplace (jobs that owners have advertised for service suppliers). 
SELECT 
job.JobDescription, Owners.id AS OwnerID, ServiceProviderJobStatus.Id AS ProviderID
FROM job 
inner JOIN Owners ON job.OwnerId= Owners.Id
inner JOIN ServiceProviderJobStatus ON job.ProviderId=ServiceProviderJobStatus.Id;


--e) Display all property names, current tenants first and last names and rental payments per week/ fortnight/month 
      --for the properties in question a). 
SELECT 
	P.Name PropertyName, OP.OwnerId, OP.PropertyId, PS.FirstName,PS.LastName, TPF.Name FrequencyPay, TP.PaymentAmount
FROM dbo.Property P 
	INNER JOIN dbo.OwnerProperty OP ON P.ID=OP.PropertyId
	INNER JOIN dbo.TenantProperty TP ON OP.PropertyId=TP.PropertyId
	INNER JOIN dbo.TenantPaymentFrequencies TPF ON TP.PaymentFrequencyId=TPF.Id
	INNER JOIN dbo.PropertyHomeValue PHV ON P.ID=PHV.PropertyId AND PHV.IsActive=1
	INNER JOIN dbo.Person PS ON TP.TenantId=PS.ID
WHERE OP.OwnerId=1426
