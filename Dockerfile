FROM alpine
RUN apk update && apk add ngrep sqlite kamailio kamailio-sqlite kamailio-json
ENV SIP_DOMAIN=skipet
RUN sed '/^[# ]*DBENGINE/cDBENGINE=SQLITE' -i /etc/kamailio/kamctlrc
RUN sed '/^[# ]*DB_PATH/cDB_PATH="/etc/kamailio/db/openser"' -i /etc/kamailio/kamctlrc
RUN sed '/^[# ]*VERIFY_USER=1/cVERIFY_USER=1' -i /etc/kamailio/kamctlrc
RUN mkdir -p /etc/kamailio/db
RUN kamdbctl create
RUN kamctl add 1001 1001
RUN kamctl add 1002 1002
RUN kamctl add 1003 1003
RUN kamctl add 1004 1004
RUN kamctl add 1005 1005
RUN kamctl add 1006 1005
RUN kamctl add 1007 1005
RUN kamctl add 1008 1005
RUN kamctl add 1009 1009
RUN kamctl add 1010 1010
RUN kamctl db show subscriber
ENTRYPOINT ["kamailio", "-DD", "-E", "-n", "2", "-T", "-S", "--alias=skipet"]
