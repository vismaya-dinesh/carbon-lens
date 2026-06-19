FROM python:3.10-slim
WORKDIR /app
COPY index.html .
COPY server.py .
EXPOSE 8080
CMD ["python", "server.py"]
