<!-- https://confluence.hl7.org/spaces/HAFWG/pages/218825999/Step+By+Step+running+publisher+-go-publish -->

# HL7 FHIR Costa Rica Terminología

Esta guía de implementación define los recursos de terminología FHIR utilizados por la Iniciativa HL7 Costa Rica.

## Recursos

- **CI Build**: [https://build.fhir.org/ig/HL7-cr/terminology](https://build.fhir.org/ig/HL7-cr/terminology)
- **Canonical**: https://hl7.or.cr/fhir/terminology
- **Versión Actual**: 0.0.1-ballot

## Desarrollo

### Requisitos

- SUSHI (para procesar archivos FSH)
- IG Publisher (para generar la guía de implementación)

### Construir la Guía de Implementación

```bash
# Ejecutar SUSHI para procesar archivos FSH
sushi .

# Generar la guía completa
./_genonce.sh
```


## Contribuir

Por favor lee las siguientes guías antes de contribuir:

- [Guía de Descripciones de PR](docs/pr-description-guide.md) - Cómo crear buenas descripciones de Pull Request
- [Plantilla de PR](.github/PULL_REQUEST_TEMPLATE.md) - Plantilla a seguir al crear PRs

## Licencia

Este proyecto está licenciado bajo CC-BY-4.0. Ver el archivo LICENSE para más detalles.

## Contacto

- **Organización**: Iniciativa HL7 Costa Rica
- **Web**: https://hl7.or.cr
- **Email**: info@hl7.or.cr
