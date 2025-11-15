#!/bin/bash#!/bin/bash



# Script de Diagnóstico - Servidor de Paquetes FHIR# Script de Diagnóstico - Servidor de Paquetes FHIR

# Uso: ./scripts/diagnostico.sh [DOMINIO]# Uso: ./scripts/diagnostico.sh [DOMINIO]



set -eset -e



# Colores# Colores

RED='\033[0;31m'RED='\033[0;31m'

GREEN='\033[0;32m'GREEN='\033[0;32m'

YELLOW='\033[1;33m'YELLOW='\033[1;33m'

BLUE='\033[0;34m'BLUE='\033[0;34m'

NC='\033[0m'NC='\033[0m'



# Configuración# Configuración

DOMAIN="${1:-hl7.or.cr}"DOMAIN="${1:-hl7.or.cr}"

PACKAGE_NAME="hl7.fhir.cr.terminology"PACKAGE_NAME="hl7.fhir.cr.terminology"

VERSION="0.1.1"VERSION="0.1.1"



print_header() {print_header() {

    echo ""    echo ""

    echo -e "${BLUE}════════════════════════════════════════════════════════${NC}"    echo -e "${BLUE}════════════════════════════════════════════════════════${NC}"

    echo -e "${BLUE}  $1${NC}"    echo -e "${BLUE}  $1${NC}"

    echo -e "${BLUE}════════════════════════════════════════════════════════${NC}"    echo -e "${BLUE}════════════════════════════════════════════════════════${NC}"

    echo ""    echo ""

}}



print_check() {print_check() {

    echo -e "${BLUE}🔍 $1${NC}"    echo -e "${BLUE}🔍 $1${NC}"

}}



print_success() {print_success() {

    echo -e "${GREEN}  ✅ $1${NC}"    echo -e "${GREEN}  ✅ $1${NC}"

}}



print_error() {print_error() {

    echo -e "${RED}  ❌ $1${NC}"    echo -e "${RED}  ❌ $1${NC}"

}}



print_warning() {print_warning() {

    echo -e "${YELLOW}  ⚠️  $1${NC}"    echo -e "${YELLOW}  ⚠️  $1${NC}"

}}



print_info() {print_info() {

    echo -e "  ℹ️  $1"    echo -e "  ℹ️  $1"

}}



# ========================================# ========================================

# Diagnóstico# Diagnóstico

# ========================================# ========================================



print_header "Diagnóstico del Servidor de Paquetes FHIR"print_header "Diagnóstico del Servidor de Paquetes FHIR"

echo "Dominio: $DOMAIN"echo "Dominio: $DOMAIN"

echo "Paquete: $PACKAGE_NAME"echo "Paquete: $PACKAGE_NAME"

echo "Versión: $VERSION"echo "Versión: $VERSION"

echo ""echo ""



TOTAL_CHECKS=0TOTAL_CHECKS=0

PASSED_CHECKS=0PASSED_CHECKS=0

FAILED_CHECKS=0FAILED_CHECKS=0

WARNING_CHECKS=0WARNING_CHECKS=0



# ========================================# ========================================

# 1. Verificar Archivos Locales# 1. Verificar Archivos Locales

# ========================================# ========================================



print_header "1. Archivos Locales"print_header "1. Archivos Locales"



print_check "Verificando sushi-config.yaml..."print_check "Verificando sushi-config.yaml..."

TOTAL_CHECKS=$((TOTAL_CHECKS + 1))TOTAL_CHECKS=$((TOTAL_CHECKS + 1))

if [ -f "sushi-config.yaml" ]; thenif [ -f "sushi-config.yaml" ]; then

    print_success "Existe"    print_success "Existe"

    PASSED_CHECKS=$((PASSED_CHECKS + 1))    PASSED_CHECKS=$((PASSED_CHECKS + 1))

        

    # Verificar configuración    # Verificar configuración

    VERSION_CONFIG=$(grep "^version:" sushi-config.yaml | awk '{print $2}')    VERSION_CONFIG=$(grep "^version:" sushi-config.yaml | awk '{print $2}')

    print_info "Versión configurada: $VERSION_CONFIG"    print_info "Versión configurada: $VERSION_CONFIG"

        

    CANONICAL=$(grep "^canonical:" sushi-config.yaml | awk '{print $2}')    CANONICAL=$(grep "^canonical:" sushi-config.yaml | awk '{print $2}')

    print_info "Canonical: $CANONICAL"    print_info "Canonical: $CANONICAL"

