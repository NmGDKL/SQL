/*===================================================================================
	                                      LIMIT
====================================================================================*/
	
	SELECT InvoiceDate,InvoiceId, total
	From invoices
    WHERE total > 10
    LIMIT 4 ;
	
/*===================================================================================
	                                      ORDER BY
====================================================================================*/

   SELECT *
   FROM invoices
   WHERE total > 10
   ORDER BY total ASC;
   
   SELECT *
   FROM invoices
   WHERE total > 10
   ORDER BY InvoiceDate DESC
   LIMIT 10;
   
/*===================================================================================
	                           LOGICAL OPERATORS (AND,ORD,NOT)
====================================================================================*/

  SELECT *
  FROM invoices
  WHERE BillingCountry ! = 'USA'
  ORDER BY total desc

  SELECT *
  FROM invoices
  WHERE  BillingCountr y= 'USA'
  OR BillingCountry = 'Germany'
  ORDER BY InvoiceId ASC ;
  
  SELECT *
  FROM invoices
  WHERE InvoiceDate >= '2012-01-01' AND InvoiceDate <= '2013-01-02 00:00:00';
  
  
/*===================================================================================
	                              BETWEEN
====================================================================================*/

  SELECT *
  FROM invoices
  WHERE InvoiceDate BETWEEN "2009-01-01" AND "2011-12-31"
  ORDER BY InvoiceDate DESC
  LIMIT 1 ;


 /*===================================================================================
	                               IN
====================================================================================*/

  SELECT FirstName, LastName
  FROM customers
  WHERE country IN('USA', 'Belgium', 'Norway', 'Canada');
  
  
 /*===================================================================================
	                               LİKE
====================================================================================*/

 SELECT FirstName, LastName, country
 FROM customers
 WHERE country like 'bel%'
 
 SELECT name, Composer
 FROM tracks
 WHERE Composer like '%bach';
 
 
 SELECT *
 FROM albums
 WHERE Title like '%Greatest%';
 
 SELECT *
 FROM invoices
 WHERE InvoiceDate like '%-02-%';    /* hemen hemen aynı çözüm alttakiyle */
 
 SELECT *
 FROM invoices
 WHERE InvoiceDate like '201_-02%'
 
 /* customers tablosunda, isimleri (FirstName) üç harfli olan müşterilerin FirstName, 
	LastName, City ve Address bilgilerini listeleyen sorguyu yazınız*/
	
	SELECT FirstName, LastName, City, Address
	FROM customers
	WHERE FirstName LIKE '___';
	
	
	/* customers tablosunda, soyisimleri Sch veya Go ile başlayan müşterilerin FirstName, 
	LastName ve City bilgilerini listeleyen sorguyu yazınız*/
 
   SELECT FirstName,LastName,City
   FROM customers 
   WHERE LastName LIKE 'Sch%' OR LastName LIKE 'Go%';




  