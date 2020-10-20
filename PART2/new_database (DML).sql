
INSERT INTO public."Property"("Property No","Street","Post Code","Number of Bedrooms","Number of Bathromms","Daily Rental Rate","Owner ID_Owner","Property Type ID_Property Type","City ID_City")
VALUES('1','16 Holland Ave,','K2K 1X1',3,2,600,1,1,1),
      ('2','20 Preston Street,','K2K 1X1',1,1,300,2,2,1),
      ('3','344 Riverside Drive,','k2k 1x1',1,1,375,1,2,1),
      ('4','21 Baseline Road,','k2k 1x1',2,1,690,3,1,1)
	 



INSERT INTO public."Owner"("Owner ID","Owner Name","Owner Email")
VALUES('1','Bill Monnor','bm@gmail.com'),(2,'Peter Smith','ps@gmail.com'),(3,'Wendy Miller','wm@gmail.com')
	 




INSERT INTO public."Client"("Client ID","Client Name","Client Email")
VALUES('1','Cheryl Potter','cp@gmail.com')


INSERT INTO public."Invoice"("Invoice Number","Invoice Date","Rental Start Date","Rental Charge","Tax Owing","Number of Days","Rental Amount Owing","Property No_Property","Client ID_Client")
VALUES('100','2019-01-10','2019-01-01',1200,96,2,1296,'1','1'),
      ('101','2017-03-28','2017-03-22',1200,96,4,1296,'2','1'),
      ('102','2018-05-10','2018-05-01',750,60,2,810,'3','1'),
      ('103','2019-07-20','2019-07-01',3450,276,5,3726,'4','1')



INSERT INTO public."Calendar Year"("Calendar Year")
VALUES('2017'),('2018'),('2019')
	

INSERT INTO public."Property Expense"("Property Expense ID","Property Tax","Electricity Cost","Heating Cost","Advertising Cost","Cleaning Cost","Total Expense","Property No_Property","Calendar Year_Calendar Year")
VALUES('1',3000.00,600.00,600.00,100.00,250.00,4550.00,'1','2017'),
      ('2',3050.00,660.00,660.00,125.00,250.00,4745.00,'1','2018'),
      ('3',3100.00,816.00,840.00,180.00,250.00,5186.00,'1','2019'),
      ('4',1800.00,240.00,204.00,100.00,100.00,2444.00,'2','2017'),
      ('5',1850.00,264.00,228.00,125.00,100.00,2567.00,'2','2018'),
      ('6',1900.00,324.00,240.00,180.00,100.00,2744.00,'2','2019'),
      ('7',1650.00,240.00,204.00,100.00,100.00,2294.00,'3','2017'),
      ('8',1680.00,264.00,228.00,125.00,100.00,2397.00,'3','2018'),
      ('9',1710.00,324.00,240.00,180.00,100.00,2554.00,'3','2019'),
      ('10',2700.00,600.00,600.00,100.00,250.00,4250.00,'4','2017'),
      ('11',2800.00,660.00,660.00,125.00,250.00,4495.00,'4','2018'),
      ('12',2900.00,816.00,840.00,180.00,250.00,4986.00,'4','2019')



INSERT INTO public."Property Type"("Property Type ID","Property Type")
VALUES('1','House'),('2','Apartment')
	 



INSERT INTO  public."Country"("Country ID","Country")
VALUES('1','CANADA')



INSERT INTO public."Province"("Province ID","Province","Country ID_Country" )
VALUES('1','Ontario','1')
	 

INSERT INTO public."City"("City ID","City","Province ID_Province")
VALUES(1,'Ottawa,','1')
	 


