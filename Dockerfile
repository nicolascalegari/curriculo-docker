# 1. Imagem base oficial e leve do Nginx
FROM nginx:1.27-alpine

# 2. Metadados do mantenedor (boa prática)
LABEL maintainer="nacalegari@hotmail.com"
LABEL description="Currículo estático servido via Nginx"

# 3. Define o diretório padrão onde o Nginx busca os arquivos estáticos
WORKDIR /usr/share/nginx/html

# 4. Remove os arquivos padrão do Nginx para evitar conflitos
RUN rm -rf ./*

# 5. Copia apenas o conteúdo da pasta src para o diretório de trabalho do contêiner
COPY src/ .

# 6. Documenta que o contêiner escuta na porta 80
EXPOSE 80