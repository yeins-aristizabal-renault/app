# Usa imagem oficial do Python
FROM python:3.11-slim

# Define diretório de trabalho
WORKDIR /app

# Atualiza o pip e instala dependências
COPY requirements.txt requirements.txt

RUN pip install --upgrade pip setuptools wheel
RUN pip install --no-cache-dir -r requirements.txt

# Copia os arquivos locais pro container
COPY . .

# Expõe a porta usada pelo Streamlit
EXPOSE 8080

# Comando para rodar o app
CMD ["streamlit", "run", "app.py", "--server.port=8080", "--server.enableCORS=false"]
