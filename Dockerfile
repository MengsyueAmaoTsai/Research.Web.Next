FROM node:21-alpine AS build
WORKDIR /app

COPY package.json pnpm-lock.yaml ./
RUN npm i -g pnpm && pnpm i 

COPY . .
RUN pnpm build 

FROM node:21-alpine AS production
WORKDIR /app

COPY --from=build /app/.next ./.next
COPY --from=build /app/public ./public

COPY package.json pnpm-lock.yaml ./
RUN npm i -g pnpm && pnpm i --prod

EXPOSE 3000
ENTRYPOINT [ "pnpm", "start" ]