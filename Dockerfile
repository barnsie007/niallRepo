
#IMAGE: Get the base image for Liberty
FROM websphere-liberty:webProfile7

#BINARIES: Add in all necessary application binaries
COPY ./server.xml /config
COPY ./binary/application/* /config/dropins/


#FEATURES: Install any features that are required
RUN apt-get update && apt-get dist-upgrade -y \
&& rm -rf /var/lib/apt/lists/*
RUN /opt/ibm/wlp/bin/installUtility install  --acceptLicense \
	jsp-2.3 \
	servlet-3.1 \
	mdb-3.2 \
	jndi-1.0 \
	jdbc-4.2 \
	jaxws-2.2 \
	localConnector-1.0 \
	jms-2.0 \
	wasJmsServer-1.0 \
	wasJmsClient-2.0; exit 0

