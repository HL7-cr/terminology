# Conventional Commits en Español

Este proyecto usa Conventional Commits en español para mantener un historial claro.

## Formato

```
<tipo>(<ámbito>): <descripción>

[cuerpo opcional]

[nota al pie opcional]
```

## Tipos

- **feat**: Nueva funcionalidad
- **fix**: Corrección de error
- **docs**: Cambios en documentación
- **style**: Formato (sin cambios funcionales)
- **refactor**: Refactorización de código
- **test**: Agregar o actualizar tests
- **chore**: Tareas de mantenimiento
- **perf**: Mejoras de rendimiento
- **ci**: Cambios en CI/CD
- **build**: Cambios en sistema de build

## Ámbitos (opcionales)

- `codesystem`: Sistemas de códigos
- `valueset`: Sets de valores
- `profile`: Perfiles FHIR
- `extension`: Extensiones
- `example`: Ejemplos
- `ig`: Configuración de la IG
- `deploy`: Scripts de despliegue

## Ejemplos

```bash
feat(codesystem): agregar códigos de vacunas COVID-19

fix(valueset): corregir binding de provincia

docs: actualizar instrucciones de despliegue

chore(deps): actualizar SUSHI a 3.16.5

ci: agregar validación de develop a main
```

## Breaking Changes

Si el commit introduce cambios incompatibles:

```bash
feat(codesystem)!: cambiar estructura de códigos de ciudad

BREAKING CHANGE: Los códigos de ciudad ahora usan formato ISO
```

## Recursos

- [Conventional Commits](https://www.conventionalcommits.org/)
- [Semantic Versioning](https://semver.org/)
