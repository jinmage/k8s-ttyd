FROM atlassian/ssh-ubuntu:0.2.2
ENV TZ=Asia/Shanghai
WORKDIR /root
RUN apt update -y && apt upgrade -y && apt install -y wget && wget -O /root/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.1/ttyd.x86_64 && chmod +x ttyd && mv ttyd /usr/sbin
RUN apt install net-tools -y
COPY run.sh run.sh
COPY chpass chpass
RUN chpasswd < chpass
RUN chmod +x run.sh
CMD ./run.sh
