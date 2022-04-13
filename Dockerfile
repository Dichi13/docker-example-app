# image dasar yang digunakan (node v16)
FROM node:16

# pindah ke dalam /usr/src/app dan menjadikannya sebagai working directory
WORKDIR /usr/src/app

# menyalin seluruh file yang diawali "package" dan diakhiri ".json" ke dalam working directory
COPY package*.json ./

# menjalankan command npm install untuk menginstall dependensi
RUN npm install

# salin seluruh file di dalam repo ke dalam working directory
COPY . .

# memberi informasi di dalam image yang akan dibuat bahwa image ini mengekspos port 3000
EXPOSE 3000

# mengeksekusi command utama untuk menjalankan aplikasi (dengan npm start)
CMD [ "npm", "start" ]