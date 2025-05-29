# Usa imagem oficial do Python
FROM python:3.9-slim

# Define diretório de trabalho
WORKDIR /app


# Atualiza o pip e instala dependências
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copia os arquivos locais pro container
COPY . .

# Expõe a porta usada pelo Streamlit
EXPOSE 8501

# Comando para rodar o app
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.enableCORS=false"]