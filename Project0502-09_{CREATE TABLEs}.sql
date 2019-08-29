CREATE TABLE [TerpHoogle.Landlord](
	landlordId VARCHAR(2) NOT NULL,
	landlordName VARCHAR(30),
	landlordPhone CHAR(10),
	logo VARCHAR(900),
	CONSTRAINT pk_landlord_landlordId PRIMARY KEY (landlordId));

CREATE TABLE [TerpHoogle.Apartment](
aptId CHAR(4) NOT NULL,
aptName VARCHAR(30),
sAddress VARCHAR(30),
city VARCHAR(20),
state CHAR(2),
postalCode CHAR(5),
deposit Numeric(4),
distanceToUniversity NUMERIC(2,1), 
shuttle VARCHAR(3), 
constructionTime INTEGER,
applicationFee NUMERIC(3),
aptPic VARCHAR(900),
landlordId VARCHAR(2)
CONSTRAINT pk_Apartment_aptId PRIMARY KEY (aptId),
CONSTRAINT fk_Apartment_landlordId FOREIGN KEY (landlordId)
	REFERENCES [TerpHoogle.Landlord] (landlordId)
	ON DELETE CASCADE ON UPDATE CASCADE);


CREATE TABLE [TerpHoogle.ApartmentAmenity](
	aptAmenId VARCHAR(2) NOT NULL,
	aptId CHAR(4),
            furnished VARCHAR(10), 
	laundryInUnit VARCHAR(3),
	airConditioning VARCHAR(3),
	walkInCloset VARCHAR(3),
	dishwasher VARCHAR(3),
	microwaveOven VARCHAR(3),
	ceilingFan VARCHAR(3),
	flooring VARCHAR(10),
	cableTV VARCHAR(3), 
	patio VARCHAR(3),
	utilityIncluded VARCHAR(3),
	internetReady VARCHAR(3),
	storageSpace VARCHAR(3),
	CONSTRAINT pk_ApartmentAmenity_aptAmenId PRIMARY KEY (aptAmenId),
	CONSTRAINT fk_ApartmentAmenity_aptId FOREIGN KEY (aptId)
	REFERENCES [TerpHoogle.Apartment] (aptId)
	ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE [TerpHoogle.CommunityAmenity](
	comAmenId VARCHAR(2) NOT NULL,
	aptId CHAR(4),
            swimmingPool VARCHAR(3),
	fitnessCenter VARCHAR(3),
	petFriendly VARCHAR(3),
	breakfastBar VARCHAR(3),
	businessCenter VARCHAR(3),
	packageService VARCHAR(3),
	computerLab VARCHAR(3),
	clubHouse VARCHAR(3),
	lounge VARCHAR(3),
	coffeeBar VARCHAR(3),
	wifiAtCommunity VARCHAR(3),
	controlledAccess VARCHAR(3),
	propertyMgrOnSite VARCHAR(3),
	petCare VARCHAR(3),
	carWashArea VARCHAR(3),
	smokeFree VARCHAR(3),
	bbqArea VARCHAR(3),
	trashService VARCHAR(3),
	CONSTRAINT pk_CommunityAmenity_comAmenId PRIMARY KEY (comAmenId),
	CONSTRAINT fk_CommunityAmenity_aptId FOREIGN KEY (aptId)
	REFERENCES [TerpHoogle.Apartment] (aptId)
	ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE [TerpHoogle.Neighborhood](
nbhId VARCHAR(2) NOT NULL,
nbhType VARCHAR(15),
nbhName VARCHAR(30),
CONSTRAINT pk_Neighborhood_nbhId PRIMARY KEY (nbhId));

CREATE TABLE [TerpHoogle.NeighborRelate] (
aptId CHAR (4) NOT NULL,
nbhId VARCHAR(2) NOT NULL,
distanceToApartment NUMERIC(2,1),
CONSTRAINT pk_NeighborRelate_aptId_nbhId PRIMARY KEY (aptId,nbhId),
CONSTRAINT fk_NeighborRelate_aptId FOREIGN KEY (aptId)
REFERENCES [TerpHoogle.Apartment] (aptId),
CONSTRAINT fk_NeighborRelate_nbhId FOREIGN KEY (nbhId)
REFERENCES [TerpHoogle.Neighborhood] (nbhId)
ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE [TerpHoogle.Parking](parkId VARCHAR(2) NOT NULL,
   	aptId CHAR(4),
   	parkType VARCHAR(15),
   	parkFee NUMERIC(3),
   	CONSTRAINT pk_Parking_parkId PRIMARY KEY (parkId),
   	CONSTRAINT fk_Parking_aptId FOREIGN KEY (aptId)
          	REFERENCES [TerpHoogle.Apartment] (aptId)
          	ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE [TerpHoogle.Contact] (
        	agentId VARCHAR (2) NOT NULL,
        	agtName VARCHAR (20),
        	agtEmail VARCHAR (30),
        	agtOfficeHour VARCHAR(15),
        	aptId CHAR (4),
        	CONSTRAINT pk_Contact_agentId PRIMARY KEY (agentId) ,
CONSTRAINT fk_Contact_aptId FOREIGN KEY (aptId)
                    	REFERENCES [TerpHoogle.Apartment] (aptId)
                    	ON DELETE CASCADE ON UPDATE CASCADE);
 
CREATE TABLE [TerpHoogle.AgtSocialMedia] (
        	agtSocialMedia VARCHAR(100) NOT NULL,
        	agentId VARCHAR (2) NOT NULL,
        	CONSTRAINT pk_AgtSocialMedia_agtSocialMedia_agentId PRIMARY KEY (agtSocialMedia, agentId) ,
CONSTRAINT fk_AgtSocialMedia_agentId FOREIGN KEY (agentId)
                    	REFERENCES [TerpHoogle.Contact] (agentId)
                    	ON DELETE CASCADE ON UPDATE CASCADE);

 
CREATE TABLE [TerpHoogle.AgtPhoneNum] (
        	agtPhoneNum CHAR(10) NOT NULL,
        	agentId VARCHAR (2) NOT NULL,
        	CONSTRAINT pk_AgtPhoneNum_agtPhoneNum_agentId PRIMARY KEY (agtPhoneNum, agentId) ,
CONSTRAINT fk_AgtPhoneNum_agentId FOREIGN KEY (agentId)
                    	REFERENCES [TerpHoogle.Contact] (agentId)
                    	ON DELETE CASCADE ON UPDATE CASCADE);


 
CREATE TABLE [TerpHoogle.Review] (
        	reviewId VARCHAR (2) NOT NULL,
        	rating DECIMAL (2,1),
        	aptId CHAR (4),
        	CONSTRAINT pk_Review_reviewId PRIMARY KEY (reviewId) ,
CONSTRAINT fk_Review_aptId FOREIGN KEY (aptId)
                    	REFERENCES [TerpHoogle.Apartment] (aptId)
                    	ON DELETE CASCADE ON UPDATE CASCADE);
 
CREATE TABLE [TerpHoogle.ReviewComment] (
        	comment VARCHAR (800) NOT NULL,
        	reviewId VARCHAR (2) NOT NULL,
        	CONSTRAINT pk_Review_ReviewComment_comment_reviewId PRIMARY KEY (comment,reviewId) ,
CONSTRAINT fk_Review_reviewId FOREIGN KEY (reviewId)
                    	REFERENCES [TerpHoogle.Review] (reviewId)
                    	ON DELETE CASCADE ON UPDATE CASCADE);

CREATE TABLE [TerpHoogle.Unit](
unitNo VARCHAR(5) NOT NULL,
   	aptId CHAR(4) NOT NULL,
   	floorplan VARCHAR(10),
   	sqft NUMERIC(4),
   	floor VARCHAR(2),
   	price NUMERIC(4),
   	dateAvailable date,
   	leaseLength NUMERIC(2),
   	flexibility VARCHAR(3),
   	unitPic VARCHAR(900),
   	CONSTRAINT pk_Unit_unitNo_aptId PRIMARY KEY (unitNo, aptId),
   	CONSTRAINT fk_Unit_aptId FOREIGN KEY (aptId)
          	REFERENCES [TerpHoogle.Apartment](aptId)
          	ON DELETE CASCADE ON UPDATE CASCADE);