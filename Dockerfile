FROM ubuntu:latest

RUN apt update && apt install -y nginx bash

COPY mainScript.sh /usr/local/bin/mainScript.sh
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /usr/local/bin/mainScript.sh /entrypoint.sh

EXPOSE 80

CMD ["/entrypoint.sh"]
