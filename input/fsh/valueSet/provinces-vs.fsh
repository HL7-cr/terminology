/* ------------------------------------------------------------------ 
 @type:         FSH-File for a FHIR® ValueSet Resource
 @about:        HL7® FHIR® TERMINOLOGY Costa Rica
 @created by:   National Working Group for FHIR® - Costa Rica
 @date:         2025-11-20
 @fhir version: 5.0.0
 @authors:      - Ministerio de Salud
                - Caja Costarricense de Seguro Social
                - Instituto Nacional de Seguros
                - DHIT Costa Rica
                - Camara Costarricense de la Salud
                - Cámara de Tecnologías de Información y Comunicación
                - Global Life-Centered Hub
--------------------------------------------------------------------*/

ValueSet: CRProvinces
Id: cr-provinces
Title: "Provincias de Costa Rica"
Description: "Códigos de provincias de Costa Rica basados en ISO 3166-2:CR"

* insert ValueSetMeta
* ^url = "https://hl7.or.cr/fhir/terminology/ValueSet/cr-provinces"

* include codes from system https://hl7.or.cr/fhir/terminology/CodeSystem/province-codes
