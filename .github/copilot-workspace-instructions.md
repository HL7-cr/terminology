# Instrucciones de Workspace para GitHub Copilot

## 🇪🇸 IDIOMA: ESPAÑOL OBLIGATORIO

**TODAS las interacciones deben ser en español:**

- Mensajes de commit
- Comentarios en código
- Documentación
- Nombres de variables y funciones (cuando sea apropiado)
- Respuestas en el chat

## Mensajes de Commit

**FORMATO OBLIGATORIO: Conventional Commits en ESPAÑOL**

```
<tipo>: <descripción en español>

<cuerpo opcional en español>
```

### Tipos válidos (en español):
- `feat`: Nueva funcionalidad
- `fix`: Corrección de error
- `docs`: Cambios en documentación
- `style`: Formato, sin cambios funcionales
- `refactor`: Refactorización de código
- `test`: Agregar o actualizar tests
- `chore`: Tareas de mantenimiento
- `perf`: Mejoras de rendimiento
- `ci`: Cambios en CI/CD

### ✅ Ejemplos CORRECTOS:

```
feat: agregar validación de códigos postales costarricenses
```

```
fix: corregir encoding UTF-8 en archivos CSV

Los archivos CSV ahora se leen correctamente con UTF-8
evitando caracteres corruptos en nombres con tildes.
```

```
docs: actualizar guía de implementación con nuevos CodeSystems
```

### ❌ Ejemplos INCORRECTOS (en inglés):

```
feat: add postal code validation
fix: correct CSV encoding
docs: update implementation guide
```

## Contexto del Proyecto

Este es un proyecto de **FHIR Implementation Guide** para terminologías de Costa Rica:

- Versión FHIR: R5 (5.0.0)
- Herramienta: SUSHI 3.16.5
- Idioma de recursos: Español (es-CR)
- Servidor: fhir.hl7.or.cr

### Estructura:
- `/input/fsh/codeSystem/`: Definiciones de CodeSystems
- `/input/fsh/ruleSets/`: Reglas reutilizables
- `/.deployment/`: Scripts y configuración de despliegue
- `/fsh-generated/`: Archivos generados por SUSHI (no editar)

## Convenciones de Código

- **Comentarios**: Siempre en español
- **Commits**: Siempre usar Conventional Commits en español
- **Documentación**: Markdown en español
- **Nombres de archivos**: kebab-case (ej: `city-code.fsh`)
- **IDs de recursos FHIR**: kebab-case (ej: `city-code`)
