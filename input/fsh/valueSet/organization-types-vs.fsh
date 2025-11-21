/* ------------------------------------------------------------------ 
 @type:         FSH-File for a FHIR® ValueSet Resource
 @about:        HL7® FHIR® TERMINOLOGY Costa Rica
 @created by:   National Working Group for FHIR® - Costa Rica
 @date:         2025-11-21
 @fhir version: 5.0.0
 @authors:      - Ministerio de Salud
                - Caja Costarricense de Seguro Social
                - Instituto Nacional de Seguros
                - DHIT Costa Rica
                - Camara Costarricense de la Salud
                - Cámara de Tecnologías de Información y Comunicación
                - Global Life-Centered Hub
--------------------------------------------------------------------*/

ValueSet: CROrganizationTypesSet
Id: cr-organization-types
Title: "Tipos de Organizaciones de Salud"
Description: "Listado de tipos de organizaciones de salud en Costa Rica basado en la clasificación del Ministerio de Salud"

* insert ValueSetMeta
* ^url = "https://hl7.or.cr/fhir/terminology/ValueSet/cr-organization-types"

* include codes from system https://hl7.or.cr/fhir/terminology/CodeSystem/organization-type
