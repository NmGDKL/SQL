/*=====================================================================================
		                                   SELECT 
=====================================================================================*/
	/* tracks tablosundaki track isimlerini (name) sorgulayınız */
	SELECT name FROM tracks;
	
	/* tracks tablosundaki besteci(Composer) ve şarkı isimlerini (name) sorgulayınız*/
	SELECT Composer,name FROM tracks;
	
	/*tracks tablosundaki tüm bilgileri sorgulayınız*/
	SELECT * FROM tracks;
  
 /*==================================================================================== 
	                                      DISTINCT
=====================================================================================*/	
	SELECT Composer FROM tracks;
	SELECT DISTINCT Composer FROM tracks;
	SELECT DISTINCT AlbumId,MediaTypeId FROM tracks;
	
/*===================================================================================
                                          WHERE
===================================================================================*/	
	SELECT name 
	FROM tracks 
	WHERE Composer= 'Jimi Hendrix';
	
	SELECT *
	FROM invoices
	WHERE total>10;
	
	
	
