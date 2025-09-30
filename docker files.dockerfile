FROM python:3.9-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier les requirements d'abord (optimisation du cache Docker)
COPY requirements.txt .

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Copier tout le code source
COPY . .

# Exposer le port
EXPOSE 3000

# Commande de démarrage
CMD ["python", "app.py"]