FROM continuumio/anaconda3

RUN apt-get update

# xorg-server をインストールする。
RUN apt-get install -y --no-install-recommends debconf-utils && \
    echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections && \
    echo keyboard-configuration keyboard-configuration/layout select 'Japanese' | debconf-set-selections && \
    echo keyboard-configuration keyboard-configuration/layoutcode select 'jp' | debconf-set-selections && \
    apt-get install -y --no-install-recommends xorg

# ssh-server をインストールする。
RUN apt-get install -y --no-install-recommends openssh-server && \
    echo PermitRootLogin yes >> /etc/ssh/sshd_config  && \
    echo X11UseLocalhost no >> /etc/ssh/sshd_config  && \
    echo "root:root" | chpasswd

# ssh 用のポートを開ける。
EXPOSE 22

CMD service ssh start && /bin/bash
