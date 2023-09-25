FROM openjdk:20
ADD target/static-0.0.1-SNAPSHOT.jar static-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java" , "-jar" , "static-0.0.1-SNAPSHOT.jar"]