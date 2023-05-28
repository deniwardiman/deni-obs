FROM openjdk:8-jdk-alpine
ENV LANG en_US.UTF-8
RUN apk --update add \
        fontconfig \
        ttf-dejavu
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} app.war
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app.war", "--spring.config.location=file:/home/application.properties"]