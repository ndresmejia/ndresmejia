#!/bin/bash

# Script: Crear y subir un repositorio a GitHub
# Autor: Andrés Mejía
# Descripción: Automatiza la creación de un repositorio local y remoto en GitHub.

# CONFIGURA TU USUARIO
USUARIO_GITHUB="tu-usuario"         # ← Cambia esto por tu nombre de usuario en GitHub
NOMBRE_REPO="mi-proyecto"           # ← Cambia esto por el nombre que desees para tu repositorio
DESCRIPCION="Repositorio creado automáticamente desde bash"
PRIVADO=false                        # true para repositorio privado, false para público

# CREA EL DIRECTORIO Y ARCHIVOS
mkdir "$NOMBRE_REPO"
cd "$NOMBRE_REPO"
echo "# $NOMBRE_REPO" > README.md

git init
git add .
git commit -m "Primer commit"

# CREA EL REPOSITORIO EN GITHUB (requiere GitHub CLI)
gh repo create "$USUARIO_GITHUB/$NOMBRE_REPO" \
  --description "$DESCRIPCION" \
  --source=. \
  --remote=origin \
  --push \
  $( [ "$PRIVADO" = true ] && echo "--private" || echo "--public" )

# FIN DEL SCRIPT
echo "✅ Repositorio '$NOMBRE_REPO' creado y subido a GitHub con éxito."
