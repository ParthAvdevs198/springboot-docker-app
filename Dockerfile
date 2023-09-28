FROM openjdk:17

# Run the Maven build command
RUN mvn clean install

ADD target/static-0.0.1-SNAPSHOT.jar static-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java" , "-jar" , "static-0.0.1-SNAPSHOT.jar"]