FROM maven:3-jdk-8 as pack
WORKDIR /package
COPY . ./ 
RUN ls && \ 
    mvn --batch-mode -f pom.xml clean install

FROM openjdk:8-jdk-alpine
COPY --from=pack package/target/validator-0.0.1.jar backend-validator-0.0.1.jar
ENTRYPOINT ["java","-jar","/backend-validator-0.0.1.jar"]
