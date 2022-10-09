FROM arm64v8/ubuntu
WORKDIR /app
RUN apt-get update
RUN apt-get install -y curl
COPY . .
RUN chmod +x setup.sh && ./setup.sh
CMD ["code-server", "serve-local", "--without-connection-token", "--accept-server-license-terms", "--host", "0.0.0.0"]
EXPOSE 8000
