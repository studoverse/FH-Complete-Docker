FROM osixia/openldap

ENV LDAP_DOMAIN ldap
ENV LDAP_ORGANISATION Studo
ENV LDAP_ADMIN_PASSWORD admin
ENV LDAP_CONFIG_PASSWORD admin

COPY ./bootstrap/ldif/setup.ldif /container/service/slapd/assets/config/bootstrap/ldif/setup.ldif
