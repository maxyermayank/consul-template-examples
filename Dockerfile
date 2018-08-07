FROM nginx:alpine

ENV CONSUL_TEMPLATE_VERSION 0.18.1
ADD https://releases.hashicorp.com/consul-template/${CONSUL_TEMPLATE_VERSION}/consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip /

RUN apk upgrade --update \
    && apk add --no-cache unzip

RUN unzip consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    mv consul-template /usr/local/bin/consul-template &&\
    rm -rf /consul-template_${CONSUL_TEMPLATE_VERSION}_linux_amd64.zip && \
    mkdir -p /consul-template /consul-template/config.d /consul-template/templates && \
    apk add --no-cache curl

EXPOSE 80

CMD [ "/usr/local/bin/consul-template", "-config /consul-template/config.d/config.hcl"]