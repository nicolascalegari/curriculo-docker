# Currículo Estático Containerizado com Nginx e Docker

![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Nginx](https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white)

## Apresentação do Projeto

Este projeto consiste em uma página web estática (HTML5 e CSS3) contendo o meu currículo profissional, empacotada e servida através de um servidor web **Nginx** dentro de um contêiner **Docker**.

O objetivo principal deste repositório é demonstrar na prática a criação de imagens Docker enxutas, seguras e prontas para distribuição pública via **Docker Hub**, permitindo que qualquer pessoa execute a aplicação localmente com um único comando, sem depender de configurações prévias de ambiente.

---

## Como o Projeto Foi Feito

1. **Desenvolvimento da Interface Estática:** Criação de uma página limpa e responsiva em `HTML5` e `CSS3` dentro do diretório `src/`, separando o código-fonte dos arquivos de infraestrutura.
2. **Definição da Imagem (Dockerfile):** Configuração de um `Dockerfile` personalizado a partir da imagem oficial do Nginx baseada em Alpine Linux, substituindo a página padrão do servidor pelos arquivos do currículo.
3. **Isolamento do Contexto de Build:** Criação do arquivo `.dockerignore` na raiz do projeto para filtrar arquivos de documentação, controle de versão (`.git`) e arquivos temporários do sistema operacional antes do envio ao Docker Daemon.
4. **Versionamento e Publicação:** Build local da imagem utilizando versionamento semântico (`1.0.0` e `latest`) e publicação no registro público do Docker Hub (`nicolascalegari/curriculo-nginx`).

### Estrutura de Diretórios

    curriculo-docker/
    ├── src/
    │   ├── index.html       # Estrutura semântica do currículo
    │   └── style.css        # Estilização responsiva
    ├── .dockerignore        # Filtro de arquivos ignorados no build
    ├── .gitignore           # Filtro de arquivos ignorados pelo Git
    ├── Dockerfile           # Instruções de construção da imagem
    └── README.md            # Documentação do projeto

---

## Técnicas e Boas Práticas Utilizadas

* **Imagem Base Minimalista (`nginx:1.27-alpine`):** Utilização de distribuição Alpine Linux para reduzir drasticamente o tamanho final da imagem (~40 MB) e diminuir a superfície de ataque.
* **Instruções Declarativas de `Dockerfile`:** Uso adequado de `FROM`, `LABEL` (metadados), `WORKDIR`, `RUN` (limpeza de arquivos padrão do Nginx), `COPY` (cópia seletiva apenas do diretório `src/`) e `EXPOSE` (documentação da porta `80`).
* **Otimização de Contexto com `.dockerignore`:** Prevenção de vazamento de metadados locais e aceleração do tempo de build ao impedir que arquivos irrelevantes sejam copiados para as camadas da imagem.
* **Tagging Semântico:** Publicação no Docker Hub com tags de versão específica (`1.0.0`) e `latest`, garantindo rastreabilidade e reprodutibilidade.

---

## Como Executar o Projeto

### Opção 1: Diretamente via Docker Hub (Recomendado)

Não é necessário baixar o código-fonte. Basta ter o Docker instalado e executar:

    docker run -d -p 8080:80 --name curriculo-nicolas nicolascalegari/curriculo-nginx:1.0.0

Após iniciar o contêiner, acesse no navegador:

    http://localhost:8080

Para encerrar e remover o contêiner:

    docker rm -f curriculo-nicolas

### Opção 2: Construindo a Imagem Localmente

1. **Clone este repositório:**

       git clone https://github.com/nicolascalegari/curriculo-docker.git
       cd curriculo-docker

2. **Construa a imagem Docker:**

       docker build -t nicolascalegari/curriculo-nginx:1.0.0 -t nicolascalegari/curriculo-nginx:latest .

3. **Inicie o contêiner:**

       docker run -d -p 8080:80 --name curriculo-local nicolascalegari/curriculo-nginx:1.0.0

4. **Acesse no navegador:**
   `http://localhost:8080`

---

## Links Relacionados

* **Imagem Oficial no Docker Hub:** [hub.docker.com/r/nicolascalegari/curriculo-nginx](https://hub.docker.com/r/nicolascalegari/curriculo-nginx)
* **Repositório no GitHub:** [github.com/nicolascalegari/curriculo-docker](https://github.com/nicolascalegari/curriculo-docker)