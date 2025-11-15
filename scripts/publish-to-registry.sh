#!/bin/bash#!/bin/bash



# Script de Publicación Automatizada - HL7 Costa Rica# Script de Publicación Automatizada - HL7 Costa Rica

# Uso: ./scripts/publish-to-registry.sh [VERSION]# Uso: ./scripts/publish-to-registry.sh [VERSION]



set -eset -e



# ========================================# ========================================

# Configuración# Configuración

# ========================================# ========================================



# Colores# Colores

RED='\033[0;31m'RED='\033[0;31m'

GREEN='\033[0;32m'GREEN='\033[0;32m'

YELLOW='\033[1;33m'YELLOW='\033[1;33m'

BLUE='\033[0;34m'BLUE='\033[0;34m'

NC='\033[0m'NC='\033[0m'



# Configuración del servidor# Configuración del servidor

SERVER_HOST="hl7.or.cr"SERVER_HOST="hl7.or.cr"

SERVER_USER="${DEPLOY_USER:-hl7cr}"SERVER_USER="${DEPLOY_USER:-hl7cr}"

REMOTE_PATH="/home/hl7cr/packages"REMOTE_PATH="/home/hl7cr/packages"



# Configuración del paquete# Configuración del paquete

PACKAGE_NAME="hl7.fhir.cr.terminology"PACKAGE_NAME="hl7.fhir.cr.terminology"



# ========================================# ========================================

# Funciones# Funciones

# ========================================# ========================================



print_header() {print_header() {

    echo ""    echo ""

    echo -e "${BLUE}════════════════════════════════════════════════════════${NC}"    echo -e "${BLUE}════════════════════════════════════════════════════════${NC}"

    echo -e "${BLUE}  $1${NC}"    echo -e "${BLUE}  $1${NC}"

    echo -e "${BLUE}════════════════════════════════════════════════════════${NC}"    echo -e "${BLUE}════════════════════════════════════════════════════════${NC}"

    echo ""    echo ""

}}



print_info() {print_info() {

    echo -e "${BLUE}ℹ ${1}${NC}"    echo -e "${BLUE}ℹ ${1}${NC}"

}}



print_success() {print_success() {

    echo -e "${GREEN}✓ ${1}${NC}"    echo -e "${GREEN}✓ ${1}${NC}"

}}



print_warning() {print_warning() {

    echo -e "${YELLOW}⚠ ${1}${NC}"    echo -e "${YELLOW}⚠ ${1}${NC}"

}}



print_error() {print_error() {

    echo -e "${RED}✗ ${1}${NC}"    echo -e "${RED}✗ ${1}${NC}"

}}



# ========================================# ========================================

# Verificaciones Previas# Verificaciones Previas

# ========================================# ========================================



print_header "Publicación de Paquete - HL7 Costa Rica"print_header "Publicación de Paquete - HL7 Costa Rica"



# Verificar que estamos en el directorio correcto# Verificar que estamos en el directorio correcto

if [ ! -f "sushi-config.yaml" ]; thenif [ ! -f "sushi-config.yaml" ]; then

    print_error "No se encontró sushi-config.yaml"    print_error "No se encontró sushi-config.yaml"

    print_info "Ejecuta este script desde la raíz de la IG"    print_info "Ejecuta este script desde la raíz de la IG"

    exit 1    exit 1

fifi



# Obtener versión# Obtener versión

if [ -z "$1" ]; thenif [ -z "$1" ]; then

    VERSION=$(grep "^version:" sushi-config.yaml | awk '{print $2}')    VERSION=$(grep "^version:" sushi-config.yaml | awk '{print $2}')

    print_info "Versión detectada desde sushi-config.yaml: $VERSION"    print_info "Versión detectada desde sushi-config.yaml: $VERSION"

elseelse

    VERSION=$1    VERSION=$1

    print_info "Versión especificada: $VERSION"    print_info "Versión especificada: $VERSION"

fifi



# Verificar archivos de salida# Verificar archivos de salida

if [ ! -f "output/package.tgz" ]; thenif [ ! -f "output/package.tgz" ]; then

    print_error "No se encontró output/package.tgz"    print_error "No se encontró output/package.tgz"

    print_info "Ejecuta primero ./_genonce.sh para generar el paquete"    print_info "Ejecuta primero ./_genonce.sh para generar el paquete"

    exit 1    exit 1

