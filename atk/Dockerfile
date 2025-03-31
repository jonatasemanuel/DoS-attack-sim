FROM alpine:3.21

# Instala dependências
RUN apk add --no-cache curl bash

# Copia o script de ataque para dentro do container
COPY http-flood.sh /flood.sh
RUN chmod +x /flood.sh

# Define o ponto de entrada padrão
ENTRYPOINT ["/bin/bash"]

