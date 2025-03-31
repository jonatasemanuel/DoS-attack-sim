# Usar a imagem oficial do Apache
FROM httpd:latest

# Copiar a página web de exemplo para o diretório do Apache
COPY index.html /usr/local/apache2/htdocs/

# Expor a porta 80
EXPOSE 80

# Iniciar o Apache
CMD ["httpd", "-D", "FOREGROUND"]

