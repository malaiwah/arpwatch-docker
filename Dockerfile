FROM ubuntu:latest

RUN apt update && apt-get -y install python3 arpwatch nullmailer rsyslog ca-certificates psmisc curl net-tools

RUN curl -sSLf https://raw.githubusercontent.com/frispete/fetch-ethercodes/master/fetch_ethercodes.py -o /usr/local/bin/fetch_ethercodes.py && \
    chmod +x /usr/local/bin/fetch_ethercodes.py

RUN mkdir -p /usr/share/arpwatch

ADD cmd.sh /cmd.sh
ADD rsyslog.conf /rsyslog.conf

CMD ["bash", "cmd.sh"]
