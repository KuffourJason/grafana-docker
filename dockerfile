ARG BASE_IMAGE=mcr.microsoft.com/windows/nanoserver:1809
FROM ${BASE_IMAGE}

ARG VERSION=6.2.5
ARG DLURL=https://dl.grafana.com/oss/release/grafana-$VERSION.windows-amd64.zip

RUN echo "Creating App Directory" && \
    mkdir C:\\app && \
    cd c:\\app && \
    echo Downloading Grafana from %DLURL% && \
    curl -o grafana.zip %DLURL%  && \
    echo Extracting grafana  && \
    tar -xf grafana.zip  && \
    echo Renaming folder  && \
    ren C:\\app\\grafana-%VERSION% grafana && \
    echo Cleaning up zip && \
    del /q grafana.zip

WORKDIR C:\\app\\grafana

EXPOSE 3000

CMD .\\bin\\grafana-server.exe \ 
    --packaging=docker
    
