/* ------------------------------------------------------------------ 
 @type:         FSH-File for a FHIR® CodeSystem Resource
 @about:        HL7® FHIR® TERMINOLOGY Costa Rica
 @created by:   National Working Group for FHIR® - Costa Rica
 @date:         2025-09-22
 @fhir version: 5.0.0
 @authors:      - Ministerio de Salud
                - Caja Costarricense de Seguro Social
                - Instituto Nacional de Seguros
                - DHIT Costa Rica
                - Camara Costarricense de la Salud
                - Cámara de Tecnologías de Información y Comunicación
                - Global Life-Centered Hub
--------------------------------------------------------------------*/


CodeSystem: OrganizationIdentifierTypeCodes
Id: organization-identifier-type
Title: "Identificadores para Organizaciones"
Description: "Listado de identificadores para organizaciones utilizados en Costa Rica"

* insert CodeSystemMeta
* insert RuleSetStatus (0, draft, pc)

* #cedula-juridica "Cédula Jurídica" "Identificador único asignado a personas jurídicas en Costa Rica por el Registro Nacional"
* #codigo-prestador "Código de Prestador" "Código asignado a prestadores de servicios de salud en Costa Rica"