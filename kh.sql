create table getIdentityDataList(
    statusCode varchar(4),
    statusMessage varchar(100),
    userId varchar(20),
    facilityId varchar(20),
    addressName varchar(100),
    itemCode varchar(8)
);
create table getCroppingSeasonDataList(
    statusCode varchar(4),
	statusMessage varchar(100),
	croppingSerlNo varchar(10),
	croppingSeasonName varchar(30),
	croppingDate varchar(25),
	croppingEndDate varchar(25),
	croppingSystem varchar(25),
	itemCode varchar(20),
	cultivationArea varchar(10),
	calCultivationArea varchar(10),
	plantNum varchar(10),
	calPlantNum varchar(10),
	stemSlabNum varchar(10),
	planSlabNum varchar(10),
	plantDensity varchar(10),
	standardPlantDensity varchar(10),
	floodlightDec varchar(10),
	leafArea varchar(10),
	stndTemp varchar(10),
	stndWeight varchar(10),
	stndSolar varchar(10),
	stndMeta varchar(10)
);
create table getManagementData(
	statusCode; 
	statusMessage; 
	manpowerPrice; 
	nutrientPrice; 
	preventionPrice; 
	shipmentAmt; 
	shipmentPrice; 
	maintenancePrice; 
	materialsPrice;
);
select * from getIdentityDataList;
select * from getCroppingSeasonDataList;
select distinct* from getIdentityDataList i, getCroppingSeasonDataList c where i.itemCode=c.itemCode;
select croppingSeasonName, addressName from getIdentityDataList i, getCroppingSeasonDataList c where i.itemCode=c.itemCode(+);