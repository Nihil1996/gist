
#######################################################################################################################
#datum valtozo deklarlasa
datum=`date +"%Y_%m_%d"`
    # Itt ebbem a szakaszbam nagyon fontos hogy egy abszolut elérési utat adjunk meg
    # 3 mappát kell készíteni, mert 3 különböző dolgot naplózunk
        # 1. mappa = harom_legutoljara_modositott_fajlok_helye
            #harom_legutoljara_modositott_fajlok_helye="/home/nihil/cron_teszt/harom_legutoljara_modositott_fajlok_helye"
            harom_legutoljara_modositott_fajlok_helye="/home/nihil/cron_teszt/harom_legutoljara_modositott_fajlok_helye/"
        # 2. mappa = ot_napon_beluli_modositott_fajlok_helye
            ot_napon_beluli_modositott_fajlok_helye="/home/nihil/cron_teszt/ot_napon_beluli_modositott_fajlok_helye/"
        # 3. mappa = loadavg
            loadavg_mentesi_helye="/home/nihil/cron_teszt/loadavg/"
#Egy ciklus-ra lessz szükségünk,ami ellenörzi hogy létezik-e az adott mappa
    #Egy elseif ág fog kelleni, mert külön külön kell megviszgálni hogy az adott mappa létezik-e
    ################################################################
    #if [ ! -d "${harom_legutoljara_modositott_fajlok_helye}" ];then
    #    mkdir -p "${harom_legutoljara_modositott_fajlok_helye}"
    #elif [ ! -d "${ot_napon_beluli_modositott_fajlok_helye}" ];then
    #    mkdir -p "${ot_napon_beluli_modositott_fajlok_helye}"
    #elif [ ! -d "${loadavg}" ];then
    #    mkdir -p "${loadavg_mentesi_helye}"
    #fi
    ################################################################
    while [ ! -d "${harom_legutoljara_modositott_fajlok_helye}" ] ||  [ ! -d "${ot_napon_beluli_modositott_fajlok_helye}" ] || [ ! -d "${loadavg_mentesi_helye}" ]
    do
        mkdir -p "${harom_legutoljara_modositott_fajlok_helye}"
        mkdir -p "${ot_napon_beluli_modositott_fajlok_helye}"
        mkdir -p "${loadavg_mentesi_helye}"
    done
    ###############################################################
    #egy valtozoban deklaráltam a 3 legutoljára módosított elemet
    harom_legutoljara_modositott_fajlok=`ls -al /var/log | tail -n 3`
    #egy változoban deklarálom az 5 napon belül módosított fájlokat last_five-<DATE>.out
    ot_napon_beluli_modositott_fajlok=`find /var/log/* -mtime -5 -exec stat -c "%n %y" {} \;`
    #A /proc/loadavg-ból a 15 perces érték kiíratása a loadavg-<DATE>.out fájlba
    loadavg=`cat /proc/loadavg | awk {'print $3'}`
#3 legutoljára módosított fájl listázása /var/log mappábol mod-<DATE>.out fájlba
printf "%s\n" "${harom_legutoljara_modositott_fajlok}" >> "${harom_legutoljara_modositott_fajlok_helye}mod-${datum}.out"
printf "%s\n" "${ot_napon_beluli_modositott_fajlok}" >> "${ot_napon_beluli_modositott_fajlok_helye}last_five-${datum}.out"
printf "%s\n" "${loadavg}" >> "${loadavg_mentesi_helye}loadavg-${datum}.out"
#Utolsó lépésként a szkript megírása utána mindig adjunk chmod +x hogy futattható legyen a fájl