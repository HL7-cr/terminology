# Descripción

Por favor incluye un resumen de los cambios realizados y el contexto relevante. Enlaza cualquier issue relacionado.

Fixes # (issue)

## Tipo de cambio

Por favor elimina las opciones que no sean relevantes:

- [ ] Corrección de error (fix) - cambio que corrige un problema
- [ ] Nueva funcionalidad (feat) - cambio que agrega funcionalidad
- [ ] Cambio disruptivo (breaking change) - corrección o funcionalidad que causaría que funcionalidades existentes no trabajen como se esperaba
- [ ] Documentación (docs) - cambios en la documentación
- [ ] Estilo (style) - cambios de formato que no afectan el significado del código
- [ ] Refactorización (refactor) - cambio de código que no corrige un error ni agrega funcionalidad
- [ ] Rendimiento (perf) - cambio que mejora el rendimiento
- [ ] Pruebas (test) - agregar pruebas faltantes o corregir pruebas existentes
- [ ] Tareas de mantenimiento (chore) - otros cambios que no modifican archivos de código fuente o pruebas
- [ ] CI/CD (ci) - cambios en la configuración o scripts de integración continua

## ¿Cómo se ha probado esto?

Por favor describe las pruebas que ejecutaste para verificar tus cambios. Proporciona instrucciones para que podamos reproducir. Lista también cualquier detalle relevante para la configuración de pruebas.

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
