# Guía para Generar Descripciones de Pull Request

Esta guía explica cómo crear descripciones efectivas para Pull Requests basadas en los commits realizados.

## Herramienta Automática

El repositorio incluye un script que genera automáticamente una descripción de PR basada en los commits entre dos ramas.

### Uso Básico

```bash
# Generar descripción para la rama actual comparada con origin/main
./generate-pr-description.sh

# Especificar ramas manualmente
./generate-pr-description.sh origin/main mi-rama-feature
```

### Características

El script:
- Analiza todos los commits entre la rama base y la rama actual
- Detecta automáticamente el tipo de cambio usando conventional commits
- Genera una descripción estructurada siguiendo la plantilla del proyecto
- Agrupa los commits por tipo (feat, fix, docs, etc.)

### Ejemplo de Salida

```markdown
# Descripción

Este Pull Request incluye los siguientes cambios:

### Commits tipo 'feat':
- feat: agregar nueva funcionalidad X
- feat(api): implementar endpoint Y

### Commits tipo 'fix':
- fix: corregir error en validación
- fix(ui): solucionar problema de layout

**Total de commits:** 4

## Tipo de cambio

- [x] Nueva funcionalidad (feat) - cambio que agrega funcionalidad
- [x] Corrección de error (fix) - cambio que corrige un problema

...
```

## Mejores Prácticas

### 1. Usar Conventional Commits

Para aprovechar al máximo la herramienta, usa el formato de Conventional Commits en tus mensajes:

```
tipo(alcance): descripción breve

[cuerpo opcional]

[nota al pie opcional]
```

**Tipos comunes:**
- `feat`: Nueva funcionalidad
- `fix`: Corrección de error
- `docs`: Cambios en documentación
- `style`: Cambios de formato (no afectan lógica)
- `refactor`: Refactorización de código
- `perf`: Mejoras de rendimiento
- `test`: Adición o corrección de pruebas
- `chore`: Tareas de mantenimiento
- `ci`: Cambios en CI/CD

### 2. Escribir Commits Descriptivos

**Mal ejemplo:**
```
fix bug
update code
changes
```

**Buen ejemplo:**
```
fix(validation): corregir validación de fechas en formulario de paciente
feat(api): agregar endpoint para búsqueda de CodeSystems
docs: actualizar guía de contribución con nuevos ejemplos
```

### 3. Agrupar Cambios Relacionados

Cuando sea posible, agrupa cambios relacionados en un solo commit:

```bash
# En lugar de:
git commit -m "actualizar archivo1"
git commit -m "actualizar archivo2"
git commit -m "actualizar archivo3"

# Hacer:
git commit -m "feat(terminology): agregar nuevos CodeSystems para X, Y y Z"
```

### 4. Personalizar la Descripción Generada

El script genera una base, pero siempre debes:
1. Revisar y personalizar el resumen
2. Agregar contexto importante que no esté en los commits
3. Explicar el "por qué" de los cambios
4. Incluir enlaces a issues relacionados
5. Documentar cómo se probaron los cambios

## Ejemplo Completo

### Paso 1: Hacer commits con conventional commits

```bash
git commit -m "feat(codesystem): agregar CodeSystem para tipos de identificación"
git commit -m "feat(valueset): crear ValueSet para documentos de identidad"
git commit -m "docs: actualizar documentación con nuevos recursos"
git commit -m "test: agregar pruebas para validación de identificadores"
```

### Paso 2: Generar descripción base

```bash
./generate-pr-description.sh > /tmp/pr-description.md
```

### Paso 3: Personalizar la descripción

Edita el archivo generado para agregar:
- Contexto del problema que se resuelve
- Referencias a issues
- Instrucciones de prueba específicas
- Capturas de pantalla si aplica
- Notas sobre cambios que requieren atención especial

### Paso 4: Usar en el PR

Copia la descripción personalizada al crear el Pull Request en GitHub.

## Para Cambios en Recursos FHIR

Cuando el PR incluye cambios en recursos FHIR, asegúrate de:

1. **Ejecutar SUSHI:**
   ```bash
   sushi .
   ```

2. **Ejecutar IG Publisher:**
   ```bash
   ./_genonce.sh
   ```

3. **Revisar qa.html:**
   - Abrir `output/qa.html` en el navegador
   - Verificar que no hay errores nuevos
   - Documentar cualquier advertencia esperada

4. **Incluir en la descripción:**
   - Cambios en versión si aplica
   - Nuevos recursos agregados
   - Recursos modificados o eliminados
   - Impacto en dependencias

## Plantilla Manual

Si prefieres no usar el script, puedes usar esta plantilla:

```markdown
# Descripción

[Resumen breve del cambio y por qué es necesario]

Fixes #[número de issue]

## Tipo de cambio

- [ ] Corrección de error (fix)
- [ ] Nueva funcionalidad (feat)
- [ ] Cambio disruptivo (breaking change)
- [ ] Documentación (docs)
- [ ] Estilo (style)
- [ ] Refactorización (refactor)
- [ ] Rendimiento (perf)
- [ ] Pruebas (test)
- [ ] Tareas de mantenimiento (chore)
- [ ] CI/CD (ci)

## ¿Cómo se ha probado esto?

[Describe las pruebas realizadas]

- [ ] Prueba A
- [ ] Prueba B

## Lista de verificación:

- [ ] Mi código sigue las guías de estilo de este proyecto
- [ ] He realizado una auto-revisión de mi código
- [ ] He comentado mi código, particularmente en áreas difíciles de entender
- [ ] He realizado los cambios correspondientes en la documentación
- [ ] Mis cambios no generan nuevas advertencias
- [ ] He agregado pruebas que demuestran que mi corrección es efectiva o que mi funcionalidad trabaja
- [ ] Las pruebas unitarias nuevas y existentes pasan localmente con mis cambios
- [ ] Cualquier cambio dependiente ha sido fusionado y publicado en módulos posteriores

## Para cambios en recursos FHIR:

- [ ] He ejecutado SUSHI sin errores (`sushi .`)
- [ ] He ejecutado el IG Publisher sin errores (`./_genonce.sh`)
- [ ] He revisado el archivo `output/qa.html` para advertencias
- [ ] He actualizado la versión en `sushi-config.yaml` si corresponde
- [ ] He actualizado la fecha en `sushi-config.yaml`
```

## Recursos Adicionales

- [Conventional Commits](https://www.conventionalcommits.org/es/)
- [Plantilla de PR](.github/PULL_REQUEST_TEMPLATE.md)
