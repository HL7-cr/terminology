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


CodeSystem: OrganizationIdentifierTypeCodeSystem
Id: organization-identifier-type
Title: "Tipos de Identificadores de Organizaciones en Costa Rica"
Description: "Tipos de identificadores de organizaciones utilizados en Costa Rica"

* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/standards-status"
* ^extension[=].valueCode = #trial-use   // o #informative / #normative / #draft

* ^version = "0.1.1"
* ^status = #active
* ^experimental = false
* ^publisher = "HL7 Costa Rica"
* ^contact.name = "HL7 Costa Rica"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "info@hl7.or.cr"
* ^jurisdiction = urn:iso:std:iso:3166#CR "Costa Rica"
* ^caseSensitive = true
* ^content = #complete
* ^count = 2

* #cedula-juridica "Cédula Jurídica" "Identificador único asignado a personas jurídicas en Costa Rica por el Registro Nacional"
* #codigo-prestador "Código de Prestador" "Código asignado a prestadores de servicios de salud en Costa Rica"