FROM 825683588007.dkr.ecr.ap-southeast-1.amazonaws.com/estl/ubuntu:20.04

WORKDIR /app

ADD ldap-pass-webui /app/ldap-pass-webui
ADD static /app/static
ADD templates /app/templates
RUN chmod +x /app/ldap-pass-webui

EXPOSE 8080

ENTRYPOINT [ "./ldap-pass-webui" ]
