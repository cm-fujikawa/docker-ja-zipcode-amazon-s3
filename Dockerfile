FROM ubuntu:latest

RUN apt update && \
    apt install -y tzdata
ENV TZ=Asia/Tokyo

COPY startup.sh /startup.sh
RUN apt install -y wget unzip rename nkf gzip awscli && \
    chmod +x /startup.sh

CMD ["/startup.sh"]
