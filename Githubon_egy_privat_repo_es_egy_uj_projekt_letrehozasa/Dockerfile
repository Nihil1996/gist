
# ubuntu base image-t hasznalok alapnak
FROM ubuntu
# Telepíttem az apache-t
RUN apt update && apt install -y apache2
# apache2ctl parancs segítségével megadom hogy háttérben fusson. Ez azért fog kelleni, hogy a konténerünk ne lépjen ki automatán
CMD ["apache2ctl","-D","FOREGROUND"]
# EXPOSE utasítással megadom egyfajta megjegyzésként, hogy a konténer melyik portját fogom használni
EXPOSE 80