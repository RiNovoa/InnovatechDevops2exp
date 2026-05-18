# Etapa 1: Build
FROM node:18-alpine AS builder
WORKDIR /app
# Copiar archivos de dependencias
COPY package*.json ./
RUN npm ci
# Copiar el resto del código
COPY . .
# Construir la aplicación (Vite genera en /dist)
RUN npm run build

# Etapa 2: Servir con nginx
FROM nginx:alpine
# Copiar los archivos estáticos generados
COPY --from=builder /app/dist /usr/share/nginx/html
# Exponer puerto 80
EXPOSE 80
# Nginx se ejecuta en foreground por defecto
CMD ["nginx", "-g", "daemon off;"]