elseelse

    print_error "No existe"    print_error "No existe"

    FAILED_CHECKS=$((FAILED_CHECKS + 1))    FAILED_CHECKS=$((FAILED_CHECKS + 1))

fifi



print_check "Verificando output/package.tgz..."print_check "Verificando output/package.tgz..."

TOTAL_CHECKS=$((TOTAL_CHECKS + 1))TOTAL_CHECKS=$((TOTAL_CHECKS + 1))

if [ -f "output/package.tgz" ]; thenif [ -f "output/package.tgz" ]; then

    SIZE=$(du -h output/package.tgz | cut -f1)    SIZE=$(du -h output/package.tgz | cut -f1)

    print_success "Existe ($SIZE)"    print_success "Existe ($SIZE)"

    PASSED_CHECKS=$((PASSED_CHECKS + 1))    PASSED_CHECKS=$((PASSED_CHECKS + 1))

elseelse

    print_error "No existe - ejecuta ./_genonce.sh"    print_error "No existe - ejecuta ./_genonce.sh"

    FAILED_CHECKS=$((FAILED_CHECKS + 1))    FAILED_CHECKS=$((FAILED_CHECKS + 1))

fifi



print_check "Verificando output/package.manifest.json..."print_check "Verificando output/package.manifest.json..."

TOTAL_CHECKS=$((TOTAL_CHECKS + 1))TOTAL_CHECKS=$((TOTAL_CHECKS + 1))

if [ -f "output/package.manifest.json" ]; thenif [ -f "output/package.manifest.json" ]; then

    print_success "Existe"    print_success "Existe"

    PASSED_CHECKS=$((PASSED_CHECKS + 1))    PASSED_CHECKS=$((PASSED_CHECKS + 1))

        

    if command -v jq &> /dev/null; then    if command -v jq &> /dev/null; then

        MANIFEST_VERSION=$(jq -r '.version' output/package.manifest.json 2>/dev/null)        MANIFEST_VERSION=$(jq -r '.version' output/package.manifest.json 2>/dev/null)

        print_info "Versión en manifest: $MANIFEST_VERSION"        print_info "Versión en manifest: $MANIFEST_VERSION"

    fi    fi

elseelse

    print_error "No existe"    print_error "No existe"

    FAILED_CHECKS=$((FAILED_CHECKS + 1))    FAILED_CHECKS=$((FAILED_CHECKS + 1))

fifi



# ========================================# ========================================

# 2. Verificar Conectividad# 2. Verificar Conectividad

# ========================================# ========================================



print_header "2. Conectividad al Servidor"print_header "2. Conectividad al Servidor"



print_check "Resolviendo DNS para $DOMAIN..."print_check "Resolviendo DNS para $DOMAIN..."

TOTAL_CHECKS=$((TOTAL_CHECKS + 1))TOTAL_CHECKS=$((TOTAL_CHECKS + 1))

if host $DOMAIN &> /dev/null; thenif host $DOMAIN &> /dev/null; then

    IP=$(host $DOMAIN | grep "has address" | awk '{print $4}' | head -1)    IP=$(host $DOMAIN | grep "has address" | awk '{print $4}' | head -1)

    print_success "Resuelve a: $IP"    print_success "Resuelve a: $IP"

    PASSED_CHECKS=$((PASSED_CHECKS + 1))    PASSED_CHECKS=$((PASSED_CHECKS + 1))

elseelse

    print_error "No resuelve"    print_error "No resuelve"

    FAILED_CHECKS=$((FAILED_CHECKS + 1))    FAILED_CHECKS=$((FAILED_CHECKS + 1))

fifi



print_check "Verificando conexión HTTPS..."print_check "Verificando conexión HTTPS..."

TOTAL_CHECKS=$((TOTAL_CHECKS + 1))TOTAL_CHECKS=$((TOTAL_CHECKS + 1))

