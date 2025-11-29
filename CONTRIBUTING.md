# Guía de Contribución

¡Gracias por tu interés en contribuir a la Guía de Implementación de Terminología FHIR de HL7 Costa Rica! Este documento proporciona las directrices para contribuir al proyecto.

## Tabla de Contenidos

- [Código de Conducta](#código-de-conducta)
- [Cómo Puedo Contribuir](#cómo-puedo-contribuir)
- [Proceso de Desarrollo](#proceso-de-desarrollo)
- [Estándares de Código](#estándares-de-código)
- [Proceso de Revisión](#proceso-de-revisión)
- [Recursos Adicionales](#recursos-adicionales)

## Código de Conducta

Este proyecto y todos los participantes están sujetos a nuestro [Código de Conducta](CODE_OF_CONDUCT.md). Al participar, se espera que respetes este código. Por favor reporta comportamientos inaceptables a info@hl7.or.cr.

## Cómo Puedo Contribuir

### Reportar Errores

Si encuentras un error:

1. **Verifica** que no exista un issue similar abierto
2. **Crea un issue** con:
   - Título descriptivo
   - Descripción detallada del problema
   - Pasos para reproducir
   - Comportamiento esperado vs actual
   - Logs o capturas de pantalla si aplica

### Sugerir Mejoras

Para sugerir nuevas funcionalidades o mejoras:

1. **Abre un issue** etiquetado como `enhancement`
2. **Describe claramente**:
   - El problema que resuelve
   - La solución propuesta
   - Alternativas consideradas
   - Justificación clínica o regulatoria si aplica

### Contribuir con Código

1. **Fork** el repositorio
2. **Crea una rama** desde `develop`:
   ```bash
   git checkout develop
   git pull origin develop
   git checkout -b feat/nombre-descriptivo
   ```
3. **Realiza tus cambios**
4. **Commit** siguiendo las convenciones
5. **Push** a tu fork
6. **Crea un Pull Request** a `develop`

## Proceso de Desarrollo

### Estructura del Proyecto

```
/ig
├── input/fsh/              # Definiciones FSH
│   └── codeSystem/         # Sistemas de códigos
├── input/pagecontent/      # Contenido narrativo
├── template-terminology/   # Plantilla personalizada
├── .deployment/            # Scripts de despliegue
├── .github/                # GitHub Actions y docs
└── sushi-config.yaml       # Configuración principal
```

### Flujo de Trabajo

#### 1. Crear Nueva Terminología

```bash
# Crear archivo FSH en input/fsh/codeSystem/
# Ejemplo: input/fsh/codeSystem/mi-codigo.fsh
```

**Plantilla básica:**

```fsh
CodeSystem: MiCodigoCS
Id: mi-codigo-cs
Title: "Mi Sistema de Códigos"
Description: "Descripción del sistema de códigos"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete

* #CODIGO1 "Descripción del código 1"
* #CODIGO2 "Descripción del código 2"
```

#### 2. Validar Localmente

```bash
# Ejecutar SUSHI
sushi .

# Generar IG completa
./_genonce.sh

# Revisar en http://localhost:8080
# Los archivos están en ./output/
```

#### 3. Verificar Calidad

```bash
# Revisar el reporte de calidad
# output/qa.html - debe tener 0 errores

# Para branch develop: warnings aceptables
# Para merge a main: minimizar warnings (<15)
```

#### 4. Commit y Push

```bash
# Agregar cambios
git add input/fsh/codeSystem/mi-codigo.fsh

# Commit siguiendo convenciones
git commit -m "feat(codesystem): agregar sistema de códigos de ejemplo"

# Push a tu fork
git push origin feat/mi-codigo
```

## Estándares de Código

### Convenciones de Nomenclatura

**Archivos FSH:**
- Usar kebab-case: `mi-sistema-codigo.fsh`
- Nombres descriptivos
- Un CodeSystem por archivo

**IDs de Recursos:**
- Sufijo para tipo: `-cs` (CodeSystem), `-vs` (ValueSet)
- Ejemplo: `vaccine-code-cs`, `province-code-cs`

**Títulos y Descripciones:**
- En español
- Claros y concisos
- Seguir convenciones de HL7

### Mensajes de Commit

Seguir [Conventional Commits](https://www.conventionalcommits.org/) en español:

```
<tipo>(<ámbito>): <descripción>

[cuerpo opcional]

[nota al pie opcional]
```

**Tipos:**
- `feat`: Nueva funcionalidad
- `fix`: Corrección de error
- `docs`: Cambios en documentación
- `style`: Formato (sin cambios funcionales)
- `refactor`: Refactorización de código
- `test`: Agregar o actualizar tests
- `chore`: Tareas de mantenimiento
- `ci`: Cambios en CI/CD

**Ámbitos:**
- `codesystem`: Sistemas de códigos
- `valueset`: Sets de valores
- `profile`: Perfiles FHIR
- `extension`: Extensiones
- `ig`: Configuración de la IG
- `deploy`: Scripts de despliegue

**Ejemplos:**

```bash
feat(codesystem): agregar códigos de provincias
fix(valueset): corregir binding de vacunas
docs: actualizar guía de instalación
chore(deps): actualizar SUSHI a 3.16.5
ci: agregar validación automática
```

### Estándares FHIR

- **Versión**: FHIR R5 (5.0.0)
- **Status**: Usar `draft` en develop, `active` para releases
- **Idioma**: Español (es) como predeterminado
- **Canonical URL**: `https://fhir.hl7.or.cr/ig/terminology`

### Validación de Contenido

Antes de crear un PR, asegurar:

- ✅ SUSHI compila sin errores
- ✅ IG Publisher genera sin errores
- ✅ `output/qa.html` tiene 0 errores
- ✅ Código sigue las convenciones de nomenclatura
- ✅ Documentación actualizada si es necesario
- ✅ Commit messages siguen convenciones

## Proceso de Revisión

### Pull Requests

**Requisitos mínimos:**

1. **Base branch**: `develop` (no `main`)
2. **Título descriptivo** siguiendo convenciones
3. **Descripción completa**:
   - ¿Qué cambia?
   - ¿Por qué es necesario?
   - ¿Cómo se probó?
4. **CI passing**: GitHub Actions debe pasar
5. **Sin conflictos** con develop

**Plantilla de PR:**

```markdown
## Descripción
Breve descripción de los cambios

## Tipo de cambio
- [ ] Nueva funcionalidad (feat)
- [ ] Corrección de error (fix)
- [ ] Cambio en documentación (docs)
- [ ] Otro: _______

## ¿Cómo se ha probado?
- [ ] Compilación local exitosa
- [ ] QA report sin errores
- [ ] Revisión manual del output

## Checklist
- [ ] Mi código sigue las convenciones del proyecto
- [ ] He actualizado la documentación
- [ ] He agregado pruebas si aplica
- [ ] Todos los tests pasan localmente
- [ ] Mi commit message sigue las convenciones
```

### Proceso de Aprobación

1. **Revisión automática**: GitHub Actions valida
2. **Revisión por pares**: Al menos 1 aprobación requerida
3. **Ajustes**: Incorporar feedback
4. **Merge**: Un maintainer fusiona a develop

### De develop a main

La promoción de cambios de `develop` a `main` es responsabilidad exclusiva de los **maintainers del proyecto**.

**Proceso (solo maintainers):**

1. Maintainer actualiza `sushi-config.yaml` con nueva versión y release label
2. Maintainer crea PR de `develop` → `main`
3. Validación automática estricta (0 errores, status=active, releaseLabel=release)
4. Revisión y aprobación
5. Merge y release automático

**Contribuidores externos:** No deben modificar `sushi-config.yaml` para versionamiento. Los maintainers gestionan los releases.

## Recursos Adicionales

### Documentación

- [FHIR Shorthand (FSH)](http://build.fhir.org/ig/HL7/fhir-shorthand/)
- [FHIR R5 Specification](https://hl7.org/fhir/R5/)
- [SUSHI Documentation](https://fshschool.org/)
- [IG Publisher Documentation](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation)

### Herramientas

- [FSH Online](https://fshschool.org/FSHOnline/) - Editor FSH en línea
- [FHIR Package Manager](https://www.npmjs.com/package/fhir) - Gestión de paquetes
- [VS Code Extension](https://marketplace.visualstudio.com/items?itemName=MITRE.vscode-language-fsh) - Soporte FSH

### Comunidad

- **Email**: info@hl7.or.cr
- **Sitio web**: https://hl7.or.cr
- **GitHub Issues**: https://github.com/HL7-cr/terminology/issues
- **HL7 International**: https://www.hl7.org

### Scripts Útiles

```bash
# Generar IG una vez
./_genonce.sh

# Generar continuamente (watch mode)
./_gencontinuous.sh

# Publicar versión release
./.deployment/_publish.sh

# Desplegar al servidor (desde host)
# Ver: .deployment/README.md
```

## Preguntas Frecuentes

### ¿Puedo contribuir sin conocimientos de FHIR?

Sí, puedes contribuir con:
- Correcciones de documentación
- Traducciones
- Reportar errores
- Revisar issues

### ¿Cuánto tiempo toma la revisión?

Típicamente 2-5 días hábiles. Contribuciones urgentes pueden priorizarse.

### ¿Cómo reporto un problema de seguridad?

Envía un email a info@hl7.or.cr con detalles. No uses issues públicos para problemas de seguridad.

### ¿Puedo usar este código en proyectos comerciales?

Sí, bajo los términos de la licencia del proyecto. Consulta [LICENSE](LICENSE) para detalles.

---

¿Tienes más preguntas? [Abre un issue](https://github.com/HL7-cr/terminology/issues/new) o contáctanos en info@hl7.or.cr.

¡Gracias por contribuir! 🎉
