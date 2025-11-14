# Configuración de GitHub Actions

Este repositorio incluye GitHub Actions para automatizar la validación y publicación de la IG.

## Workflows Disponibles

### 1. `validate-develop.yml` - Validación de develop
**Se ejecuta en:**
- Push a `develop`
- Pull Request a `main`

**Validaciones:**
- ✅ Version no sea `0.0.0`
- ✅ SUSHI ejecuta sin errores
- ✅ IG Publisher genera sin errores
- ✅ Para PR a `main`: status debe ser `active` (no `draft`)
- ✅ Para PR a `main`: releaseLabel debe ser `release`, `trial-use` o `ballot` (no `ci-build`)
- ⚠️  Advertencia si hay más de 10 warnings

**Artefactos generados:**
- `output/qa.html` - Reporte de calidad
- `output/qa.txt` - Reporte en texto
- Archivos JSON de validación

### 2. `publish-release.yml` - Publicación automática
**Se ejecuta en:**
- Push a `main`

**Acciones:**
- 📦 Genera la IG completa
- 🏷️  Crea GitHub Release con tag `v{version}`
- 📤 Sube `terminology-{version}.tar.gz` y `package.tgz`
- 📝 Genera release notes con instrucciones

## Configuración en GitHub

### 1. Proteger la rama `main`

Ve a **Settings → Branches → Add branch protection rule**:

```
Branch name pattern: main

☑️ Require a pull request before merging
   ☑️ Require approvals (1)
   
☑️ Require status checks to pass before merging
   ☑️ Require branches to be up to date before merging
   Status checks: validate / validate
   
☑️ Do not allow bypassing the above settings

☐ Allow force pushes (NUNCA)
☐ Allow deletions (NUNCA)
```

### 2. Configurar permisos de GitHub Actions

Ve a **Settings → Actions → General**:

```
Workflow permissions:
● Read and write permissions

☑️ Allow GitHub Actions to create and approve pull requests
```

### 3. Habilitar GitHub Pages (opcional)

Ve a **Settings → Pages**:

```
Source: Deploy from a branch
Branch: gh-pages / (root)
```

## Flujo de Trabajo Recomendado

### Desarrollo en `develop`
```bash
# Trabajar en develop
git checkout develop

# Hacer cambios
# ...

# Commit y push
git add .
git commit -m "feat: agregar nuevos códigos"
git push origin develop
```

**GitHub Action automáticamente:**
- ✅ Valida que SUSHI funcione
- ✅ Valida que IG Publisher funcione
- ✅ Genera artefactos para revisión

### Preparar Release para `main`

1. **Actualizar `sushi-config.yaml`:**
   ```yaml
   version: 0.2.0  # Nueva versión
   status: active   # No "draft"
   releaseLabel: release  # No "ci-build"
   date: 2025-11-14
   ```

2. **Crear Pull Request a `main`:**
   ```bash
   git checkout develop
   git push origin develop
   # En GitHub: crear PR de develop → main
   ```

3. **GitHub Action valida automáticamente:**
   - ✅ Version válida
   - ✅ Status = active
   - ✅ ReleaseLabel = release
   - ✅ Sin errores de compilación

4. **Fusionar PR:**
   - Una vez aprobado y validado
   - Merge a `main`

5. **GitHub Action publica automáticamente:**
   - 🏷️  Crea tag `v0.2.0`
   - 📦 Crea GitHub Release
   - 📤 Sube archivos para descargar

### Despliegue al Servidor

Después de la publicación en GitHub, usar los scripts de despliegue:

```bash
# 1. Desplegar configuración nginx (primera vez o si cambió)
./.deployment/_deploy-nginx.sh

# 2. Publicar paquete FHIR al servidor
./.deployment/_publish-package.sh
```

**Nota importante sobre SSH y sudo:**

Los scripts usan `ssh -t` para ejecutar comandos con `sudo` correctamente. Esto requiere:
- Acceso SSH al servidor con el usuario `hl7cr`
- Permisos de sudo en el servidor
- El flag `-t` asigna una pseudo-terminal para que sudo pueda pedir contraseña

Si obtienes error `"sudo: a terminal is required to read the password"`, verifica que:
1. El script use `ssh -t` (no solo `ssh`)
2. Tengas permisos de sudo en el servidor
3. No estés ejecutando desde un contexto sin terminal (ej: cron)

**Scripts disponibles:**
- `_deploy-nginx.sh`: Despliega nginx con backup automático y rollback
- `_publish-package.sh`: Sube paquete FHIR al registro web
- Ambos requieren ejecutarse desde máquina con SSH (no desde contenedor Docker sin configuración SSH)

## Monitoreo

### Ver estado de Actions
```
https://github.com/HL7-cr/terminology/actions
```

### Ver releases
```
https://github.com/HL7-cr/terminology/releases
```

### Revisar artefactos
En cada ejecución de workflow, descarga los artefactos generados para revisar:
- `output/qa.html` - Ver errores y warnings
- `output/qa.txt` - Resumen en texto

## Troubleshooting

### Error: "version debe ser diferente de 0.0.0"
**Solución:** Actualizar `version` en `sushi-config.yaml`

### Error: "status debe ser 'active'"
**Solución:** Para fusionar a main, cambiar `status: draft` → `status: active`

### Error: "releaseLabel debe ser 'release'"
**Solución:** Cambiar `releaseLabel: ci-build` → `releaseLabel: release`

### Warning: "La IG tiene X advertencias"
**Solución:** Revisar `output/qa.html` y corregir advertencias antes de fusionar

## Ventajas de este Setup

✅ **Validación automática** en cada push a develop
✅ **Protección de main** - solo código validado
✅ **Releases automáticos** con versionado semántico
✅ **Artefactos descargables** en GitHub Releases
✅ **Trazabilidad** completa de cambios
✅ **Prevención de errores** antes de producción