if curl -s -f -I "https://$DOMAIN/" &> /dev/null; thenif curl -s -f -I "https://$DOMAIN/" &> /dev/null; then

    print_success "Servidor accesible"    print_success "Servidor accesible"

    PASSED_CHECKS=$((PASSED_CHECKS + 1))    PASSED_CHECKS=$((PASSED_CHECKS + 1))

elseelse

    print_warning "No accesible o no responde HTTPS"    print_warning "No accesible o no responde HTTPS"

    WARNING_CHECKS=$((WARNING_CHECKS + 1))    WARNING_CHECKS=$((WARNING_CHECKS + 1))

fifi



print_check "Verificando certificado SSL..."print_check "Verificando certificado SSL..."

TOTAL_CHECKS=$((TOTAL_CHECKS + 1))TOTAL_CHECKS=$((TOTAL_CHECKS + 1))

if echo | openssl s_client -connect $DOMAIN:443 -servername $DOMAIN 2>/dev/null | openssl x509 -noout -dates &> /dev/null; thenif echo | openssl s_client -connect $DOMAIN:443 -servername $DOMAIN 2>/dev/null | openssl x509 -noout -dates &> /dev/null; then

    EXPIRY=$(echo | openssl s_client -connect $DOMAIN:443 -servername $DOMAIN 2>/dev/null | openssl x509 -noout -dates | grep "notAfter" | cut -d= -f2)    EXPIRY=$(echo | openssl s_client -connect $DOMAIN:443 -servername $DOMAIN 2>/dev/null | openssl x509 -noout -dates | grep "notAfter" | cut -d= -f2)

    print_success "Válido hasta: $EXPIRY"    print_success "Válido hasta: $EXPIRY"

    PASSED_CHECKS=$((PASSED_CHECKS + 1))    PASSED_CHECKS=$((PASSED_CHECKS + 1))

elseelse

    print_warning "No se pudo verificar"    print_warning "No se pudo verificar"

    WARNING_CHECKS=$((WARNING_CHECKS + 1))    WARNING_CHECKS=$((WARNING_CHECKS + 1))

fifi



# ========================================# ========================================

# 3. Verificar Estructura de Paquetes# 3. Verificar Estructura de Paquetes

# ========================================# ========================================



print_header "3. Estructura de Paquetes"print_header "3. Estructura de Paquetes"



MANIFEST_URL="https://$DOMAIN/fhir/packages/$PACKAGE_NAME/package.manifest.json"MANIFEST_URL="https://$DOMAIN/fhir/packages/$PACKAGE_NAME/package.manifest.json"

PACKAGE_URL="https://$DOMAIN/fhir/packages/$PACKAGE_NAME/$VERSION/package.tgz"PACKAGE_URL="https://$DOMAIN/fhir/packages/$PACKAGE_NAME/$VERSION/package.tgz"



print_check "Verificando manifest en: $MANIFEST_URL"print_check "Verificando manifest en: $MANIFEST_URL"

TOTAL_CHECKS=$((TOTAL_CHECKS + 1))TOTAL_CHECKS=$((TOTAL_CHECKS + 1))

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$MANIFEST_URL")HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$MANIFEST_URL")

if [ "$HTTP_CODE" = "200" ]; thenif [ "$HTTP_CODE" = "200" ]; then

    print_success "Accesible (HTTP $HTTP_CODE)"    print_success "Accesible (HTTP $HTTP_CODE)"

    PASSED_CHECKS=$((PASSED_CHECKS + 1))    PASSED_CHECKS=$((PASSED_CHECKS + 1))

        

    # Verificar contenido JSON    # Verificar contenido JSON

    if command -v jq &> /dev/null; then    if command -v jq &> /dev/null; then

        if curl -s "$MANIFEST_URL" | jq . &> /dev/null; then        if curl -s "$MANIFEST_URL" | jq . &> /dev/null; then

            print_info "JSON válido"            print_info "JSON válido"

            MANIFEST_VER=$(curl -s "$MANIFEST_URL" | jq -r '.version')            MANIFEST_VER=$(curl -s "$MANIFEST_URL" | jq -r '.version')

            print_info "Versión publicada: $MANIFEST_VER"            print_info "Versión publicada: $MANIFEST_VER"

        else        else

            print_warning "JSON inválido"            print_warning "JSON inválido"

        fi        fi

    fi    fi

