### Introducción

Esta es la página principal de acceso a la terminología de la Iniciativa HL7 Costa Rica. Este material comprende los sistemas de códigos y conjuntos de valores citados en los artefactos publicados de HL7 (estándares internacionales y guías de implementación) en un formato fácil de navegar.

Como parte del enfoque de la Iniciativa HL7 Costa Rica para proporcionar una gobernanza unificada y facilitar el acceso consistente a la terminología y el vocabulario publicados, se pretende acceder en estas páginas a todos los sistemas de códigos y conjuntos de valores publicados de las principales familias de productos HL7 dispuestos para Costa Rica. Tenga en cuenta que la unificación completa de todo el contenido terminológico de los sistemas de códigos HL7 será un esfuerzo continuo. Existe la opción de descargar la terminología junto con componentes adicionales e información de referencia. Los usuarios pueden explorar y descargar la terminología HL7 en estas páginas.

#### Licencias
Este contenido está disponible bajo la designación CC-BY-4.0. Para más información, consulte la página de detalles de la licencia de la terminologías.

### Identificación de versiones
Las versiones de la Terminología incluyen un identificador de versión de tres partes, con el formato Major.Minor.Build (similar al esquema de versiones semánticas comúnmente utilizado). En las versiones de la Terminología, el número Major indica una nueva versión principal y se actualizará ocasionalmente cuando se añada contenido nuevo significativo, se produzcan cambios sustanciales de diseño y formato, o se publiquen cambios que puedan afectar la compatibilidad con versiones anteriores. Tras una nueva versión principal, el número Minor se incrementará en uno, y tanto el número Minor como el de Build se restablecerán a cero.

El número de compilación Minor indica una instantánea de la compilación actual (ci build) realizada y publicada. Estas versiones mantendrán la coherencia interna y consistirán en uno o varios cambios aprobados en la terminología. Estas versiones se publicarán con relativa frecuencia y se realizarán para satisfacer diversas necesidades de los casos de uso nacionales y responder a las solicitudes de la comunidad para acceder al contenido modificado. El número Build se restablecerá a cero en una nueva versión menor.

El número Build de las versiones publicadas casi siempre se mantiene en cero, salvo en circunstancias excepcionales. Sin embargo, este número se incrementa en la ci build page de Terminología HL7 (enlace a "current" en la lista de Versiones Publicadas) y se incrementará con cada nueva implementación de cambios de UTG y la posterior reconstrucción del entorno de integración continua. Por lo tanto, es importante principalmente en las páginas de compilación continua y ayuda a indicar el número de tickets de UTG (representa una petición específica, como agregar o corregir un CodeSystem o ValueSet) completados desde la última versión publicada.

### Cambios y mejoras en la terminología
Para solicitar cambios en el contenido de estas páginas y participar en el proceso, consulte la información sobre participación y registro en las páginas de Mantenimiento del vocabulario HL7 para el contexto de Costa Rica.

### Política de Soporte de Versiones

La comunidad de HL7 Costa Rica mantiene un esquema de soporte de versiones balanceado entre innovación y estabilidad:

#### Versiones Soportadas

**Versión Activa (Current)**
- Versión más reciente con todas las funcionalidades y correcciones
- Soporte completo: actualizaciones, correcciones y nuevas características
- Recomendada para nuevas implementaciones

**Versión en Soporte (Deprecated)**
- Versión anterior inmediata (n-1)
- Soporte durante **12 meses** desde la nueva versión mayor
- Solo correcciones críticas de seguridad y bugs
- Transición gradual hacia la versión activa

**Versión Legacy (Critical Only)**
- Versión anterior a la deprecated (n-2)
- Soporte durante **6 meses** adicionales solo para problemas críticos
- Sin nuevas características ni correcciones menores
- Recomendada migración inmediata

#### Ciclo de Vida de Versiones

<div style="max-width: 800px; margin: 20px 0;">
  <table style="width: 100%; border-collapse: collapse; text-align: center;">
    <thead>
      <tr style="background-color: #003D5B; color: white;">
        <th style="padding: 12px; border: 1px solid #ddd;">Versión</th>
        <th style="padding: 12px; border: 1px solid #ddd;">Estado</th>
        <th style="padding: 12px; border: 1px solid #ddd;">Fecha Publicación</th>
        <th style="padding: 12px; border: 1px solid #ddd;">Fin de Soporte</th>
        <th style="padding: 12px; border: 1px solid #ddd;">Duración Soporte</th>
      </tr>
    </thead>
    <tbody>
      <tr style="background-color: #2C6E49; color: white;">
        <td style="padding: 10px; border: 1px solid #ddd;"><strong>1.0.0</strong></td>
        <td style="padding: 10px; border: 1px solid #ddd;">✓ Activa</td>
        <td style="padding: 10px; border: 1px solid #ddd;">Próxima versión</td>
        <td style="padding: 10px; border: 1px solid #ddd;">—</td>
        <td style="padding: 10px; border: 1px solid #ddd;"><strong>Soporte Completo</strong></td>
      </tr>
      <tr style="background-color: #C17817; color: white;">
        <td style="padding: 10px; border: 1px solid #ddd;"><strong>0.9.x</strong></td>
        <td style="padding: 10px; border: 1px solid #ddd;">⚠ Deprecated</td>
        <td style="padding: 10px; border: 1px solid #ddd;">Versión anterior</td>
        <td style="padding: 10px; border: 1px solid #ddd;">+12 meses</td>
        <td style="padding: 10px; border: 1px solid #ddd;"><strong>Solo Crítico</strong></td>
      </tr>
      <tr style="background-color: #5B4B8A; color: white;">
        <td style="padding: 10px; border: 1px solid #ddd;"><strong>0.8.x</strong></td>
        <td style="padding: 10px; border: 1px solid #ddd;">⊗ Legacy</td>
        <td style="padding: 10px; border: 1px solid #ddd;">Versión n-2</td>
        <td style="padding: 10px; border: 1px solid #ddd;">+6 meses</td>
        <td style="padding: 10px; border: 1px solid #ddd;"><strong>Seguridad únicamente</strong></td>
      </tr>
      <tr style="background-color: #6B7280; color: white;">
        <td style="padding: 10px; border: 1px solid #ddd;"><strong>&lt; 0.8.x</strong></td>
        <td style="padding: 10px; border: 1px solid #ddd;">✕ Sin Soporte</td>
        <td style="padding: 10px; border: 1px solid #ddd;">—</td>
        <td style="padding: 10px; border: 1px solid #ddd;">Finalizado</td>
        <td style="padding: 10px; border: 1px solid #ddd;"><strong>Migración Obligatoria</strong></td>
      </tr>
    </tbody>
  </table>
</div>

**Leyenda de Estados:**
- 🟢 **Activa**: Todas las actualizaciones, nuevas características y correcciones
- 🟠 **Deprecated**: Solo correcciones críticas de seguridad y bugs mayores (12 meses)
- 🟣 **Legacy**: Solo parches de seguridad crítica (6 meses adicionales)
- ⚫ **Sin Soporte**: Migración inmediata requerida

#### Recomendaciones para Implementadores

- **Nuevas implementaciones**: usar siempre la versión activa
- **Sistemas en producción**: planificar actualización durante periodo deprecated
- **Sistemas legacy**: migración obligatoria antes de fin de soporte
- **Pruebas**: validar compatibilidad con versión activa antes de deprecación

Esta política asegura que la comunidad pueda evolucionar la terminología mientras proporciona tiempo razonable para que los implementadores actualicen sus sistemas.