#! /bin/bash

apt-get update \
    && add-apt-repository ppa:mmk2410/intellij-idea \
    && apt-get install -y git \
    && apt-get install -y ubuntu-make \
    && apt-get install -y python3-tk \
    && apt-get install -y python3-pil \
    && apt-get install -y python3-pil.image \
    && apt-get install -y python3-pil.imagetk \
    && wget https://download.jetbrains.com/python/pycharm-community-2020.2.tar.gz -P /headless \
    && tar xfz /headless/pycharm-community-2020.2.tar.gz -C /headless \
    && rm /headless/pycharm-community-2020.2.tar.gz \
    && echo "[Desktop Entry]" > /headless/Desktop/pycharm.desktop \
    && echo "Type=Application" >> /headless/Desktop/pycharm.desktop \
    && echo "Name=Pycharm" >> /headless/Desktop/pycharm.desktop \
    && echo "Icon=/headless/pycharm-community-2020.2/bin/pycharm.png" >> /headless/Desktop/pycharm.desktop \
    && echo "Exec=/headless/pycharm-community-2020.2/bin/pycharm.sh" >> /headless/Desktop/pycharm.desktop \
    && echo "Terminal=false" >> /headless/Desktop/pycharm.desktop \
    && echo "Categories=Development;IDE;Programming" >> /headless/Desktop/pycharm.desktop \
    && chmod +x /headless/Desktop/pycharm.desktop \