elif [ "$HTTP_CODE" = "404" ]; thenelif [ "$HTTP_CODE" = "404" ]; then

    print_error "No encontrado (HTTP 404)"    print_error "No encontrado (HTTP 404)"

    FAILED_CHECKS=$((FAILED_CHECKS + 1))    FAILED_CHECKS=$((FAILED_CHECKS + 1))

    print_info "El paquete no ha sido publicado aún"    print_info "El paquete no ha sido publicado aún"

elseelse

    print_error "Error HTTP $HTTP_CODE"    print_error "Error HTTP $HTTP_CODE"

    FAILED_CHECKS=$((FAILED_CHECKS + 1))    FAILED_CHECKS=$((FAILED_CHECKS + 1))

fifi



print_check "Verificando paquete en: $PACKAGE_URL"print_check "Verificando paquete en: $PACKAGE_URL"

TOTAL_CHECKS=$((TOTAL_CHECKS + 1))TOTAL_CHECKS=$((TOTAL_CHECKS + 1))

HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$PACKAGE_URL")HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$PACKAGE_URL")

if [ "$HTTP_CODE" = "200" ]; thenif [ "$HTTP_CODE" = "200" ]; then

    SIZE=$(curl -s -I "$PACKAGE_URL" | grep -i "content-length" | awk '{print $2}' | tr -d '\r')    SIZE=$(curl -s -I "$PACKAGE_URL" | grep -i "content-length" | awk '{print $2}' | tr -d '\r')

    SIZE_KB=$((SIZE / 1024))    SIZE_KB=$((SIZE / 1024))

    print_success "Accesible (HTTP $HTTP_CODE, ${SIZE_KB}KB)"    print_success "Accesible (HTTP $HTTP_CODE, ${SIZE_KB}KB)"

    PASSED_CHECKS=$((PASSED_CHECKS + 1))    PASSED_CHECKS=$((PASSED_CHECKS + 1))

        

    # Verificar Content-Type    # Verificar Content-Type

    CONTENT_TYPE=$(curl -s -I "$PACKAGE_URL" | grep -i "content-type" | awk '{print $2}' | tr -d '\r')    CONTENT_TYPE=$(curl -s -I "$PACKAGE_URL" | grep -i "content-type" | awk '{print $2}' | tr -d '\r')

    if [[ "$CONTENT_TYPE" == *"gzip"* ]] || [[ "$CONTENT_TYPE" == *"octet-stream"* ]]; then    if [[ "$CONTENT_TYPE" == *"gzip"* ]] || [[ "$CONTENT_TYPE" == *"octet-stream"* ]]; then

        print_info "Content-Type: $CONTENT_TYPE"        print_info "Content-Type: $CONTENT_TYPE"

    else    else

        print_warning "Content-Type inesperado: $CONTENT_TYPE"        print_warning "Content-Type inesperado: $CONTENT_TYPE"

    fi    fi

elif [ "$HTTP_CODE" = "404" ]; thenelif [ "$HTTP_CODE" = "404" ]; then

    print_error "No encontrado (HTTP 404)"    print_error "No encontrado (HTTP 404)"

    FAILED_CHECKS=$((FAILED_CHECKS + 1))    FAILED_CHECKS=$((FAILED_CHECKS + 1))

elseelse

    print_error "Error HTTP $HTTP_CODE"    print_error "Error HTTP $HTTP_CODE"

    FAILED_CHECKS=$((FAILED_CHECKS + 1))    FAILED_CHECKS=$((FAILED_CHECKS + 1))

fifi



# ========================================# ========================================

# 4. Verificar CORS# 4. Verificar CORS

# ========================================# ========================================



print_header "4. Configuración CORS"print_header "4. Configuración CORS"



print_check "Verificando headers CORS..."print_check "Verificando headers CORS..."