fifi



if [ ! -f "output/package.manifest.json" ]; thenif [ ! -f "output/package.manifest.json" ]; then

    print_error "No se encontró output/package.manifest.json"    print_error "No se encontró output/package.manifest.json"

    exit 1    exit 1

fifi



print_success "Archivos de paquete encontrados"print_success "Archivos de paquete encontrados"



# ========================================# ========================================

# Información del Paquete# Información del Paquete

# ========================================# ========================================



echo ""echo ""

print_info "═══ Información del Paquete ═══"print_info "═══ Información del Paquete ═══"

echo "  Nombre:      $PACKAGE_NAME"echo "  Nombre:      $PACKAGE_NAME"

echo "  Versión:     $VERSION"echo "  Versión:     $VERSION"

echo "  Servidor:    $SERVER_HOST"echo "  Servidor:    $SERVER_HOST"

echo "  Usuario:     $SERVER_USER"echo "  Usuario:     $SERVER_USER"

echo ""echo ""



PACKAGE_SIZE=$(du -h output/package.tgz | cut -f1)PACKAGE_SIZE=$(du -h output/package.tgz | cut -f1)

print_info "Tamaño del paquete: $PACKAGE_SIZE"print_info "Tamaño del paquete: $PACKAGE_SIZE"



# ========================================# ========================================

# Confirmación# Confirmación

# ========================================# ========================================



echo ""echo ""

read -p "¿Continuar con la publicación? (s/N): " confirmread -p "¿Continuar con la publicación? (s/N): " confirm

if [[ ! $confirm =~ ^[Ss]$ ]]; thenif [[ ! $confirm =~ ^[Ss]$ ]]; then

    print_warning "Publicación cancelada"    print_warning "Publicación cancelada"

    exit 0    exit 0

fifi



# ========================================# ========================================

# Publicación# Publicación

# ========================================# ========================================



print_header "Proceso de Publicación"print_header "Proceso de Publicación"



# 1. Verificar conexión SSH# 1. Verificar conexión SSH

print_info "Verificando conexión con el servidor..."print_info "Verificando conexión con el servidor..."

if ! ssh -q $SERVER_USER@$SERVER_HOST exit; thenif ! ssh -q $SERVER_USER@$SERVER_HOST exit; then

    print_error "No se puede conectar al servidor"    print_error "No se puede conectar al servidor"

    print_info "Verifica tu conexión SSH o las credenciales"    print_info "Verifica tu conexión SSH o las credenciales"

    exit 1    exit 1

fifi

print_success "Conexión establecida"print_success "Conexión establecida"



# 2. Crear directorios en el servidor# 2. Crear directorios en el servidor

print_info "Creando estructura de directorios..."print_info "Creando estructura de directorios..."

ssh $SERVER_USER@$SERVER_HOST "mkdir -p $REMOTE_PATH/$PACKAGE_NAME/$VERSION"ssh $SERVER_USER@$SERVER_HOST "mkdir -p $REMOTE_PATH/$PACKAGE_NAME/$VERSION"

print_success "Directorios creados"print_success "Directorios creados"



# 3. Subir package.tgz# 3. Subir package.tgz

print_info "Subiendo package.tgz..."print_info "Subiendo package.tgz..."

scp -q output/package.tgz \scp -q output/package.tgz \

    $SERVER_USER@$SERVER_HOST:$REMOTE_PATH/$PACKAGE_NAME/$VERSION/package.tgz    $SERVER_USER@$SERVER_HOST:$REMOTE_PATH/$PACKAGE_NAME/$VERSION/package.tgz

print_success "package.tgz subido"print_success "package.tgz subido"



# 4. Subir package.manifest.json# 4. Subir package.manifest.json

print_info "Subiendo package.manifest.json..."print_info "Subiendo package.manifest.json..."

scp -q output/package.manifest.json \scp -q output/package.manifest.json \

    $SERVER_USER@$SERVER_HOST:$REMOTE_PATH/$PACKAGE_NAME/package.manifest.json    $SERVER_USER@$SERVER_HOST:$REMOTE_PATH/$PACKAGE_NAME/package.manifest.json

