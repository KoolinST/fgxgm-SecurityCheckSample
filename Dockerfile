FROM node:18.17.1

RUN apt-get update && apt-get install -y \
    libfreetype-dev=2.12.1+dfsg-5+deb12u4 \
    libfreetype6=2.12.1+dfsg-5+deb12u4 \
    libfreetype6-dev=2.12.1+dfsg-5+deb12u4
RUN npm install -g npm@9.1.3

ADD package.json .
ADD index.js .
ADD build .
COPY . .
RUN npm install

EXPOSE 8080

CMD [ "node", "index.js" ]
