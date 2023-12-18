# Stage 1: Build Stage
FROM openjdk:11-jdk-slim AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the Java source code into the container
COPY HelloWorld.java /app/HelloWorld.java

# Compile the Java source code
RUN javac HelloWorld.java

# Stage 2: Run Stage
FROM openjdk:11-jre-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the compiled Java class file from the build stage
COPY --from=build /app/HelloWorld.class /app/HelloWorld.class

# Specify the command to run on container start
CMD ["java", "HelloWorld"]

