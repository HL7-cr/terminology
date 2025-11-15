#!/bin/bash

# Script para generar package.manifest.json
# Uso: ./scripts/generate-manifest.sh

set -e

# Colores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

print_info() {
    echo -e "${BLUE}ℹ ${1}${NC}"
}

print_success() {
    echo -e "${GREEN}✓ ${1}${NC}"
}

print_error() {
    echo -e "${RED}✗ ${1}${NC}"
}

# Verificar que estamos en el directorio correcto
if [ ! -f "sushi-config.yaml" ]; then
    print_error "No se encontró sushi-config.yaml"
    print_info "Ejecuta este script desde la raíz de la IG"
    exit 1
fi

# Extraer información de sushi-config.yaml
VERSION=$(grep "^version:" sushi-config.yaml | awk '{print $2}')
PACKAGE_ID=$(grep "^packageId:" sushi-config.yaml | awk '{print $2}')
CANONICAL=$(grep "^canonical:" sushi-config.yaml | awk '{print $2}')
FHIR_VERSION=$(grep "^fhirVersion:" sushi-config.yaml | awk '{print $2}')
JURISDICTION=$(grep "^jurisdiction:" sushi-config.yaml | awk '{print $2}' | tr -d "'")
DATE=$(date +%Y%m%d)

print_info "Generando package.manifest.json..."
echo "  Package: $PACKAGE_ID"
echo "  Version: $VERSION"
echo "  FHIR: $FHIR_VERSION"
echo "  Canonical: $CANONICAL"
echo ""

# Crear el archivo JSON
cat > output/package.manifest.json << EOF
{
  "version": "$VERSION",
  "fhirVersion": ["$FHIR_VERSION"],
  "date": "$DATE",
  "name": "$PACKAGE_ID",
  "jurisdiction": "$JURISDICTION",
  "canonical": "$CANONICAL"
}
EOF

print_success "Archivo generado: output/package.manifest.json"
echo ""
cat output/package.manifest.json
echo ""

# Preguntar si copiar al servidor
read -p "¿Copiar al servidor hl7.or.cr ahora? (s/N): " confirm
if [[ $confirm =~ ^[Ss]$ ]]; then
    print_info "Copiando al servidor..."
    
    # Crear directorio si no existe
    ssh hl7cr@hl7.or.cr "mkdir -p /home/hl7cr/packages/$PACKAGE_ID"
    
    # Copiar archivo
    scp output/package.manifest.json hl7cr@hl7.or.cr:/home/hl7cr/packages/$PACKAGE_ID/
    
    print_success "Archivo copiado al servidor"
    echo "  URL: https://hl7.or.cr/fhir/packages/$PACKAGE_ID/package.manifest.json"
else
    print_info "Para copiar manualmente:"
    echo "  scp output/package.manifest.json hl7cr@hl7.or.cr:/home/hl7cr/packages/$PACKAGE_ID/"
fi

echo ""
print_success "¡Listo!"
