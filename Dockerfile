ARG NODE_VERSION=22-alpine

FROM node:${NODE_VERSION} AS build 
WORKDIR /app

# Install dependencies
COPY package.json pnpm-lock.yaml ./
RUN npm i -g pnpm && \
    pnpm i 

# Build the app
COPY . .
RUN pnpm build 

FROM node:${NODE_VERSION} AS runtime
WORKDIR /app

COPY --from=build /app/.next ./.next
COPY --from=build /app/public ./public

COPY package.json pnpm-lock.yaml ./
RUN npm i -g pnpm && pnpm i --prod

EXPOSE 3000
ENTRYPOINT [ "pnpm", "start" ]