# FROM node:alpine
# WORKDIR "/app"
# COPY ./package.json .
# RUN npm install
# COPY . .

# RUN npm run build
# CMD ["npm", "run", "dev"]

FROM node as builder
WORKDIR "/app"
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM node
WORKDIR "/app"
COPY package*.json ./
RUN npm install --production

COPY --from=builder /app/dist ./dist

EXPOSE 4000
CMD node dist/src/index.js