# Etapa 1: compilar
FROM eclipse-temurin:21-jdk AS builder
WORKDIR /app

# Instala Maven directamente
RUN apt-get update && apt-get install -y maven

COPY . .
RUN mvn package -DskipTests

# Etapa 2: imagen final
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=builder /app/target/social-video-ia-1.0-SNAPSHOT.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]