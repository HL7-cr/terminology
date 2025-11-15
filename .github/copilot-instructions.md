# Instrucciones para GitHub Copilot

## Idioma
- Todos los mensajes de commit deben estar en español
- Los comentarios en código deben estar en español
- La documentación debe estar en español

## Formato de Commits
Usar el formato de Conventional Commits en español:

```
<tipo>: <descripción breve>

<descripción detallada opcional>
```

### Tipos de commit:
- `feat`: Nueva funcionalidad
- `fix`: Corrección de error  
- `docs`: Cambios en documentación
- `style`: Formato, sin cambios en código
- `refactor`: Refactorización de código
- `test`: Agregar o actualizar tests
- `chore`: Tareas de mantenimiento
- `perf`: Mejoras de rendimiento
- `ci`: Cambios en CI/CD

### Ejemplos:
```
feat: agregar validación de códigos postales

Implementa validación para códigos postales de Costa Rica
usando el formato estándar de 5 dígitos.
```

```
fix: corregir encoding en archivos CSV

Los archivos CSV ahora se leen correctamente con UTF-8
en lugar de latin-1, evitando caracteres corruptos.
```
