FROM node:21
WORKDIR /app
COPY . .
RUN npm i
COPY .env.sample .env
EXPOSE 5000
CMD ["npm" ,"start"]
RUN mkdir -p /app/logs
CMD ["sh", "-c", "npm start >> /app/logs/backend.log 2>&1"]
