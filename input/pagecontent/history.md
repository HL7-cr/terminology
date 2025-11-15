# Historial de Versiones

Esta página muestra el historial de versiones publicadas de la Guía de Implementación de Terminología FHIR para Costa Rica.

## Versiones Publicadas

### Versión 0.1.1 (Draft) - 2025-11-12

**Estado**: Borrador de desarrollo  
**Versión FHIR**: R5 (5.0.0)  
**URL**: [https://fhir.hl7.or.cr/ig/terminology/0.1.1/](https://fhir.hl7.or.cr/ig/terminology/0.1.1/)

**Descripción**: Primera versión de desarrollo - CodeSystems base para Costa Rica

**Contenido incluido**:
- CodeSystem: Cantones de Costa Rica (82 conceptos)
- CodeSystem: Distritos de Costa Rica (683 conceptos)
- CodeSystem: Provincias de Costa Rica (7 conceptos)
- CodeSystem: Código de práctica profesional (772 conceptos)
- CodeSystem: Especialidades de profesionales de salud
- CodeSystem: Roles de profesionales de salud
- CodeSystem: Vacunas administradas en Costa Rica
- CodeSystem: Tipos de identificadores
- CodeSystem: Tipos de identificadores de organizaciones
- CodeSystem: Tipos de organizaciones

---

## Construcción Continua (CI Build)

**Estado**: Desarrollo activo  
**URL**: [https://fhir.hl7.or.cr/ig/terminology/](https://fhir.hl7.or.cr/ig/terminology/)

La construcción continua (CI build) refleja el estado más reciente del código en desarrollo. Esta versión se actualiza automáticamente con cada commit al repositorio y puede contener cambios no estables.

⚠️ **Advertencia**: La construcción continua no debe usarse en sistemas de producción.

---

## Lista de Paquetes

El registro completo de versiones está disponible en formato JSON en:  
[https://fhir.hl7.or.cr/ig/terminology/package-list.json](https://fhir.hl7.or.cr/ig/terminology/package-list.json)

Este archivo sigue el estándar de [FHIR Package List](https://confluence.hl7.org/display/FHIR/NPM+Package+Specification#NPMPackageSpecification-Packagelist(package-list.json)) y es utilizado por herramientas automatizadas para gestionar dependencias de paquetes FHIR.

---

## Cómo usar versiones anteriores

### Usando el Package Manager

```bash
# Instalar la versión más reciente
fhir install hl7.fhir.cr.terminology

# Instalar una versión específica
fhir install hl7.fhir.cr.terminology@0.1.1
```

### En sushi-config.yaml

```yaml
dependencies:
  hl7.fhir.cr.terminology: 0.1.1  # Versión específica
  # o
  hl7.fhir.cr.terminology: current # Última versión CI
```

### Descarga directa

Los paquetes FHIR (.tgz) están disponibles en:  
[https://fhir.hl7.or.cr/packages/](https://fhir.hl7.or.cr/packages/)

---

## Notas de Versión

### 0.1.1 (2025-12-14)

**Nuevas características**:
- ✅ Configuración completa de jurisdicción (Costa Rica - CR)
- ✅ Idioma español (es) configurado a nivel de IG
- ✅ Todas las definiciones de conceptos completadas según estándares HL7
- ✅ Licencia CC-BY 4.0 con reconocimiento a terminologías de terceros
- ✅ Metadatos SEO implementados para mejor descubribilidad
- ✅ CI/CD con GitHub Actions para validación automática

**Correcciones**:
- ✅ Eliminadas dependencias circulares
- ✅ Corregidos warnings de HL7 sobre definiciones faltantes
- ✅ Validación QA: 0 errores

**Recursos de terminología**:
- 1544+ conceptos únicos distribuidos en 10 CodeSystems

---

*Última actualización de esta página: 2025-11-14*
