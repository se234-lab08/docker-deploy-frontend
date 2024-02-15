from node:10-alpine as node
workdir /app
copy package*.json /app/
run npm install
copy ./ /app/
arg target=ng-deploy
run npm run ${target}

from nginx: 1.13
copy --from=node /app/dist/ /usr/share/nginx/html/
copy ./nginx-custom.conf /etc/nginx/conf.d/default.conf
expose 80

