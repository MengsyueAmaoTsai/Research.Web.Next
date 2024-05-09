# RichillCapital.Research.Web

## Install Dependencies

```bash
pnpm i
```

## Run Local Development Server

```bash
pnpm run dev
```

Then visit <http://localhost:9997>

## Build for Production

```bash
pnpm run build
```

## Run Production Server

```bash
pnpm start
```

Then visit <http://localhost:3000>

## Build Docker Image

```bash
docker build -t research-web:latest .
```

## Run Docker Container

```bash
docker run -d -it -p 9997:3000 --restart=always --name research-web research-web:latest
```
