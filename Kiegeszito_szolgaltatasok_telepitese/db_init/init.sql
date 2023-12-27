-- Létrehozom udemx felhasználót,aminek a jelszava udemx . --
CREATE USER 'udemx' IDENTIFIED BY 'udemx';
/*
'udemx' = Felhasználó
IDENTIFIED BY = jelszó
*/
-- Ellenörzi , hogyha nem létezik az adatbázis akkor lérehozza --
-- - jelet nem használhatunk adatbázis és tábla neveknél --
CREATE DATABASE IF NOT EXISTS udemx_db CHARACTER SET UTF8;
-- Lényegében evvel a sorral megadom hogy az udemx felhasználó csak a udemx-db adatbázison tehet meg bármit,de máshol nem --
GRANT ALL PRIVILEGES ON udemx_db.* TO 'udemx';
/*
GRANT ALL PRIVILEGES = Ezzel megadok minden jogosultságot.
ON = Min adom meg
udemx-db = adatbázis .=adatbázis tábláit fogja jelenti *=adatbázis tábláin megtehetünk bármilyen műveletet
TO = kinek adom meg
*/