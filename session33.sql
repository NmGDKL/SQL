 /*===================================================
	AGGREGATE FUNCTION COUNT,SUM,MIN,MAX, AVG)
====================================================*/
	
	-- COUNT
	-------------------------------------------------------------------------------------------------	
	/* invoices tablosunda kaç adet fatura bulunduğunu döndüren sorgu */
	
	SELECT COUNT(*)
	FROM invoices;
	
	SELECT COUNT(BillingState)
	FROM invoices;
	
	/* tracks tablosunda kaç adet farklı Composer bulunduğunu döndüren sorguyu yazınız*/
	
	SELECT count(DISTINCT Composer) AS besteci_sayisi
    FROM tracks;
	
	
	/* invoices tablosunda kaç adet farklı yıl olduğunu hesaplayan sorguyu yazınız*/ 
	/* ödev*/
	
	
	
	/* invoices  tablosunda 2009 ile 2013 tarihileri arasındaki faturaların toplam değerini listeyiniz */
	/* ödev*/
	
	
	
	
	
	
	
	SELECT name as Song_Name min(Milliseconds)/1000.0 as Duration
    FROM tracks;
	
	
	SELECT MIN(Grade), MAX(Grade)
	FROM students
	
	/* invoices  tablosundaki faturaların total değerini listeyiniz */
	
	SELECT SUM(total) AS total_bill
	FROM invoices;
	
	
	/* invoices  tablosundaki faturaların ortalama değerini listeyiniz */
	
	SELECT ROUND(AVG(total),2) AS Ortalama_Deger
    FROM invoices;
	
	/* tracks tablosundaki şarkıların ortalama süresinden daha uzun olan 
	şarkıların adlarını listeleyiniz */
	
	SELECT ROUND AVG(Milliseconds)
	FROM tracks
	WHERE Milliseconds > 393599;
	
	/*Bu yöntem hard-coded olduğu için çok mantıklı bir çözüm değil. 
	alt-sorgu(sub-query) ile daha doğru bir yaklaşım olacaktır sonraki 
	bölümlerde alt-sorguyu ayrıntılı bir şekilde inceleyeceğiz.*/
	
	SELECT Name, Milliseconds
    FROM tracks
    WHERE Milliseconds > (SELECT AVG(Milliseconds)
    FROM tracks);
	
	
	
/*===================================================
 GROUP BY
====================================================*/

  /* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) göre gruplandırarak 
	ve müşteri sayısına göre AZALAN şekilde sıralayarak listeleyen sorguyu yazınız*/
	
	SELECT country, COUNT(CustomerId) as num_customer 
	FROM customers
	GROUP BY Country 
	ORDER BY num_customer DESC ;
	
	
	/* customers tablosundaki müşterilerin sayılarını Ülkelerine (Country) ve Şehirlerine (City) 
	göre gruplandırarak listeleyen sorguyu yazınız*/
	
	
	SELECT Country, City, COUNT(CustomerId)
	FROM customers
	GROUP BY Country, City ;
	
	/* tracks tablosundaki her bir Bestecisinin (Composer) toplam şarkı sayısını 
	Besteci adına göre gruplandırarak listeleyen sorguyu yazınız. */
	
	SELECT Composer,COUNT(name) AS Song_Count
	FROM tracks
	WHERE Composer IS NOT NULL
	GROUP BY Composer
	
	/* invoices tablosundaki her bir ülkenin (BillingCountry) fatura ortalamalarını 
	hesaplayan ve ülke bilgileri ile listeleyen sorguyu yazınız.*/
	
	SELECT BillingCountry, ROUND(AVG(total),2) as ort_fatura
	FROM invoices
	WHERE InvoiceDate BETWEEN '2009-01-01'AND'2011-12-31 23:59:59'
	GROUP BY BillingCountry;
	
	
	/*===================================================
        JOINS
====================================================*/
    
--     Join islemleri farkli tablolardan secilen sutunlar ile yeni bir tablo 
--     olusturmak icin kullanilabilir.
--     
--     JOIN islemleri Iliskisel Veritabanlari icin cok onemli bir ozelliktir. Çunku
--    	Foreign Key'ler ile iliskili olan tablolardan istenilen sutunlari cekmek 
--     icin JOIN islemleri kullanilabilir.

--     Standart SQL'de en çok kullanılan Join islemleri:
--   	1) FULL JOIN:  Tablodaki tum sonuclari gosterir
--     2) INNER JOIN:  Tablolardaki ortak olan sonuc kumesini gosterir
--     3) LEFT JOIN:  Ilk tabloda (Sol) olup digerinde olmayan sonuclari gosterir
--     4) RIGHT JOIN: Sadece Ikinci tabloda olan tum sonuclari gosterir.

--		NOT: SQLite Sadece INNER, LEFT VE CROSS JOIN İşlemlerini desteklemektedir.
 
 /*===================================================*/   

  /* araclar.db adındaki veritabanını kullanarak Markalar ve Siparisler tablolarındaki 
 marka_id'si ayni olan kayıtların marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
 bilgilerini  listeleyen bir sorgu yaziniz.*/
 
   SELECT*FROM markalar;
   
   SELECT markalar.marka_id,markalar.marka_adi,siparisler.siparis_adedi,siparisler.siparis_tarihi
   FROM markalar
   INNER JOIN siparisler
   ON markalar.marka_id = siparisler.marka_id;
   
   /*LEFT'li olunca nasıl oluyor*/
   
   SELECT markalar.marka_id,markalar.marka_adi,siparisler.siparis_adedi,siparisler.siparis_tarihi
   FROM markalar
   LEFT JOIN siparisler
   ON markalar.marka_id = siparisler.marka_id;
 
	