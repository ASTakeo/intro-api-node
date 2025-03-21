DROP FUNCTION IF EXISTS `RemoverCaracteresEspecais`;

DELIMITER //
CREATE FUNCTION `RemoverCaracteresEspecais` (`Texto` TEXT)
    RETURNS text
    LANGUAGE SQL
    DETERMINISTIC
    NO SQL
    SQL SECURITY INVOKER
    COMMENT ''

BEGIN

    SET Texto = REPLACE(Texto,'Š','S');
    SET Texto = REPLACE(Texto,'š','s');
    SET Texto = REPLACE(Texto,'Ð','Dj');
    SET Texto = REPLACE(Texto,'Ž','Z');
    SET Texto = REPLACE(Texto,'ž','z');
    SET Texto = REPLACE(Texto,'À','A');
    SET Texto = REPLACE(Texto,'Á','A');
    SET Texto = REPLACE(Texto,'Â','A');
    SET Texto = REPLACE(Texto,'Ã','A');
    SET Texto = REPLACE(Texto,'Ä','A');
    SET Texto = REPLACE(Texto,'Å','A');
    SET Texto = REPLACE(Texto,'Æ','A');
    SET Texto = REPLACE(Texto,'Ç','C');
    SET Texto = REPLACE(Texto,'È','E');
    SET Texto = REPLACE(Texto,'É','E');
    SET Texto = REPLACE(Texto,'Ê','E');
    SET Texto = REPLACE(Texto,'Ë','E');
    SET Texto = REPLACE(Texto,'Ì','I');
    SET Texto = REPLACE(Texto,'Í','I');
    SET Texto = REPLACE(Texto,'Î','I');
    SET Texto = REPLACE(Texto,'Ï','I');
    SET Texto = REPLACE(Texto,'Ñ','N');
    SET Texto = REPLACE(Texto,'Ò','O');
    SET Texto = REPLACE(Texto,'Ó','O');
    SET Texto = REPLACE(Texto,'Ô','O');
    SET Texto = REPLACE(Texto,'Õ','O');
    SET Texto = REPLACE(Texto,'Ö','O');
    SET Texto = REPLACE(Texto,'Ø','O');
    SET Texto = REPLACE(Texto,'Ù','U');
    SET Texto = REPLACE(Texto,'Ú','U');
    SET Texto = REPLACE(Texto,'Û','U');
    SET Texto = REPLACE(Texto,'Ü','U');
    SET Texto = REPLACE(Texto,'Ý','Y');
    SET Texto = REPLACE(Texto,'Þ','B');
    SET Texto = REPLACE(Texto,'ß','Ss');
    SET Texto = REPLACE(Texto,'à','a');
    SET Texto = REPLACE(Texto,'á','a');
    SET Texto = REPLACE(Texto,'â','a');
    SET Texto = REPLACE(Texto,'ã','a');
    SET Texto = REPLACE(Texto,'ä','a');
    SET Texto = REPLACE(Texto,'å','a');
    SET Texto = REPLACE(Texto,'æ','a');
    SET Texto = REPLACE(Texto,'ç','c');
    SET Texto = REPLACE(Texto,'è','e');
    SET Texto = REPLACE(Texto,'é','e');
    SET Texto = REPLACE(Texto,'ê','e');
    SET Texto = REPLACE(Texto,'ë','e');
    SET Texto = REPLACE(Texto,'ì','i');
    SET Texto = REPLACE(Texto,'í','i');
    SET Texto = REPLACE(Texto,'î','i');
    SET Texto = REPLACE(Texto,'ï','i');
    SET Texto = REPLACE(Texto,'ð','o');
    SET Texto = REPLACE(Texto,'ñ','n');
    SET Texto = REPLACE(Texto,'ò','o');
    SET Texto = REPLACE(Texto,'ó','o');
    SET Texto = REPLACE(Texto,'ô','o');
    SET Texto = REPLACE(Texto,'õ','o');
    SET Texto = REPLACE(Texto,'ö','o');
    SET Texto = REPLACE(Texto,'ø','o');
    SET Texto = REPLACE(Texto,'ù','u');
    SET Texto = REPLACE(Texto,'ú','u');
    SET Texto = REPLACE(Texto,'û','u');
    SET Texto = REPLACE(Texto,'ý','y');
    SET Texto = REPLACE(Texto,'ý','y');
    SET Texto = REPLACE(Texto,'þ','b');
    SET Texto = REPLACE(Texto,'ÿ','y');
    SET Texto = REPLACE(Texto,'ƒ','f');


    RETURN Texto;
END
//
DELIMITER ;