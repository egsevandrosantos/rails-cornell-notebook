# Escolhe a imagem Ruby
FROM ruby:2.7.1-slim
# Instala dependencias
RUN apt-get update && apt-get install -qq -y --no-install-recommends \
    build-essential nodejs libpq-dev imagemagick
# Coloca o diretório padrão nos environments
ENV INSTALL_PATH /cornell-notebook
# Cria o diretório da aplicação
RUN mkdir -p ${INSTALL_PATH}
# Seta o diretório da aplicação como local padrão para trabalhar
WORKDIR ${INSTALL_PATH}
# Copia o Gemfile local para a máquina Docker
COPY Gemfile .
# Seta o local das gems como /gems
ENV BUNDLE_PATH /gems
# Copia o código da máquina local para a máquina Docker
COPY . .