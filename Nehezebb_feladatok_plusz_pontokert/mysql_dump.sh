#Ennel a programnál a jelszót egy változóba rakom, hogyha megváltoztatnánk a jelszót.
passowrd="Alma1234"
#Egy mentesi helyet is meg kell adni, hogy az aktuális dátummal elnevezett mappák legyenek egy fő mappán belül, hogy egységesen legyenek az adatok.
    #Abszolut elérési utat adjunk meg mindig az a biztos
fo_mappa="/root/adatbazis_mentesek/"
#Egy dátum változót is létrehozzok, hogy dinamikusan kezelje a dátumot.
datum=`date +"%Y_%m_%d"`
#Egy almappát is létre kell hozni az adott dátummal, hogy a mentéseink mindig az adott dátummal jöjenek létre. Egy változóban megadom az almapa elérési útját
almappa="/root/adatbazis_mentesek/${datum}"
#Egy feltételt alkalmazzok, hogyha nincs lértehozva a mappa akkor hozza létre,így nem kell manuálisan létrehozni a mappát
if [ ! -d "${fo_mappa}" ]
    then
        mkdir -p "${fo_mappa}"
        mkdir -p "${almappa}"
    fi
#Teljes elérés fogja jelenti az abszolút utat a végén ahova a mysqldump kimenete megy , azért alkalmaztam ezt a feltétel ellenörzése után, mert a főmappának és az almappának meg kell lennie elsődlegesen. 
teljes_eleres="/root/adatbazis_mentesek/${datum}/"
#mysqldump program segítségével az összes adatbázis exportálása --all-databases kapcsolóval lehetséges
mysqldump -u root -p"${passowrd}" --all-databases > "${teljes_eleres}${datum}.sql"
#Utolsó lépésként a szkript megírása utána mindig adjunk chmod +x hogy futattható legyen a fájl