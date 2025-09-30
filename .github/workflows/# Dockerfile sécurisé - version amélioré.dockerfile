# Dockerfile sécurisé - version améliorée
FROM python:3.11-slim-bookworm  # Version plus récente et sécurisée

# Créer un utilisateur non-root
RUN adduser --disabled-password --gecos '' appuser

WORKDIR /app

# Copier requirements d'abord (meilleure utilisation du cache)
COPY requirements.txt .

# Mettre à jour pip et installer les dépendances
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . .

# Changer les permissions
RUN chown -R appuser:appuser /app

# Basculer vers l'utilisateur non-root
USER appuser

EXPOSE 3000

CMD ["python", "app.py"]