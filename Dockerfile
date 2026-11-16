FROM node:24-alpine AS build
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
ARG APP_ENV=production
RUN npx ng build --configuration "${APP_ENV}"

FROM nginx:1.29-alpine
COPY --from=build /app/dist/backoffice/browser /usr/share/nginx/html
EXPOSE 80
