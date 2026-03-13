FROM eclipse-temurin:21-jdk
WORKDIR /app
COPY . .
# Instalamos maven dentro del contenedor para no depender del archivo .mvnw
RUN apt-get update && apt-get install -y maven
RUN mvn clean package -DskipTests
EXPOSE 8080
CMD ["java", "-jar", "target/social-video-ia-1.0-SNAPSHOT.jar"]