FROM node:8-alpine

ENV VS_ENV prod

WORKDIR /var/www/

COPY package.json ./

RUN apk add --no-cache --virtual .build-deps ca-certificates wget git \
  && yarn install --no-cache \
  && apk del .build-deps

COPY . .

COPY ./docker/vue-storefront/vue-storefront.sh /usr/local/bin/

EXPOSE 3000

CMD ["vue-storefront.sh"]
