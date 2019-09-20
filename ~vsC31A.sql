--1)
select Property.Name,Property.Id from dbo.Property inner join OwnerProperty on 
OwnerProperty.PropertyId=Property.Id where dbo.OwnerProperty.OwnerId = 1426;

--2)
select Property.Name,Property.Id,PropertyHomeValue.Value from dbo.Property inner join OwnerProperty on
OwnerProperty.PropertyId=Property.Id 
inner join dbo.PropertyHomeValue on PropertyHomeValue.PropertyId= Property.Id
where dbo.OwnerProperty.OwnerId = 1426;

--3)i.	Using rental payment amount, rental payment frequency, tenant start date and 
--tenant end date to write a query that returns the sum of all payments from start date to end date. 
select Property.Name,Property.Id,PropertyHomeValue.Value,PropertyRentalPayment.Amount,
TenantProperty.StartDate,TenantProperty.EndDate
from dbo.Property inner join OwnerProperty on
OwnerProperty.PropertyId=Property.Id 
inner join dbo.PropertyHomeValue on PropertyHomeValue.PropertyId= Property.Id
inner join TenantProperty on TenantProperty.PropertyId=Property.Id
inner join PropertyRentalPayment on PropertyRentalPayment.PropertyId=Property.Id
where dbo.OwnerProperty.OwnerId = 1426;

--)ii
 select OwnerProperty.PropertyId,
 Property.id,
 Property.Name,
 Property.AddressId,
 PropertyFinance.Yield
 from Property inner join OwnerProperty on Property.Id=OwnerProperty.PropertyId
 inner join PropertyFinance on Property.Id=PropertyFinance.PropertyId WHERE OwnerProperty.OwnerId = 1426;


--d)
select 
job.JobDescription, Owners.id as OwnerID, ServiceProviderJobStatus.Id as ProviderID
from 
job 
inner join Owners on job.OwnerId= Owners.Id
inner join ServiceProviderJobStatus on job.ProviderId=ServiceProviderJobStatus.Id;


--e)
SELECT 
	P.Name PropertyName, OP.OwnerId, OP.PropertyId, PS.FirstName,PS.LastName, TPF.Name FrequencyPay, TP.PaymentAmount
FROM dbo.Property P 
	INNER JOIN dbo.OwnerProperty OP ON P.ID=OP.PropertyId
	INNER JOIN dbo.TenantProperty TP ON OP.PropertyId=TP.PropertyId
	INNER JOIN dbo.TenantPaymentFrequencies TPF ON TP.PaymentFrequencyId=TPF.Id
	INNER JOIN dbo.PropertyHomeValue PHV ON P.ID=PHV.PropertyId AND PHV.IsActive=1
	INNER JOIN dbo.Person PS ON TP.TenantId=PS.ID
Where OP.OwnerId=1426
