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

ValueSet: CRVaccinesAdministeredSet
Id: cr-vaccines-administered
Title: "Vacunas Administradas en Costa Rica"
Description: "Listado de vacunas administradas en Costa Rica para el contexto de la salud"

* insert ValueSetMeta
* ^url = "https://hl7.or.cr/fhir/terminology/ValueSet/cr-vaccines-administered"

* include codes from system https://hl7.or.cr/fhir/terminology/CodeSystem/vaccine-administered
