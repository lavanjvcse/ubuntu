# Kali Linux latest with useful tools by tsumarios
FROM kalilinux/kali-rolling

# Set working directory to /root
WORKDIR /root

# Update
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y wget kali-linux-headless


# Install common and useful tools
RUN apt -y install curl wget vim git nano

# install dependecies
RUN wget https://gitlab.com/kalilinux/recipes/kali-scripts/-/raw/main/xfce4.sh
RUN chmod +x xfce4.sh
RUN sudo ./xfce4.sh

RUN sudo /etc/init.d/xrdp start
RUN adduser kali

CMD ["/bin/bash"]
