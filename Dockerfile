FROM debian@latest AS base

FROM base AS deps
WORKDIR /server

RUN sudo add-apt-repository ppa:openjdk-r/ppa -y
RUN sudo apt install openjdk-17-jre-headless -y

FROM base AS files
WORKDIR /server

COPY . ./
RUN echo "eula=true" > eula.txt
RUN cmod +x "run.sh" 

FROM base AS runner
WORKDIR /server

EXPOSE 25565
CMD ["run.sh"]
