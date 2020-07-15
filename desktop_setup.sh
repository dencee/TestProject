#! /bin/bash

apt-get update \
    && add-apt-repository ppa:mmk2410/intellij-idea \
    && apt-get install -y git \
    && wget https://download.processing.org/processing-3.5.4-linux64.tgz --no-check-certificate\
    && tar xfz processing-3.5.4-linux64.tgz \
    && /headless/processing-3.5.4/install.sh \
    && apt-get install -y ubuntu-make \
    && apt-get install -y python3-tk
    && apt-get install -y python3-pil
    && apt-get install -y python3-pil.image
    && apt-get install -y python3-pil.imagetk
    && printf .local/share/umake/ide/eclipse | umake ide eclipse \
    && echo "[Desktop Entry]" > /usr/share/applications/eclipse-java.desktop \
    && echo "Version=1.0" >> /usr/share/applications/eclipse-java.desktop \
    && echo "Type=Application" >> /usr/share/applications/eclipse-java.desktop \
    && echo "Name=Eclipse" >> /usr/share/applications/eclipse-java.desktop \
    && echo "Icon=/headless/.local/share/umake/ide/eclipse/java.png" >> /usr/share/applications/eclipse-java.desktop \
    && echo "Exec=/headless/.local/share/umake/ide/eclipse/eclipse" >> /usr/share/applications/eclipse-java.desktop \
    && echo "Terminal=false" >> /usr/share/applications/eclipse-java.desktop \
    && echo "Categories=Development;IDE;Programming" >> /usr/share/applications/eclipse-java.desktop \
    && rm .local/share/applications/eclipse-java.desktop \
    && cp /usr/share/applications/eclipse-java.desktop /headless/Desktop \
    && chmod +x /headless/Desktop/eclipse-java.desktop \
    && wget -O /headless/.config/bg_sakuli.png https://github.com/jointheleague/league-images/blob/master/League%20desktop.png?raw=true \
    && add-apt-repository ppa:ubuntu-mozilla-security/ppa \
    && apt-get update \
    && apt-get install -y firefox \
