FROM nimmis/apache

# disable interactive functions
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get -y install php7.0 php7.0-xsl php7.0-gd php7.0-pgsql php7.0-ldap php7.0-mcrypt php7.0-mbstring php7.0-soap php7.0-curl vim zip ldap-utils git composer libapache2-mod-php7.0

RUN a2enmod authnz_ldap && a2enmod php7.0 && service apache2 restart

#ldap host

# get FH complete
RUN mkdir /home/fhcomplete && mkdir /home/fhcomplete/git
COPY FHC-Core /home/fhcomplete/git/FHC-Core
COPY FHC-AddOn-LDAP /home/fhcomplete/git/FHC-AddOn-LDAP

# install fh complete
RUN rsync -ruv /home/fhcomplete/git/FHC-Core/* /var/www/html/ --exclude=".git"
RUN rsync -ruv /home/fhcomplete/git/FHC-AddOn-LDAP/* /var/www/html/addons/ldap/ --exclude=".git"

RUN cd /var/www/html && composer install

RUN mkdir /var/fhcomplete && mkdir /var/fhcomplete/htaccess
COPY htaccess /var/fhcomplete/htaccess/.htaccess
COPY htaccessrdf /var/fhcomplete/htaccess/.htaccessrdf
COPY htpasswd /var/fhcomplete/htaccess/.htpasswd

RUN cd /var/www/html/cis/private/ && ln -s /var/fhcomplete/htaccess/.htaccess .htaccess
RUN cd /var/www/html/vilesci/ && ln -s /var/fhcomplete/htaccess/.htaccess .htaccess
RUN cd /var/www/html/system/ && ln -s /var/fhcomplete/htaccess/.htaccess .htaccess
RUN cd /var/www/html/content/ && ln -s /var/fhcomplete/htaccess/.htaccess .htaccess
RUN cd /var/www/html/rdf/ && ln -s /var/fhcomplete/htaccess/.htaccessrdf .htaccessrdf

COPY vilesci.config.inc.php /var/www/html/vilesci.config.inc.php
COPY global.config.inc.php /var/www/html/config/global.config.inc.php
COPY cis.config.inc.php /var/www/html/config/cis.config.inc.php

RUN cd /var/www/html/ && \
    chgrp www-data application/tmp/ application/config/extensions/ application/controllers/extensions/ application/helpers/extensions/ application/hooks/extensions/ application/libraries/extensions/ application/models/extensions/ application/views/extensions/ application/widgets/extensions/ && \
    chmod 775 application/tmp/ application/config/extensions/ application/controllers/extensions/ application/helpers/extensions/ application/hooks/extensions/ application/libraries/extensions/ application/models/extensions/ application/views/extensions/ application/widgets/extensions/

RUN service apache2 restart
CMD ["sleep", "3600000"]
