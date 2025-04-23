FROM python:3.11-slim

# Instala dependências básicas + Chrome
RUN apt-get update && apt-get install -y \ 
    wget unzip gnupg curl \ 
    chromium chromium-driver \ 
    && rm -rf /var/lib/apt/lists/*

# Variáveis de ambiente para o Chrome headless
ENV CHROME_BIN=/usr/bin/chromium
ENV CHROMEDRIVER_BIN=/usr/bin/chromedriver

# Diretório da app
WORKDIR /app

# Copia arquivos
COPY . /app

# Instala dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Expõe a porta padrão do Flask
EXPOSE 5000

# Roda a aplicação Flask
CMD ["python", "painel_alertas_futebol.py"]
