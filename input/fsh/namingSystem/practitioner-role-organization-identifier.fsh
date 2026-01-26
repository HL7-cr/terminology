/* ------------------------------------------------------------------ 
 @type:         FSH-File for a FHIR® NamingSystem Resource
 @about:        HL7® FHIR® CORE Costa Rica
 @created by:   National Working Group for FHIR® - Costa Rica
 @date:         2025-12-11
 @fhir version: 5.0.0
 @authors:      - Ministerio de Salud
                - Caja Costarricense de Seguro Social
                - DHIT Costa Rica
                - Cámara Costarricense de la Salud
                - Cámara de Tecnologías de Información y Comunicación
                - Global Life-Centered Hub
                - Instituto Nacional de Seguros
--------------------------------------------------------------------*/

Instance: NamingSystemPractitionerRoleOrganizationIdentifier
InstanceOf: NamingSystem
Usage: #definition
Title: "Sistema de Identificadores de Rol Profesional en Organizaciones"
Description: "Sistema que define los identificadores para asignaciones laborales de profesionales de salud dentro de organizaciones específicas"

* name = "PractitionerRoleOrganizationIdentifier"
* status = #active
* experimental = false
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #normative

* kind = #identifier
* date = "2025-12-11"
* publisher = "Ministerio de Salud"
* responsible = "Ministerio de Salud"
* description = "Sistema que define los identificadores asignados por organizaciones de salud a los roles de profesionales"
* usage = "Utilizado en PractitionerRole.identifier.system para identificar de forma única un rol profesional dentro de una organización específica."

* uniqueId[0].type = #uri
* uniqueId[0].value = "https://hl7.or.cr/fhir/identifier/practitioner-role-organization"
* uniqueId[0].preferred = true
