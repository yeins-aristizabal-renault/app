# Usa imagem oficial do Python
FROM python:3.9-slim

# Instala dependencias necesarias del sistema
RUN apt-get update && apt-get install -y \
    gcc \
    build-essential \
    libffi-dev \
    libpq-dev \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*
    
# Define diretório de trabalho
WORKDIR /app

# Atualiza o pip e instala dependências
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copia os arquivos locais pro container
COPY . .

# Expõe a porta usada pelo Streamlit
EXPOSE 8080

# Comando para rodar o app
CMD ["streamlit", "run", "app.py", "--server.port=8080", "--server.address=0.0.0.0", "--server.enableCORS=false"]
