FROM openjdk:11

COPY build/libs/docker-0.0.1-SNAPSHOT.jar app.jar
COPY wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh
ENTRYPOINT ["./wait-for-it.sh","marketboro_database:3306","--","java","-Duser.timezone=Asia/Seoul", "-jar", "app.jar"]
