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

CodeSystem:     IdentifierType
Id:             identifier-type
Title:          "Tipo de identificador"
Description:    "Sistema de códigos para tipos de identificadores en Costa Rica."

* ^version = "0.1.1"
* ^status = #draft
* ^experimental = false
* ^caseSensitive = false
* ^publisher = "HL7 Costa Rica"
* ^contact.name = "HL7 Costa Rica"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "info@hl7.or.cr"
* ^jurisdiction = urn:iso:std:iso:3166#CR "Costa Rica"

* #cedula-nacional "Cédula Nacional" "Identificador oficial para ciudadanos costarricenses."
* #pasaporte "Pasaporte" "Identificador para pasaporte."
* #dimex "DIMEX" "Documento de Identificación Migratorio para Extranjeros."