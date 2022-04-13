# Assignment - Creating Docker Image using Dockerfile and Basic docker-compose

Dikerjakan oleh Rizky Andyno Ramadhan

# Soal

## 1. Jelaskan isi dari Dockerfile yang digunakan untuk membuat docker image.
```dockerfile
# image dasar yang digunakan (node v16)
FROM node:16

# pindah ke dalam /usr/src/app dan menjadikannya sebagai working directory
WORKDIR /usr/src/app

# menyalin seluruh file yang diawali "package" dan diakhiri ".json" ke dalam working directory
# hanya file package json yang disalin untuk memanfaatkan layer caching dari docker (apabila package.json tidak berubah tidak perlu instal ulang)
COPY package*.json ./

# menjalankan command npm install untuk menginstall dependensi
RUN npm install

# salin seluruh file source ke dalam working directory
COPY . .

# memberi informasi di dalam image yang akan dibuat bahwa image ini mengekspos port 3000
EXPOSE 3000

# mengeksekusi command utama untuk menjalankan aplikasi (dengan npm start)
CMD [ "npm", "start" ]
```

## 2. Tuliskan wujud dari docker-compose yang dibuat ke dalam docker command

Isi dari `docker-compose.yaml` bisa dilihat di repo ini.

1. **mongo**
   `docker run --name mongo --mount source=mongo_data,target=/data/db --restart always -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=admin mongo:latest`
2. **mongo-express**
   `docker run --name mongo-express --restart always -p 8081:8081 -e ME_CONFIG_MONGODB_ADMINUSERNAME=root -e ME_CONFIG_MONGODB_ADMINPASSWORD=admin -e ME_CONFIG_MONGODB_SERVER=mongo mongo-express`
3. **example-app**
   `docker run --name example-app -p 3000:3000 --restart always -e MONGO_SERVER=mongodb://root:admin@mongo:27017/ dichi/example-app`
