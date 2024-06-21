# 使用官方的 Node 镜像作为基础镜像
FROM node:22.0.0

# 设置工作目录
WORKDIR /app

# 将本地的 Vite 项目文件复制到工作目录
COPY . .

# npm 源，选用国内镜像源以提高下载速度
RUN npm config set registry https://registry.npmmirror.com

# 安装依赖
RUN npm install

# 执行 Vite 构建命令，生成 dist 目录
RUN npm run build

# 使用 Nginx 镜像作为运行时镜像
FROM nginx:latest

RUN mkdir /app

RUN echo "deb [check-valid-until=no] http://cdn-fastly.deb.debian.org/debian jessie main" > /etc/apt/sources.list.d/jessie.list
RUN echo "deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main" > /etc/apt/sources.list.d/jessie-backports.list
RUN sed -i '/deb http:\/\/deb.debian.org\/debian jessie-updates main/d' /etc/apt/sources.list
RUN apt-get -o Acquire::Check-Valid-Until=false update
RUN apt-get install -y vim

RUN rm -f /etc/nginx/conf.d/*

# 将 Vite 项目的 dist 目录复制到 Nginx 的默认静态文件目录
COPY --from=0 /app/dist /app

COPY --from=0 /app/deploy/mnemosyne-nginx.conf /etc/nginx/conf.d/mnemosyne-nginx.conf

# 暴露容器的 80 端口
EXPOSE 80

# Nginx 会在容器启动时自动运行，无需手动设置 CMD
