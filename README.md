# Read Me First

## Setup Development Local

### Requirement :

1. Java JDK 11
2. Maven 3.6.0
3. MySQL 8
4. File dump for local

### Prerequisite - MySQL :

1. Create database `deni_obs`
2. Username `root`
3. Password `123123`
4. dump SQL in src/resouces/sql/..

### How to run - in development mode :

1. copy file application.properties.example to application.properties
1. open folder: `cd movic-core`
2. `mvn spring-boot:run -Dspring-boot.run.profiles=dev`

### How to run - with jar file:

1. open folder: `cd deni-obs`
2. create jar file: `mvn clean install -DskipTests=true`
3. run jar with: `java -jar -Dspring.profiles.active=dev target/deni-obs-0.0.1-SNAPSHOT.jar`

### LOGIN
1. username `deni.wardiman08@gmail.com`
2. password `deni123`