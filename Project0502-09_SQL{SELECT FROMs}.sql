--About Apartment

--(1)    Show the apartments which are built after 2010.
SELECT aptName AS 'Apartment Name', constructionTime AS 'Construction Time'
FROM [TerpHoogle.Apartment]
WHERE constructionTime>=2010
ORDER BY aptName ASC;
 
--(2)    Show the apartments which are within 2 miles from UMD.
SELECT aptName AS 'Apartment Name', distanceToUniversity AS 'Distance to UMD'
FROM [TerpHoogle.Apartment]
WHERE distanceToUniversity<=2
ORDER BY aptName ASC;
 
--(3)    Show the address, landlord, landlord phone of all the apartments
SELECT a.aptName AS 'Apartment Name', sAddress AS 'Street Address',city AS 'City',landlordName AS 'Landlord Name',landlordPhone AS 'Landlord Phone'
FROM [TerpHoogle.Apartment] a,[TerpHoogle.Landlord] l
WHERE a.landlordId=l.landlordId
ORDER BY aptName ASC;

--(4)    Show the apartment whose deposit is no more than $300 and application fee is no more than $50
SELECT aptName AS 'Apartment Name', deposit,applicationFee
FROM [TerpHoogle.Apartment]
WHERE applicationFee<=50
AND deposit<=250
ORDER BY aptName ASC;


--About Neighbor & Neighbor Relate

--Show the apartment and the stores which are within 1 mile to the apartment
SELECT a.aptName AS 'Apartment Name', n.nbhName AS 'Neighborhood Name',
nbhType AS 'Neighborhood Type',distanceToApartment AS 'Distance'
FROM [TerpHoogle.Apartment] a,[TerpHoogle.Neighborhood] n,[TerpHoogle.NeighborRelate] nr
WHERE a.aptId=nr.aptId
AND nr.nbhId=n.nbhId
AND nbhType='Store'
AND distanceToApartment<=1
ORDER BY aptName ASC;



--About Landlord & Apartment

--Show all the landlord names and its property names under.
SELECT l.landlordName, a.aptName
FROM [TerpHoogle.Landlord] l, [TerpHoogle.Apartment] a
WHERE l.landlordId=a.landlordId 
ORDER BY L.landlordName ASC;

--About Apartment Amenity & Community Amenity & Other Features

--Show all the apartment names that is on UMD Shuttle Route, has controlled access, fitness center, lounge, trash service, and is smoke-free, furnished, laundry-in-unit, utility-included, internet-ready and provides hardwood flooring.

SELECT a.aptName
FROM [TerpHoogle.Apartment] a, 
[TerpHoogle.ApartmentAmenity] aa, 
[TerpHoogle.CommunityAmenity] ca
WHERE a.aptId = aa.aptId and
a.aptId = ca.aptId and
a.shuttle = 'Yes' and
ca.controlledAccess = 'Yes' and
ca.fitnessCenter = 'Yes' and
ca.lounge = 'Yes' and
ca.trashService = 'Yes' and
ca.smokeFree = 'Yes' and
aa.furnished = 'Yes' and
aa.laundryInUnit = 'Yes' and
aa.utilityIncluded = 'Yes' and
aa.flooring = 'Hardwood' and
aa.internetReady = 'Yes'
ORDER BY a.aptName ASC;

--About Social Media & AgentPhoneNum & Office Hour

--(1)Show all the agents’ social media
SELECT a.aptName, so.agtSocialMedia
FROM [TerpHoogle.contact] ca, [TerpHoogle.Apartment] a,[TerpHoogle.AgtSocialMedia] so
WHERE ca.aptId=a.aptId 
and ca.agentId = so.agentId;

--(2)Show all the agents’ phone number
SELECT a.aptName, ph.agtPhoneNum
FROM [TerpHoogle.contact] ca, [TerpHoogle.Apartment] a,[TerpHoogle.AgtPhoneNum] ph
WHERE ca.aptId=a.aptId 
and ca.agentId = ph.agentId;

--(3)Show all the agents’ office hour
SELECT a.aptName, ca.agtOfficeHour
FROM [TerpHoogle.contact] ca, [TerpHoogle.Apartment] a
WHERE ca.aptId=a.aptId;

--About Review

--(1)Show all the apartments whose rating are above 4.0 
SELECT a.aptName AS 'Rating'
FROM [TerpHoogle.Apartment] a, [TerpHoogle.Review] r
WHERE a.aptId = r.aptId
AND rating>4.0;

--(2)Show all the apartments whose rating are below 4.0
SELECT a.aptName AS 'Rating'
FROM [TerpHoogle.Apartment] a, [TerpHoogle.Review] r
WHERE a.aptId = r.aptId
AND rating<4.0;

--About Review Comment
--Show all the Review Comment
SELECT a.aptName, c.comment
FROM [TerpHoogle.Review] re, [TerpHoogle.Apartment] a, [TerpHoogle.ReviewComment] c
WHERE re.aptId=a.aptId 
and re.reviewId =c.reviewId;

--About Parking

--(1)  Parking information of each apartment
select a.aptName, p.parkType, p.parkFee
from [TerpHoogle.Apartment] a, [TerpHoogle.Parking] p
where a.aptId=p.aptId;

--(2). Example of choosing the unit with parking garage and the parking fee under 50
select a.aptName, p.parkType, p.parkFee
from [TerpHoogle.Apartment] a, [TerpHoogle.Parking] p
where a.aptId=p.aptId and
p.parkType='Garage' and
p.parkFee<=50;

--About Unit
 
--(1). Price comparison among different floorplan of each apartment
select a.aptName,u.floorplan,u.unitNo, u.sqft,u.unitPic,u.dateAvailable
from [TerpHoogle.Apartment] a, [TerpHoogle.Unit] u
where a.aptId=u.aptId;



--(2). Lease length of each apartment, flexible or not
select a.aptName,u.unitNo,u.leaseLength,u.flexibility
from [TerpHoogle.Apartment] a, [TerpHoogle.Unit] u
where a.aptId=u.aptId;

--(3). Date available of each apartment
select a.aptName,u.unitNo,u.dateAvailable
from [TerpHoogle.Apartment] a, [TerpHoogle.Unit] u
where a.aptId=u.aptId;


--(4). Example of choosing the units with 2b2b and price lower than 2500 and date available before 12/31/2018
SELECT DISTINCT a.aptName AS 'Apartment',floorplan,unitNo AS 'Unit Number',sqft,price
FROM [TerpHoogle.Unit] u,[TerpHoogle.Apartment] a
WHERE u.aptId=a.aptId
AND floorplan LIKE '2b%'
AND price<=2500
AND dateAvailable <= '12-31-2018';