TOTAL_CHECKS=$((TOTAL_CHECKS + 1))TOTAL_CHECKS=$((TOTAL_CHECKS + 1))

CORS_HEADER=$(curl -s -I -H "Origin: https://example.com" "$MANIFEST_URL" | grep -i "access-control-allow-origin" | tr -d '\r')CORS_HEADER=$(curl -s -I -H "Origin: https://example.com" "$MANIFEST_URL" | grep -i "access-control-allow-origin" | tr -d '\r')

if [ ! -z "$CORS_HEADER" ]; thenif [ ! -z "$CORS_HEADER" ]; then

    print_success "CORS configurado"    print_success "CORS configurado"

    print_info "$CORS_HEADER"    print_info "$CORS_HEADER"

    PASSED_CHECKS=$((PASSED_CHECKS + 1))    PASSED_CHECKS=$((PASSED_CHECKS + 1))

elseelse

    print_warning "CORS no detectado (puede causar problemas en navegador)"    print_warning "CORS no detectado (puede causar problemas en navegador)"

    WARNING_CHECKS=$((WARNING_CHECKS + 1))    WARNING_CHECKS=$((WARNING_CHECKS + 1))

fifi



# ========================================# ========================================

# 5. Verificar Scripts# 5. Verificar Scripts

# ========================================# ========================================



print_header "5. Scripts de Publicación"print_header "5. Scripts de Publicación"



print_check "Verificando script publish-to-registry.sh..."print_check "Verificando script publish-to-registry.sh..."

TOTAL_CHECKS=$((TOTAL_CHECKS + 1))TOTAL_CHECKS=$((TOTAL_CHECKS + 1))

if [ -f "scripts/publish-to-registry.sh" ]; thenif [ -f "scripts/publish-to-registry.sh" ]; then

    print_success "Existe"    print_success "Existe"

    PASSED_CHECKS=$((PASSED_CHECKS + 1))    PASSED_CHECKS=$((PASSED_CHECKS + 1))

        

    if [ -x "scripts/publish-to-registry.sh" ]; then    if [ -x "scripts/publish-to-registry.sh" ]; then

        print_info "Ejecutable"        print_info "Ejecutable"

    else    else

        print_warning "No es ejecutable - ejecuta: chmod +x scripts/publish-to-registry.sh"        print_warning "No es ejecutable - ejecuta: chmod +x scripts/publish-to-registry.sh"

    fi    fi

elseelse

    print_error "No existe"    print_error "No existe"

    FAILED_CHECKS=$((FAILED_CHECKS + 1))    FAILED_CHECKS=$((FAILED_CHECKS + 1))

fifi



# ========================================# ========================================

# 6. Descargar y Verificar Paquete# 6. Descargar y Verificar Paquete

# ========================================# ========================================



print_header "6. Validación de Paquete"print_header "6. Validación de Paquete"



if [ "$HTTP_CODE" = "200" ]; thenif [ "$HTTP_CODE" = "200" ]; then

    print_check "Descargando y verificando paquete..."    print_check "Descargando y verificando paquete..."

    TOTAL_CHECKS=$((TOTAL_CHECKS + 1))    TOTAL_CHECKS=$((TOTAL_CHECKS + 1))

        

    TEMP_FILE=$(mktemp)    TEMP_FILE=$(mktemp)

    if curl -s "$PACKAGE_URL" -o "$TEMP_FILE"; then    if curl -s "$PACKAGE_URL" -o "$TEMP_FILE"; then

        if tar -tzf "$TEMP_FILE" &> /dev/null; then        if tar -tzf "$TEMP_FILE" &> /dev/null; then

            print_success "Paquete válido (tar.gz)"            print_success "Paquete válido (tar.gz)"

            PASSED_CHECKS=$((PASSED_CHECKS + 1))            PASSED_CHECKS=$((PASSED_CHECKS + 1))

                        

            # Verificar contenido            # Verificar contenido

            FILE_COUNT=$(tar -tzf "$TEMP_FILE" | wc -l)            FILE_COUNT=$(tar -tzf "$TEMP_FILE" | wc -l)

            print_info "Archivos en paquete: $FILE_COUNT"            print_info "Archivos en paquete: $FILE_COUNT"

                        

            # Verificar package.json            # Verificar package.json

            if tar -xzOf "$TEMP_FILE" package/package.json &> /dev/null; then            if tar -xzOf "$TEMP_FILE" package/package.json &> /dev/null; then

                print_info "Contiene package/package.json"                print_info "Contiene package/package.json"

            else            else

                print_warning "No se encontró package/package.json"                print_warning "No se encontró package/package.json"

            fi            fi

        else        else

            print_error "Paquete corrupto o inválido"            print_error "Paquete corrupto o inválido"

            FAILED_CHECKS=$((FAILED_CHECKS + 1))            FAILED_CHECKS=$((FAILED_CHECKS + 1))

        fi        fi

        rm -f "$TEMP_FILE"        rm -f "$TEMP_FILE"

    else    else

        print_error "No se pudo descargar"        print_error "No se pudo descargar"

        FAILED_CHECKS=$((FAILED_CHECKS + 1))        FAILED_CHECKS=$((FAILED_CHECKS + 1))

    fi    fi

