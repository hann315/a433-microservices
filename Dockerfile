# Menggunakan node versi 18-alpine sebagai base image dan diberi nama builder
FROM node:18-alpine as builder

# Menyetel working directory ke /app
WORKDIR /app

# Menyalin package.json dan package-lock.json ke working directory
COPY package* ./

# Menjalankan perintah npm install
RUN npm ci

# Menyalin seluruh file JS ke working directory
COPY ./*.js ./

# Mengekspos port 3001
EXPOSE 3000

# Menjalankan perintah npm start
CMD ["node", "index.js"]