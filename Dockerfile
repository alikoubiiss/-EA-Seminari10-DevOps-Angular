# Etapa de build: compila la app con la configuracion que se le pida.
# APP_ENV=production (por defecto) usa environment.prod.ts; APP_ENV=local usa environment.ts.
FROM node:24-alpine AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
ARG APP_ENV=production
RUN npx ng build --configuration "${APP_ENV}"

# Etapa final: nginx sirviendo solo el estatico compilado.
FROM nginx:1.29-alpine
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist/backoffice/browser /usr/share/nginx/html
EXPOSE 80
