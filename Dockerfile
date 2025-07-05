# Use a imagem oficial do Python 3.13 com base no Alpine Linux
FROM python:3.13.5-alpine3.22

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo de requirements para o diretório de trabalho
COPY ./requirements.txt /app/requirements.txt

# Instala as dependências do projeto, sem usar cache para manter a imagem menor
RUN pip install --no-cache-dir -r /app/requirements.txt

# Copia todo o código do projeto para o diretório de trabalho
COPY ./ /app

# Define o comando para iniciar a aplicação usando Uvicorn
# O aplicativo será executado na porta 8000 e estará acessível externamente
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]