print_success "package.manifest.json subido"print_success "package.manifest.json subido"



# 5. Ajustar permisos# 5. Ajustar permisos

print_info "Ajustando permisos..."print_info "Ajustando permisos..."

ssh $SERVER_USER@$SERVER_HOST "ssh $SERVER_USER@$SERVER_HOST "

    chmod -R 755 $REMOTE_PATH/$PACKAGE_NAME    chmod -R 755 $REMOTE_PATH/$PACKAGE_NAME

    chmod 644 $REMOTE_PATH/$PACKAGE_NAME/$VERSION/package.tgz    chmod 644 $REMOTE_PATH/$PACKAGE_NAME/$VERSION/package.tgz

    chmod 644 $REMOTE_PATH/$PACKAGE_NAME/package.manifest.json    chmod 644 $REMOTE_PATH/$PACKAGE_NAME/package.manifest.json

""

print_success "Permisos ajustados"print_success "Permisos ajustados"



# ========================================# ========================================

# Verificación# Verificación

# ========================================# ========================================



print_header "Verificación Post-Publicación"print_header "Verificación Post-Publicación"



MANIFEST_URL="https://$SERVER_HOST/fhir/packages/$PACKAGE_NAME/package.manifest.json"MANIFEST_URL="https://$SERVER_HOST/fhir/packages/$PACKAGE_NAME/package.manifest.json"

PACKAGE_URL="https://$SERVER_HOST/fhir/packages/$PACKAGE_NAME/$VERSION/package.tgz"PACKAGE_URL="https://$SERVER_HOST/fhir/packages/$PACKAGE_NAME/$VERSION/package.tgz"



# Verificar manifest# Verificar manifest

print_info "Verificando manifest..."print_info "Verificando manifest..."

if curl -sf "$MANIFEST_URL" > /dev/null; thenif curl -sf "$MANIFEST_URL" > /dev/null; then

    print_success "Manifest accesible"    print_success "Manifest accesible"

    echo "   URL: $MANIFEST_URL"    echo "   URL: $MANIFEST_URL"

elseelse

    print_error "Manifest no accesible"    print_error "Manifest no accesible"

    echo "   URL: $MANIFEST_URL"    echo "   URL: $MANIFEST_URL"

fifi



# Verificar paquete# Verificar paquete

print_info "Verificando paquete..."print_info "Verificando paquete..."

if curl -sf -I "$PACKAGE_URL" > /dev/null; thenif curl -sf -I "$PACKAGE_URL" > /dev/null; then

    print_success "Paquete accesible"    print_success "Paquete accesible"

    echo "   URL: $PACKAGE_URL"    echo "   URL: $PACKAGE_URL"

elseelse

    print_error "Paquete no accesible"    print_error "Paquete no accesible"

    echo "   URL: $PACKAGE_URL"    echo "   URL: $PACKAGE_URL"

fifi



# ========================================# ========================================

# Resumen# Resumen

# ========================================# ========================================



print_header "Publicación Completada"print_header "Publicación Completada"



print_success "Paquete $PACKAGE_NAME versión $VERSION publicado exitosamente"print_success "Paquete $PACKAGE_NAME versión $VERSION publicado exitosamente"

echo ""echo ""

echo "📋 URLs Públicas:"echo "📋 URLs Públicas:"

echo "   Manifest: $MANIFEST_URL"echo "   Manifest: $MANIFEST_URL"

echo "   Package:  $PACKAGE_URL"echo "   Package:  $PACKAGE_URL"

echo ""echo ""

echo "🔧 Para usar en otra IG, agrega a package-registry.json:"echo "🔧 Para usar en otra IG, agrega a package-registry.json:"

echo '   {"url": "https://hl7.or.cr/fhir/packages"}'echo '   {"url": "https://hl7.or.cr/fhir/packages"}'

echo ""echo ""

echo "📝 Y en sushi-config.yaml:"echo "📝 Y en sushi-config.yaml:"

echo "   dependencies:"echo "   dependencies:"

echo "     $PACKAGE_NAME: $VERSION"echo "     $PACKAGE_NAME: $VERSION"

echo ""echo ""



print_info "¡Listo para usar! 🎉"print_info "¡Listo para usar! 🎉"

