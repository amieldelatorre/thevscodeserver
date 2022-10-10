FROM arm64v8/ubuntu
WORKDIR /app
RUN apt-get update
RUN apt-get install -y wget


# These are install instructions for languages that I usually use
# Uncomment the sections you want to be included in the image created
# and then run `docker build -t "<name for the image>" .`

#-------------------------------------------------------
# Install Git
# RUN apt-get install -y git
#-------------------------------------------------------

#-------------------------------------------------------
# Install github cli
# RUN type -p curl >/dev/null || apt-get install curl -y curl -fsSL https://cli>
# RUN chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
# RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyring>
# RUN apt-get update
# RUN apt-get install gh -y
#-------------------------------------------------------

#-------------------------------------------------------
# Install Python3 and make the alias python
# RUN apt-get install -y  python3 
# RUN echo "alias python=python3" >> ~/.bashrc 
# RUN . ~/.bashrc 
#-------------------------------------------------------

#-------------------------------------------------------
# Install java
# RUN apt-get install -y default-jdk
#-------------------------------------------------------

#-------------------------------------------------------
# Install dotnet
# RUN wget -O - https://raw.githubusercontent.com/pjgpetecodes/dotnet6pi/master/install.sh | bash
#-------------------------------------------------------

# Install the vs code server and expose the port for it
RUN wget -O- https://aka.ms/install-vscode-server/setup.sh | sh
EXPOSE 8000
CMD ["code-server", "serve-local", "--without-connection-token", "--accept-server-license-terms", "--host", "0.0.0.0"]

