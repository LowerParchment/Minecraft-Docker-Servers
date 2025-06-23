# Base image with Java 17 (required for modern Minecraft)
FROM eclipse-temurin:17-jdk

# Set the working directory inside the container
WORKDIR /app

# Copy Forge installer into image
COPY forge-1.18.2-40.3.0-installer.jar installer.jar

# Install the server and delete the installer to keep the image clean
RUN java -jar installer.jar --installServer && rm installer.jar

# Add startup script
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Open Minecraft server port
EXPOSE 25565

# Default command when container starts
CMD ["/bin/bash", "/app/start.sh"]