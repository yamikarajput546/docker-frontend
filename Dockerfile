# Build phase 
FROM node:alpine as builder 

WORKDIR /app/

COPY package*.json ./

RUN npm install --no-optional

COPY ./ ./

RUN npm run build


# Run Phase
FROM nginx 

COPY --from=builder /app/build /usr/share/nginx/html




