FROM tomcat:11.0-jdk17-temurin

# Configure Tomcat to use Render's default HTTP port
RUN sed -i 's/port="8080"/port="10000"/' /usr/local/tomcat/conf/server.xml

# Deploy Medicine application
COPY medicine.war /usr/local/tomcat/webapps/medicine.war

EXPOSE 10000

CMD ["catalina.sh", "run"]