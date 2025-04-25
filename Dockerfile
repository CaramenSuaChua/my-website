# Sử dụng node để build ứng dụng React
FROM node:18 AS build

# Thiết lập thư mục làm việc trong container
WORKDIR /app

# Copy file package.json và package-lock.json vào container
COPY package.json package-lock.json ./

# Cài đặt dependencies
RUN npm install

# Copy toàn bộ source code vào container
COPY . .
# Build ứng dụng React
RUN npm run build
# -------------------------------

# Sử dụng Nginx để chạy ứng dụng
FROM nginx:1.23

# Copy file build vào thư mục phục vụ của Nginx
COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

# Chạy Nginx
CMD ["nginx", "-g", "daemon off;"]
