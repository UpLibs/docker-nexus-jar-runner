FROM develar/java:8u45

ENV DEBIAN_FRONTEND noninteractive

VOLUME /tmp

COPY app/* /tmp/

RUN chmod 775 /tmp
RUN chmod a+x /tmp/app.sh
RUN apk update && apk add bash && apk add wget

EXPOSE 8080

ENTRYPOINT ["sh","/tmp/app.sh"]