elseelse

    print_info "Saltando (paquete no accesible)"    print_info "Saltando (paquete no accesible)"

fifi



# ========================================# ========================================

# Resumen# Resumen

# ========================================# ========================================



print_header "Resumen"print_header "Resumen"



echo "Total de verificaciones: $TOTAL_CHECKS"echo "Total de verificaciones: $TOTAL_CHECKS"

echo -e "${GREEN}Exitosas: $PASSED_CHECKS${NC}"echo -e "${GREEN}Exitosas: $PASSED_CHECKS${NC}"

echo -e "${YELLOW}Advertencias: $WARNING_CHECKS${NC}"echo -e "${YELLOW}Advertencias: $WARNING_CHECKS${NC}"

echo -e "${RED}Fallidas: $FAILED_CHECKS${NC}"echo -e "${RED}Fallidas: $FAILED_CHECKS${NC}"

echo ""echo ""



# Porcentaje# Porcentaje

PERCENTAGE=$((PASSED_CHECKS * 100 / TOTAL_CHECKS))PERCENTAGE=$((PASSED_CHECKS * 100 / TOTAL_CHECKS))



if [ $FAILED_CHECKS -eq 0 ] && [ $WARNING_CHECKS -eq 0 ]; thenif [ $FAILED_CHECKS -eq 0 ] && [ $WARNING_CHECKS -eq 0 ]; then

    echo -e "${GREEN}🎉 ¡Todo perfecto! ($PERCENTAGE%)${NC}"    echo -e "${GREEN}🎉 ¡Todo perfecto! ($PERCENTAGE%)${NC}"

    EXIT_CODE=0    EXIT_CODE=0

elif [ $FAILED_CHECKS -eq 0 ]; thenelif [ $FAILED_CHECKS -eq 0 ]; then

    echo -e "${YELLOW}⚠️  Funcional con advertencias ($PERCENTAGE%)${NC}"    echo -e "${YELLOW}⚠️  Funcional con advertencias ($PERCENTAGE%)${NC}"

    EXIT_CODE=0    EXIT_CODE=0

elseelse

    echo -e "${RED}❌ Requiere correcciones ($PERCENTAGE%)${NC}"    echo -e "${RED}❌ Requiere correcciones ($PERCENTAGE%)${NC}"

    EXIT_CODE=1    EXIT_CODE=1

        

    echo ""    echo ""

    echo "Próximos pasos:"    echo "Próximos pasos:"

        

    if [ ! -f "output/package.tgz" ]; then    if [ ! -f "output/package.tgz" ]; then

        echo "  1. Generar IG: ./_genonce.sh"        echo "  1. Generar IG: ./_genonce.sh"

    fi    fi

        

    if [ "$HTTP_CODE" = "404" ]; then    if [ "$HTTP_CODE" = "404" ]; then

        echo "  2. Publicar paquete: ./scripts/publish-to-registry.sh"        echo "  2. Publicar paquete: ./scripts/publish-to-registry.sh"

    fi    fi

fifi



echo ""echo ""



exit $EXIT_CODEexit $EXIT_CODE

