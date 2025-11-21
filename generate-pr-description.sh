#!/bin/bash
# Script para generar descripción de Pull Request basado en commits
# Usage: ./generate-pr-description.sh [base-branch] [head-branch]

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Función para mostrar uso
show_usage() {
    echo "Uso: $0 [base-branch] [head-branch]"
    echo ""
    echo "Genera una descripción de Pull Request basado en los commits entre dos ramas."
    echo ""
    echo "Argumentos:"
    echo "  base-branch: Rama base (por defecto: origin/main)"
    echo "  head-branch: Rama actual (por defecto: rama actual)"
    echo ""
    echo "Ejemplo:"
    echo "  $0 origin/main feature/nueva-funcionalidad"
    echo "  $0 main feature/nueva-funcionalidad"
    echo "  $0  # Usa origin/main y la rama actual"
}

# Verificar si se solicita ayuda
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    show_usage
    exit 0
fi

# Obtener ramas
BASE_BRANCH=${1:-"origin/main"}
HEAD_BRANCH=${2:-$(git branch --show-current)}

# Verificar que estamos en un repositorio git
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "${RED}Error: No estás en un repositorio git${NC}"
    exit 1
fi

# Verificar que las ramas existen (intentar con origin/ si no existe localmente)
if ! git rev-parse --verify "$BASE_BRANCH" > /dev/null 2>&1; then
    # Intentar con origin/ prefijo si no existe
    if git rev-parse --verify "origin/$BASE_BRANCH" > /dev/null 2>&1; then
        BASE_BRANCH="origin/$BASE_BRANCH"
    else
        echo -e "${RED}Error: La rama base '$BASE_BRANCH' no existe${NC}"
        exit 1
    fi
fi

echo -e "${GREEN}Generando descripción de PR de '$HEAD_BRANCH' hacia '$BASE_BRANCH'...${NC}"
echo ""

# Obtener commits
COMMITS=$(git log --oneline "$BASE_BRANCH".."$HEAD_BRANCH" 2>/dev/null)

if [ -z "$COMMITS" ]; then
    echo -e "${YELLOW}No se encontraron commits nuevos entre $BASE_BRANCH y $HEAD_BRANCH${NC}"
    exit 0
fi

# Contar commits
COMMIT_COUNT=$(echo "$COMMITS" | wc -l)

echo "# Descripción"
echo ""

# Analizar tipo de cambios basado en conventional commits
declare -A change_types
while IFS= read -r commit; do
    commit_msg=$(echo "$commit" | cut -d' ' -f2-)
    
    if [[ $commit_msg =~ ^feat[\(:] ]]; then
        change_types["feat"]=1
    elif [[ $commit_msg =~ ^fix[\(:] ]]; then
        change_types["fix"]=1
    elif [[ $commit_msg =~ ^docs[\(:] ]]; then
        change_types["docs"]=1
    elif [[ $commit_msg =~ ^style[\(:] ]]; then
        change_types["style"]=1
    elif [[ $commit_msg =~ ^refactor[\(:] ]]; then
        change_types["refactor"]=1
    elif [[ $commit_msg =~ ^perf[\(:] ]]; then
        change_types["perf"]=1
    elif [[ $commit_msg =~ ^test[\(:] ]]; then
        change_types["test"]=1
    elif [[ $commit_msg =~ ^chore[\(:] ]]; then
        change_types["chore"]=1
    elif [[ $commit_msg =~ ^ci[\(:] ]]; then
        change_types["ci"]=1
    fi
done <<< "$COMMITS"

# Generar resumen basado en commits
echo "Este Pull Request incluye los siguientes cambios:"
echo ""

# Listar commits agrupados por tipo
for type_key in feat fix docs style refactor perf test chore ci; do
    if [ "${change_types[$type_key]}" == "1" ]; then
        echo "### Commits tipo '$type_key':"
        while IFS= read -r commit; do
            commit_msg=$(echo "$commit" | cut -d' ' -f2-)
            if [[ $commit_msg =~ ^${type_key}[\(:] ]]; then
                echo "- $commit_msg"
            fi
        done <<< "$COMMITS"
        echo ""
    fi
done

# Listar otros commits
echo "### Otros commits:"
while IFS= read -r commit; do
    commit_msg=$(echo "$commit" | cut -d' ' -f2-)
    is_typed=0
    for type_key in feat fix docs style refactor perf test chore ci; do
        if [[ $commit_msg =~ ^${type_key}[\(:] ]]; then
            is_typed=1
            break
        fi
    done
    if [ $is_typed -eq 0 ]; then
        echo "- $commit_msg"
    fi
done <<< "$COMMITS"

echo ""
echo "**Total de commits:** $COMMIT_COUNT"
echo ""
echo "## Tipo de cambio"
echo ""

# Sugerir tipos de cambio basado en conventional commits
if [ "${change_types[feat]}" == "1" ]; then
    echo "- [x] Nueva funcionalidad (feat) - cambio que agrega funcionalidad"
fi
if [ "${change_types[fix]}" == "1" ]; then
    echo "- [x] Corrección de error (fix) - cambio que corrige un problema"
fi
if [ "${change_types[docs]}" == "1" ]; then
    echo "- [x] Documentación (docs) - cambios en la documentación"
fi
if [ "${change_types[style]}" == "1" ]; then
    echo "- [x] Estilo (style) - cambios de formato que no afectan el significado del código"
fi
if [ "${change_types[refactor]}" == "1" ]; then
    echo "- [x] Refactorización (refactor) - cambio de código que no corrige un error ni agrega funcionalidad"
fi
if [ "${change_types[perf]}" == "1" ]; then
    echo "- [x] Rendimiento (perf) - cambio que mejora el rendimiento"
fi
if [ "${change_types[test]}" == "1" ]; then
    echo "- [x] Pruebas (test) - agregar pruebas faltantes o corregir pruebas existentes"
fi
if [ "${change_types[chore]}" == "1" ]; then
    echo "- [x] Tareas de mantenimiento (chore) - otros cambios que no modifican archivos de código fuente o pruebas"
fi
if [ "${change_types[ci]}" == "1" ]; then
    echo "- [x] CI/CD (ci) - cambios en la configuración o scripts de integración continua"
fi

echo ""
echo "## ¿Cómo se ha probado esto?"
echo ""
echo "<!-- Describe las pruebas realizadas -->"
echo ""
echo "## Lista de verificación:"
echo ""
echo "- [ ] Mi código sigue las guías de estilo de este proyecto"
echo "- [ ] He realizado una auto-revisión de mi código"
echo "- [ ] He realizado los cambios correspondientes en la documentación"
echo "- [ ] Mis cambios no generan nuevas advertencias"
echo ""
echo "## Para cambios en recursos FHIR:"
echo ""
echo "- [ ] He ejecutado SUSHI sin errores (\`sushi .\`)"
echo "- [ ] He ejecutado el IG Publisher sin errores (\`./_genonce.sh\`)"
echo "- [ ] He revisado el archivo \`output/qa.html\` para advertencias"
echo ""
echo -e "${GREEN}✓ Descripción generada exitosamente${NC}"
