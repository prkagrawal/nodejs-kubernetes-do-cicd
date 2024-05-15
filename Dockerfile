# FROM node:20.13.1-alpine3.18

# WORKDIR /app

# COPY package*.json ./

# RUN npm install

# COPY . .

# RUN npm run build

# # 

# EXPOSE 4000

# CMD [ "node", "./built/app.js" ]

# Stage 1: Build
FROM node:20.13.1-alpine3.18 AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Stage 2: Run
FROM node:20.13.1-alpine3.18
WORKDIR /app
COPY --from=builder /app/built ./built
COPY package*.json ./
RUN npm install --only=production
EXPOSE 4000
CMD [ "node", "./built/app.js" ]
